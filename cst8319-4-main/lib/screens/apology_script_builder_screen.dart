import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';

class ApologyScriptBuilderScreen extends StatefulWidget {
  const ApologyScriptBuilderScreen({super.key});

  @override
  State<ApologyScriptBuilderScreen> createState() =>
      _ApologyScriptBuilderScreenState();
}

class _ApologyScriptBuilderScreenState
    extends State<ApologyScriptBuilderScreen> {
  // Audio state variables (from khalils feature)
  final AudioRecorder _audioRecorder = AudioRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _recordingPath;
  bool _isRecording = false;
  bool _isPlaying = false;

  // Step tracking
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  // Step 1 - Identify the injury / event / problematic pattern
  final _injuryController = TextEditingController();
  final _uniqueImpactController = TextEditingController();

  // Step 2 - Label and validate the painful emotions
  final _scaredEventController = TextEditingController();
  final _scaredBecause1Controller = TextEditingController();
  final _scaredBecause2Controller = TextEditingController();
  final _sadEventController = TextEditingController();
  final _sadBecause1Controller = TextEditingController();
  final _sadBecause2Controller = TextEditingController();
  final _ashamedEventController = TextEditingController();
  final _ashamedBecause1Controller = TextEditingController();
  final _ashamedBecause2Controller = TextEditingController();
  final _angryEventController = TextEditingController();
  final _angryBecause1Controller = TextEditingController();
  final _angryBecause2Controller = TextEditingController();
  final _lonelyOptionalController = TextEditingController();
  final _repeatNeeded1Controller = TextEditingController();
  final _repeatNeeded2Controller = TextEditingController();
  final _repeatNeeded3Controller = TextEditingController();
  final _repeatWill1Controller = TextEditingController();
  final _repeatWill2Controller = TextEditingController();
  // Step 3 - Communicate a sincere apology
  final _apologyController = TextEditingController();
  bool _isCustomApology = false;

  // Step 4 - State what they needed and what will change
  final _whatTheyNeededController = TextEditingController();
  final _whatNeeded2Controller = TextEditingController();
  final _whatNeeded3Controller = TextEditingController();
  final _whatWillChangeController = TextEditingController();
  final _willChange2Controller = TextEditingController();
  final _willChange3Controller = TextEditingController();
  // Step 5 - Respond with validation to their reaction
  String _selectedReactionType = '';
  bool _reactionTypeChosen = false;
  String _selectedApology = '';
  final _reactionContinuationController = TextEditingController();
  String _selectedAddOn = ''; // 'A', 'B', 'C', or ''
  bool _showNeeded3 = false;
  bool _showWillChange2 = false;
  bool _showCommitmentNote = false;
  bool _showLoneliness = false;
  String _lonelyOrOverwhelmed = 'lonely';
  bool _showReactionStarter = false;
  final _customAddOnController = TextEditingController();
  // Step 6 - Repeat steps 3 and 4 (auto-suggested, editable)
  final _repeatedApologyController = TextEditingController();
  final _repeatedChangeController = TextEditingController();

  static const Map<String, String> _reactionStarters = {
    'Anger':
        "I can understand why you'd feel angry. It probably feels like too little, too late - like you've tried to show me this many times and I didn't see it or got defensive.",
    'Silence':
        "I can understand why you'd remain silent. It can be a lot. You can take the time you need, You don't even need to respond.",
    'Reassurance':
        "I can understand why you'd want to reassure me right now. You've seen me struggle before, and I know you've tried to take care of my feelings.",
    'Denial':
        "I can understand why this might be hard to take in - it's a lot to hear, and it's completely okay if you're not ready to go there yet.",
    'Pain/Grief':
        "I can understand why you'd feel that pain. This is something that's been sitting there for a long time without getting the attention it deserved.",
  };

  @override
  void dispose() {
    _injuryController.dispose();
    _uniqueImpactController.dispose();
    _scaredEventController.dispose();
    _scaredBecause1Controller.dispose();
    _scaredBecause2Controller.dispose();
    _sadEventController.dispose();
    _sadBecause1Controller.dispose();
    _sadBecause2Controller.dispose();
    _ashamedEventController.dispose();
    _ashamedBecause1Controller.dispose();
    _ashamedBecause2Controller.dispose();
    _angryEventController.dispose();
    _angryBecause1Controller.dispose();
    _angryBecause2Controller.dispose();
    _lonelyOptionalController.dispose();
    _apologyController.dispose();
    _whatTheyNeededController.dispose();
    _whatWillChangeController.dispose();
    _reactionContinuationController.dispose();
    _repeatedApologyController.dispose();
    _repeatedChangeController.dispose();
    _repeatNeeded1Controller.dispose();
    _repeatNeeded3Controller.dispose();
    _repeatWill1Controller.dispose();
    _repeatWill2Controller.dispose();
    _customAddOnController.dispose();
    _audioRecorder.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  bool _validateCurrentStep() {
    // Step 5's reaction-type chip doesn't need form validation; everything
    // else relies on the Form's TextFormField validators.
    return _formKey.currentState?.validate() ?? false;
  }

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }

  // Audio Actions using identical names and logic as File 1
  Future<void> _toggleRecording() async {
    if (_isRecording) {
      final path = await _audioRecorder.stop();
      setState(() {
        _isRecording = false;
        _recordingPath = path;
      });
      return;
    }

    if (await _audioRecorder.hasPermission()) {
      await _audioRecorder.start(
        const RecordConfig(encoder: AudioEncoder.opus),
        path: '',
      );
      setState(() {
        _isRecording = true;
        _recordingPath = null;
      });
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Microphone permission is needed to record.'),
        ),
      );
    }
  }

  Future<void> _togglePlayback() async {
    if (_recordingPath == null) return;

    if (_isPlaying) {
      await _audioPlayer.stop();
      setState(() {
        _isPlaying = false;
      });
      return;
    }

    await _audioPlayer.play(UrlSource(_recordingPath!));
    setState(() {
      _isPlaying = true;
    });
  }

  String _buildScript() {
    // Helper: joins a list of non-empty pieces with " and " between them.
    // Returns empty string if nothing has been filled in.
    String joinAnd(List<String> pieces) {
      final clean = pieces
          .map((p) => p.trim())
          .where((p) => p.isNotEmpty)
          .toList();
      if (clean.isEmpty) return '';
      if (clean.length == 1) return clean.first;
      if (clean.length == 2) return '${clean[0]} and ${clean[1]}';
      return '${clean.sublist(0, clean.length - 1).join(', ')}, and ${clean.last}';
    }

    // Helper: builds one emotion sentence, or returns null if both fields are empty.
    String? emotionSentence(String opener, String because1, String because2) {
      final joined = joinAnd([because1, because2]);
      if (joined.isEmpty) return null;
      return '$opener because $joined.';
    }

    final sections = <String>[];

    // Step 1 - Identify the injury
    sections.add(
      'I want to talk to you about ${_injuryController.text.trim()} '
      'and how hard that must have been for you. '
      'Especially because ${_uniqueImpactController.text.trim()}.',
    );

    // Step 2 - Validate emotions (only include ones the user filled in)
    final emotionLines = <String>[];

    final scared = emotionSentence(
      'I can imagine that you might have felt scared',
      _scaredBecause1Controller.text,
      _scaredBecause2Controller.text,
    );
    if (scared != null) emotionLines.add(scared);

    final sad = emotionSentence(
      'I can also imagine you might have felt sad',
      _sadBecause1Controller.text,
      _sadBecause2Controller.text,
    );
    if (sad != null) emotionLines.add(sad);

    final embarrassed = emotionSentence(
      'It would have made sense for you to feel embarrassed',
      _ashamedBecause1Controller.text,
      _ashamedBecause2Controller.text,
    );
    if (embarrassed != null) emotionLines.add(embarrassed);

    final angry = emotionSentence(
      'I can imagine you would have also felt angry',
      _angryBecause1Controller.text,
      _angryBecause2Controller.text,
    );
    if (angry != null) emotionLines.add(angry);

    if (_showLoneliness) {
      emotionLines.add(
        'And maybe you also felt really $_lonelyOrOverwhelmed carrying all those feelings on your own.',
      );
    }

    if (emotionLines.isNotEmpty) {
      sections.add(emotionLines.join('\n\n'));
    }

    // Step 3 - Apology
    if (_selectedApology.isNotEmpty) {
      sections.add(_selectedApology.replaceAll('\n', ' ').trim());
    }

    // Step 4 - What they needed + what will change
    final neededList = joinAnd([
      _whatTheyNeededController.text,
      _whatNeeded2Controller.text,
      _whatNeeded3Controller.text,
    ]);
    final willChangeList = joinAnd([
      _whatWillChangeController.text,
      _willChange2Controller.text,
    ]);

    final step4Parts = <String>[];
    if (neededList.isNotEmpty) {
      step4Parts.add(
        'I can see now that what you needed from me was $neededList.',
      );
    }
    if (willChangeList.isNotEmpty) {
      step4Parts.add(
        'Starting today, I will $willChangeList. '
        "I know it won't always go perfectly, but I am committed to working on this.",
      );
    }
    if (step4Parts.isNotEmpty) {
      sections.add(step4Parts.join('\n\n'));
    }

    // Step 5 - Reaction + repeat of 3 & 4
    final step5Parts = <String>[];

    final reactionStarter = _reactionStarters[_selectedReactionType] ?? '';
    final reactionContinuation = _reactionContinuationController.text.trim();
    final reactionLine = [
      reactionStarter,
      reactionContinuation,
    ].where((s) => s.isNotEmpty).join(' ');
    if (reactionLine.isNotEmpty) {
      step5Parts.add(reactionLine);
    }

    if (_selectedApology.isNotEmpty) {
      step5Parts.add(
        'And I want you to know ${_selectedApology.replaceAll('\n', ' ').trim()}',
      );
    }

    final repeatNeededList = joinAnd([
      _repeatNeeded1Controller.text,
      _repeatNeeded2Controller.text,
      _repeatNeeded3Controller.text,
    ]);
    if (repeatNeededList.isNotEmpty) {
      step5Parts.add(
        'I see now that what you needed from me instead was $repeatNeededList.',
      );
    }

    final repeatWillList = joinAnd([
      _repeatWill1Controller.text,
      _repeatWill2Controller.text,
    ]);
    if (repeatWillList.isNotEmpty) {
      step5Parts.add('Starting today I will $repeatWillList.');
    }

    if (step5Parts.isNotEmpty) {
      sections.add(step5Parts.join('\n\n'));
    }

    // Step 6 - Optional add-ons
    if (_selectedAddOn == 'A') {
      sections.add(
        "Your experience matters to me, and I'm here to listen whenever you're ready. "
        "It could be now, two weeks from now, or a year from now. "
        "I want to be here for you in a different way.",
      );
    } else if (_selectedAddOn == 'B') {
      sections.add(
        "If it would help to hear a little more about why things happened the way they did, "
        "I'm happy to share that. But not everyone wants that and it's completely okay if you don't. "
        "Either way, it doesn't change that it wasn't what you needed, and I see that now.",
      );
    } else if (_selectedAddOn == 'C' &&
        _customAddOnController.text.trim().isNotEmpty) {
      sections.add(_customAddOnController.text.trim());
    }

    return sections.join('\n\n');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'Therapeutic Apology',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: List.generate(6, (index) {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    height: 6,
                    decoration: BoxDecoration(
                      color: index <= _currentStep
                          ? AppColors.primary
                          : AppColors.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: _currentStep < 6
                ? Form(key: _formKey, child: _buildStepContent())
                : _buildSummaryScreen(),
          ),
        ],
      ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String label,
    String? hint,
    int maxLines = 2,
    bool required = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: required
                ? (v) => (v == null || v.trim().isEmpty) ? 'Required' : null
                : null,
          ),
        ],
      ),
    );
  }

  Widget _inlineBlank(
    TextEditingController controller, {
    double width = 140,
    bool required = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        width: width,
        child: TextFormField(
          controller: controller,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 4),
            border: UnderlineInputBorder(),
          ),
          validator: required
              ? (v) => (v == null || v.trim().isEmpty) ? 'Required' : null
              : null,
        ),
      ),
    );
  }

  // Renders a small instructional/caution note from the worksheet -
  // visually distinct from input fields so it reads as guidance, not a blank.
  Widget _noteCard(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 2),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.06),
          borderRadius: BorderRadius.circular(8),
          border: Border(
            left: BorderSide(
              color: AppColors.primary.withOpacity(0.4),
              width: 3,
            ),
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontStyle: FontStyle.italic,
            fontSize: 12,
            color: AppColors.primary.withOpacity(0.85),
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _stepScaffold(
          title: 'Step 1: Identify the Injury',
          subtitle:
              'Describe what happened and its unique impact on your child.',
          fields: [
            _textField(
              controller: _injuryController,
              // REPLACE WITH WORKSHEET TEXT
              label: 'I want to talk to you about...',
              hint: 'the event, pattern, or what was missing',
              maxLines: 3,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  '...and how hard that must have been for you.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            _textField(
              controller: _uniqueImpactController,
              // REPLACE WITH WORKSHEET TEXT
              label: 'Especially because... (optional)',
              hint: 'unique impact given their age, temperament, etc.',
              maxLines: 3,
              required: false,
            ),
            _noteCard(
              // REPLACE WITH WORKSHEET TEXT (verbatim caution note)
              "It is important to resist the temptation to include "
              "rationales for the unfolding of events.",
            ),
          ],
        );
      case 1:
        return _stepScaffold(
          title: 'Step 2: Validate the Emotional experiences ',
          subtitle:
          'Label and validate the painful emotions associated with the event. Fill in the blanks for each of these emotions.',
          fields: [
            _noteCard("Attend to each emotion listed."),
            Text(
              'Scared',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                Text(
                  'I can imagine that when',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_scaredEventController),
                Text(
                  'occurred, you might have felt scared because',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_scaredBecause1Controller),
                Text(
                  'and because',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_scaredBecause2Controller),
                Text(
                  '(relating to feeling out of control or overwhelmed)',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Sad',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                Text(
                  'I can also imagine that when',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_sadEventController),
                Text(
                  'occurred, you might have felt sad because',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_sadBecause1Controller),
                Text(
                  'and because',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_sadBecause2Controller),
                Text(
                  '(relating to longing, missing, loving)',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Embarrassed',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                Text(
                  'It would have made sense that when',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_ashamedEventController),
                Text(
                  'occurred, you felt embarrassed because',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_ashamedBecause1Controller),
                Text(
                  'and because',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_ashamedBecause2Controller),
                Text(
                  '(relating to feeling defective; too much, etc.)',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Angry',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                Text(
                  'And I can imagine that when',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_angryEventController),
                Text(
                  'occurred, you would have felt angry because',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_angryBecause1Controller),
                Text(
                  'and because',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_angryBecause2Controller),
                Text(
                  '(you deserved something more / different)',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),


            const SizedBox(height: 16),
            Text(
              'Check the box if you want to add this to your script:',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.grey.shade600,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              value: _showLoneliness,
              onChanged: (val) => setState(() => _showLoneliness = val ?? false),
              activeColor: Colors.grey.shade500,
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              title: Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                spacing: 4,
                children: [
                  Text(
                    'And maybe you also felt really',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  DropdownButton<String>(
                    value: _lonelyOrOverwhelmed,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                    items: const [
                      DropdownMenuItem(value: 'lonely', child: Text('lonely')),
                      DropdownMenuItem(value: 'overwhelmed', child: Text('overwhelmed')),
                    ],
                    onChanged: (val) => setState(() => _lonelyOrOverwhelmed = val ?? 'lonely'),
                  ),
                  Text(
                    'carrying all those feelings on your own.',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      case 2:
        return _stepScaffoldNoValidation(
          title: 'Step 3: Apologize',
          subtitle: 'Choose the option that feels most true to you.',
          fields: [
            ...[
              'I am so sorry for the pain this caused you.',
              'I am so sorry. I really am.',
              'I am sorry for all the ways that hurt you.',
            ].map((option) {
              final isSelected =
                  !_isCustomApology && _selectedApology == option;
              return GestureDetector(
                onTap: () => setState(() {
                  _isCustomApology = false;
                  _selectedApology = option;
                }),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary.withOpacity(0.12)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : Colors.grey.shade200,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Text(
                    option,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: isSelected ? AppColors.primary : Colors.black87,
                    ),
                  ),
                ),
              );
            }),
            GestureDetector(
              onTap: () => setState(() {
                _isCustomApology = true;
                _selectedApology = _apologyController.text;
              }),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _isCustomApology
                      ? AppColors.primary.withOpacity(0.12)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _isCustomApology
                        ? AppColors.primary
                        : Colors.grey.shade200,
                    width: _isCustomApology ? 2 : 1,
                  ),
                ),
                child: Text(
                  'Write your own',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: _isCustomApology
                        ? AppColors.primary
                        : Colors.black87,
                  ),
                ),
              ),
            ),
            if (_isCustomApology)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Write your own apology...',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _apologyController,
                      maxLines: 3,
                      onChanged: (value) => setState(() {
                        _selectedApology = value;
                      }),
                      decoration: InputDecoration(
                        hintText: 'e.g. I am truly sorry for what happened.',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      case 3:
        return _stepScaffold(
          title: 'Step 4: Name What They Needed',
          subtitle: 'State what they needed instead, and what will change.',
          fields: [
            _noteCard("Ensure follow through is possible."),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                Text(
                  'I can see now that what you needed from me was',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_whatTheyNeededController),
                Text('and', style: Theme.of(context).textTheme.bodyLarge),
                _inlineBlank(_whatNeeded2Controller),
                Text(
                  'and, (optionally)',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_whatNeeded3Controller, required: false),
              ],
            ),
            const SizedBox(height: 32),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                Text(
                  'Starting today, I will',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_whatWillChangeController),
                Text('and', style: Theme.of(context).textTheme.bodyLarge),
                _inlineBlank(_willChange2Controller),
                Text(
                  'and, (optionally)',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                _inlineBlank(_willChange3Controller, required: false),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'Check the box if you want to add this to your script:',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.grey.shade600,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              value: _showCommitmentNote,
              onChanged: (val) =>
                  setState(() => _showCommitmentNote = val ?? false),
              activeColor: Colors.grey.shade500,
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              title: Text(
                "I know it won't always go perfectly, but I am committed to working on this.",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        );
      case 4:
        return _stepScaffoldNoValidation(
          title: 'Step 5: Validate Their Reaction, Then Repeat Steps 3 & 4',
          subtitle:
              'Select how your child is most likely to respond, then continue in your own words.',
          fields: [
            Center(
              child: Wrap(
                spacing: 8,
                children: _reactionStarters.keys.map((key) {
                  return ChoiceChip(
                    label: Text(key[0].toUpperCase() + key.substring(1)),
                    selected: _selectedReactionType == key,
                    onSelected: (_) => setState(() {
                      _selectedReactionType = key;
                      _reactionTypeChosen = true;
                    }),
                  );
                }).toList(),
              ),
            ),
            if (_reactionTypeChosen) ...[
              const SizedBox(height: 16),
              Text(
                'Check the box if you want to add this to your script:',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 8),
              CheckboxListTile(
                value: _showReactionStarter,
                onChanged: (val) =>
                    setState(() => _showReactionStarter = val ?? false),
                activeColor: Colors.grey.shade500,
                checkColor: Colors.white,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  _reactionStarters[_selectedReactionType] ?? '',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _textField(
                controller: _reactionContinuationController,
                label: 'OR write in your own words (optional)',
                maxLines: 3,
                required: false,
              ),
              const SizedBox(height: 16),
              _noteCard(
                'Then repeat Steps 3 and 4 with some variation in language so that it\'s not exactly the same.',
              ),
              Text(
                'And I want you to know ${_selectedApology.replaceAll('\n', ' ').trim()}.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 12),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    'I see now that what you needed from me instead was',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  _inlineBlank(_repeatNeeded1Controller, required: false),
                  Text('and', style: Theme.of(context).textTheme.bodyLarge),
                  _inlineBlank(_repeatNeeded2Controller, required: false),
                  Text('and', style: Theme.of(context).textTheme.bodyLarge),
                  _inlineBlank(_repeatNeeded3Controller),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    'Starting today I will',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  _inlineBlank(_repeatWill1Controller, required: false),
                  Text('and', style: Theme.of(context).textTheme.bodyLarge),
                  _inlineBlank(_repeatWill2Controller),
                ],
              ),
            ],
          ],
        );
      case 5:
        return _stepScaffoldNoValidation(
          title: 'Step 6: Optional Add-Ons',
          subtitle: 'Choose one if it feels right, or skip to see your script.',
          fields: [
            ...[
              {
                'key': 'A',
                'label': 'Option A: Invitation to share',
                'text':
                    'Your experience matters to me, and I\'m here to listen whenever you\'re ready. It could be now, two weeks from now, or a year from now. I want to be here for you in a different way.',
              },
              {
                'key': 'B',
                'label': 'Option B: Offer to explain',
                'text':
                    'If it would help to hear a little more about why things happened the way they did, I\'m happy to share that. But not everyone wants that - and it\'s completely okay if you don\'t. Either way, it doesn\'t change that it wasn\'t what you needed, and I see that now.',
              },
            ].map((option) {
              final isSelected = _selectedAddOn == option['key'];
              return GestureDetector(
                onTap: () => setState(() {
                  _selectedAddOn = isSelected ? '' : option['key']!;
                }),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary.withOpacity(0.12)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : Colors.grey.shade200,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        option['label']!,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: isSelected
                                  ? AppColors.primary
                                  : Colors.black87,
                            ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        option['text']!,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey.shade600,
                          fontStyle: FontStyle.italic,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () => setState(() {
                _selectedAddOn = _selectedAddOn == 'C' ? '' : 'C';
              }),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _selectedAddOn == 'C'
                      ? AppColors.primary.withOpacity(0.12)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _selectedAddOn == 'C'
                        ? AppColors.primary
                        : Colors.grey.shade200,
                    width: _selectedAddOn == 'C' ? 2 : 1,
                  ),
                ),
                child: Text(
                  'Option C: Write your own',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: _selectedAddOn == 'C'
                        ? AppColors.primary
                        : Colors.black87,
                  ),
                ),
              ),
            ),
            if (_selectedAddOn == 'C')
              _textField(
                controller: _customAddOnController,
                label: 'Write your own closing...',
                maxLines: 3,
                required: false,
              ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _stepScaffold({
    required String title,
    required String subtitle,
    required List<Widget> fields,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(subtitle, style: Theme.of(context).textTheme.bodyLarge!),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: fields,
              ),
            ),
          ),
          _navigationRow(
            onNext: () {
              if (_validateCurrentStep()) {
                setState(() => _currentStep++);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _stepScaffoldNoValidation({
    required String title,
    required String subtitle,
    required List<Widget> fields,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(subtitle, style: Theme.of(context).textTheme.bodyLarge!),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: fields,
              ),
            ),
          ),
          _navigationRow(
            onNext: () {
              if (_currentStep == 2 && _selectedApology.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select an option.')),
                );
                return;
              }
              setState(() => _currentStep++);
            },
          ),
        ],
      ),
    );
  }

  Widget _navigationRow({required VoidCallback onNext}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (_currentStep > 0)
          TextButton(
            onPressed: () => setState(() => _currentStep--),
            child: const Text('Back'),
          )
        else
          const SizedBox.shrink(),
        ElevatedButton(
          onPressed: onNext,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            _currentStep == 5 ? 'See My Script' : 'Next',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryScreen() {
    final script = _buildScript();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Apology Script',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Here is your complete therapeutic apology:',
            style: Theme.of(context).textTheme.bodyLarge!,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primary.withOpacity(0.3)),
              ),
              child: SingleChildScrollView(
                child: Text(
                  script,
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: script));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Script copied to clipboard!')),
                );
              },
              icon: const Icon(Icons.copy, color: Colors.white),
              label: const Text(
                'Copy to Clipboard',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // --- Khalil's Shared Audio Component Layout ---
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 12),
          Text(
            'Practice Out Loud',
            style: GoogleFonts.nunito(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _toggleRecording,
              icon: Icon(
                _isRecording
                    ? Icons.stop_circle_outlined
                    : Icons.mic_none_rounded,
                size: 18,
                color: _isRecording ? Colors.red : null,
              ),
              label: Text(
                _isRecording ? 'Stop Recording' : 'Click to record and review',
              ),
            ),
          ),
          if (_recordingPath != null && !_isRecording) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _togglePlayback,
                icon: Icon(
                  _isPlaying
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                  size: 18,
                ),
                label: Text(_isPlaying ? 'Pause Playback' : 'Play Recording'),
              ),
            ),
          ],

          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => setState(() {
                _currentStep = 0;
                _injuryController.clear();
                _uniqueImpactController.clear();
                _scaredEventController.clear();
                _scaredBecause1Controller.clear();
                _scaredBecause2Controller.clear();
                _sadEventController.clear();
                _sadBecause1Controller.clear();
                _sadBecause2Controller.clear();
                _ashamedEventController.clear();
                _ashamedBecause1Controller.clear();
                _ashamedBecause2Controller.clear();
                _angryEventController.clear();
                _angryBecause1Controller.clear();
                _angryBecause2Controller.clear();
                _apologyController.clear();
                _whatTheyNeededController.clear();
                _whatWillChangeController.clear();
                _reactionContinuationController.clear();
                _repeatedApologyController.clear();
                _repeatedChangeController.clear();
                _whatNeeded2Controller.clear();
                _whatNeeded3Controller.clear();
                _willChange2Controller.clear();
                _repeatNeeded1Controller.clear();
                _repeatNeeded2Controller.clear();
                _repeatNeeded3Controller.clear();
                _repeatWill1Controller.clear();
                _repeatWill2Controller.clear();
                _customAddOnController.clear();
                _selectedAddOn = '';
                _showNeeded3 = false;
                _showWillChange2 = false;
                _showCommitmentNote = false;
                _showLoneliness = false;
                _lonelyOrOverwhelmed = 'lonely';
                _selectedReactionType = 'anger';
                _recordingPath = null;
              }),
              child: const Text('Start Over'),
            ),
          ),
        ],
      ),
    );
  }
}
