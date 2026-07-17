import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'apology_guide_screen.dart';
import '../theme.dart';


class ApologyScriptBuilderScreen extends StatefulWidget {
  const ApologyScriptBuilderScreen({super.key});

  @override
  State<ApologyScriptBuilderScreen> createState() =>
      _ApologyScriptBuilderScreenState();
}

class _ApologyScriptBuilderScreenState
    extends State<ApologyScriptBuilderScreen> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  // Step 1 - Identify the injury / event / problematic pattern
  final _injuryController = TextEditingController();
  final _uniqueImpactController = TextEditingController();

  // Step 2 - Label and validate the painful emotions
  final _scaredBecause1Controller = TextEditingController();
  final _scaredBecause2Controller = TextEditingController();
  final _sadBecause1Controller = TextEditingController();
  final _sadBecause2Controller = TextEditingController();
  final _ashamedBecause1Controller = TextEditingController();
  final _ashamedBecause2Controller = TextEditingController();
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

  // Step 4 - State what they needed and what will change
  final _whatTheyNeededController = TextEditingController();
  final _whatWillChangeController = TextEditingController();
  final _whatNeeded2Controller = TextEditingController();
  final _whatNeeded3Controller = TextEditingController();
  final _willChange2Controller = TextEditingController();
  // Step 5 - Respond with validation to their reaction
  String _selectedReactionType = 'anger';
  String _selectedApology = '';
  final _reactionContinuationController = TextEditingController();
  String _selectedAddOn = ''; // 'A', 'B', 'C', or ''
  bool _showNeeded3 = false;
  bool _showWillChange2 = false;
  bool _showCommitmentNote = false;
  bool _showReactionStarter = false;
  final _customAddOnController = TextEditingController();
  // Step 6 - Repeat steps 3 and 4 (auto-suggested, editable)
  final _repeatedApologyController = TextEditingController();
  final _repeatedChangeController = TextEditingController();

  static const Map<String, String> _reactionStarters = {
    'anger': "I can understand why you'd feel angry. It probably feels like too little, too late - like you've tried to show me this many times and I didn't see it or got defensive.",
    'reassurance': "I can understand why you'd want to reassure me right now. You've seen me struggle before, and I know you've tried to take care of my feelings.",
    'denial': "I can understand why this might be hard to take in - it's a lot to hear, and it's completely okay if you're not ready to go there yet.",
    'pain': "I can understand why you'd feel that pain. This is something that's been sitting there for a long time without getting the attention it deserved.",
  };

  @override
  void dispose() {
    _injuryController.dispose();
    _uniqueImpactController.dispose();
    _scaredBecause1Controller.dispose();
    _sadBecause1Controller.dispose();
    _ashamedBecause1Controller.dispose();
    _angryBecause1Controller.dispose();
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
    super.dispose();
  }

  bool _validateCurrentStep() {
    // Step 5's reaction-type chip doesn't need form validation; everything
    // else relies on the Form's TextFormField validators.
    return _formKey.currentState?.validate() ?? false;
  }

  String _buildScript() {
    final buffer = StringBuffer();

    // Step 1
    buffer.writeln(
      // REPLACE WITH WORKSHEET TEXT
      "I want to talk to you about ${_injuryController.text} and how hard "
          "that must have been for you. Especially because "
          "${_uniqueImpactController.text}.",
    );
    buffer.writeln();

    // Step 2
    buffer.writeln(
      "I can imagine that when it occurred, you might have felt scared because "
          "${_scaredBecause1Controller.text}.",
    );
    buffer.writeln();
    buffer.writeln(
      "I can also imagine you might have felt sad because "
          "${_sadBecause1Controller.text}.",
    );
    buffer.writeln();
    buffer.writeln(
      "It would have made sense if you felt embarrassed because "
          "${_ashamedBecause1Controller.text}.",
    );
    buffer.writeln();
    buffer.writeln(
      "And I can imagine you would have felt angry because "
          "${_angryBecause2Controller.text}.",
    );
    if (_lonelyOptionalController.text.trim().isNotEmpty) {
      buffer.writeln();
      buffer.writeln(_lonelyOptionalController.text);
    }
    buffer.writeln();

    // Step 3
    buffer.writeln(_selectedApology);
    buffer.writeln();

    // Step 4
    buffer.writeln(
      "I can see now that what you needed from me was "
          "${_whatTheyNeededController.text}.\n\n"
          "Starting today, I will ${_whatWillChangeController.text}.",
    );
    if (_showCommitmentNote) {
      buffer.writeln(
        "I know it won't always go perfectly, but I am committed to working on this.",
      );
    }

    // Step 5
    buffer.writeln(
      "${_reactionStarters[_selectedReactionType] ?? ''} "
          "${_reactionContinuationController.text}\n\n"
          "And I want you to know - $_selectedApology. "
          "I see now that what you needed from me instead was "
          "${_repeatNeeded1Controller.text} and "
          "${_repeatNeeded2Controller.text} and "
          "${_repeatNeeded3Controller.text}. "
          "Starting today I will ${_repeatWill1Controller.text} and "
          "${_repeatWill2Controller.text}.",
    );
    // Step 6
    if (_selectedAddOn == 'A') {
      buffer.writeln(
        "Your experience matters to me, and I'm here to listen whenever you're ready. "
            "It could be now, two weeks from now, or a year from now. "
            "I want to be here for you in a different way.",
      );
    } else if (_selectedAddOn == 'B') {
      buffer.writeln(
        "If it would help to hear a little more about why things happened the way they did, "
            "I'm happy to share that. But not everyone wants that - and it's completely okay if you don't. "
            "Either way, it doesn't change that it wasn't what you needed, and I see that now.",
      );
    } else if (_selectedAddOn == 'C' && _customAddOnController.text.trim().isNotEmpty) {
      buffer.writeln(_customAddOnController.text);
    }

    return buffer.toString().trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text('Therapeutic Apology', style: Theme.of(context).textTheme.headlineMedium),
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
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            validator: required
                ? (v) => (v == null || v.trim().isEmpty) ? 'Required' : null
                : null,
          ),
        ],
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
            left: BorderSide(color: AppColors.primary.withOpacity(0.4), width: 3),
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
          title: 'Step 2: Validate the Emotions',
          subtitle: 'Label and validate the painful emotions associated with the event ',
          fields: [
            _noteCard(
              // REPLACE WITH WORKSHEET TEXT
              "Attend to each emotion listed.",
            ),
            Text('Scared', style: Theme.of(context).textTheme.bodyLarge!),
            _textField(
                controller: _scaredBecause1Controller,
                label: 'I can imagine that when ___ occurred, you might have felt scared because... and because... (relating to feeling out of control or overwhelmed)',
                maxLines: 3,
                required: false),
            const SizedBox(height: 8),
            _textField(
                controller: _sadBecause1Controller,
                label: 'I can also imagine you might have felt sad because... and because... (relating to longing, missing, loving)',
                maxLines: 3,
                required: false),
            const SizedBox(height: 8),
            Text('Embarassed', style: Theme.of(context).textTheme.bodyLarge!),
            _textField(
                controller: _ashamedBecause1Controller,
                label: 'It would have made sense if you felt embarrassed because... and because... (relating to feeling defective; too much, etc.)',
                maxLines: 3,
                required: false),
            const SizedBox(height: 8),
            _textField(
                controller: _angryBecause2Controller,
                label: 'And I can imagine you would have felt angry because... and because... (you deserved something more / different)',
                maxLines: 3,
                required: false),
            const SizedBox(height: 8),
            Text('Optional: loneliness/overwhelm', style: Theme.of(context).textTheme.bodyLarge!),
            _textField(
              controller: _lonelyOptionalController,
              label: 'And maybe you also felt really alone carrying all of these feelings (optional)',
              required: false,
              maxLines: 2,
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
              final isSelected = _selectedApology == option;
              return GestureDetector(
                onTap: () => setState(() => _selectedApology = option),
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
                      color: isSelected
                          ? AppColors.primary
                          : Colors.black87,
                    ),
                  ),
                ),
              );
            }),
          ],
        );
      case 3:
        return _stepScaffold(
          title: 'Step 4: Name What They Needed',
          subtitle: 'State what they needed instead, and what will change.',
          fields: [
            _noteCard("Ensure follow through is possible."),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'I can see now that what you needed from me was...',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 6),
            _textField(
              controller: _whatTheyNeededController,
              label: 'and...',
              maxLines: 3,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Starting today, I will...',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 6),
            _textField(
              controller: _whatWillChangeController,
              label: 'and...',
              maxLines: 3,
            ),
            const SizedBox(height: 12),
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
              onChanged: (val) => setState(() => _showCommitmentNote = val ?? false),
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
          subtitle: 'Select how your child is most likely to respond, then continue in your own words.',
          fields: [
            Wrap(
              spacing: 8,
              children: _reactionStarters.keys.map((key) {
                return ChoiceChip(
                  label: Text(key[0].toUpperCase() + key.substring(1)),
                  selected: _selectedReactionType == key,
                  onSelected: (_) =>
                      setState(() => _selectedReactionType = key),
                );
              }).toList(),
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
              value: _showReactionStarter,
              onChanged: (val) => setState(() => _showReactionStarter = val ?? false),
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
              label: 'OR Write in your own words (optional)',
              maxLines: 3,
              required: false,
            ),
            const SizedBox(height: 16),
            _noteCard(
              'Then repeat Steps 3 and 4 with some variation in language so that it\'s not exactly the same.',
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'And I want you to know - $_selectedApology. I see now that what you needed from me instead was...',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 6),
            _textField(
              controller: _repeatNeeded1Controller,
              label: 'First thing...',
              maxLines: 2,
              required: false,
            ),
            _textField(
              controller: _repeatNeeded2Controller,
              label: 'and...',
              maxLines: 2,
              required: false,
            ),
            _textField(
              controller: _repeatNeeded3Controller,
              label: 'and...',
              maxLines: 2,
              required: false,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Starting today I will...',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 6),
            _textField(
              controller: _repeatWill1Controller,
              label: 'First commitment...',
              maxLines: 2,
              required: false,
            ),
            _textField(
              controller: _repeatWill2Controller,
              label: 'and...',
              maxLines: 2,
              required: false,
            ),
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
                'text': 'Your experience matters to me, and I\'m here to listen whenever you\'re ready. It could be now, two weeks from now, or a year from now. I want to be here for you in a different way.',
              },
              {
                'key': 'B',
                'label': 'Option B: offer to explain',
                'text': 'If it would help to hear a little more about why things happened the way they did, I\'m happy to share that. But not everyone wants that - and it\'s completely okay if you don\'t. Either way, it doesn\'t change that it wasn\'t what you needed, and I see that now.',
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
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
          Expanded(child: SingleChildScrollView(child: Column(children: fields))),
          _navigationRow(onNext: () {
            if (_validateCurrentStep()) {
              setState(() => _currentStep++);
            }
          }),
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
          Expanded(child: SingleChildScrollView(child: Column(children: fields))),
          _navigationRow(onNext: () {
            if (_currentStep == 2 && _selectedApology.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please select an option.')),
              );
              return;
            }
            setState(() => _currentStep++);
          }),
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
          Text('Your Apology Script', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text('Here is your complete therapeutic apology:',
              style: Theme.of(context).textTheme.bodyLarge!),
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
                child: Text(script, style: Theme.of(context).textTheme.bodyLarge!),
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
              label: const Text('Copy to Clipboard',
                  style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => setState(() {
                _currentStep = 0;
                _injuryController.clear();
                _uniqueImpactController.clear();
                _scaredBecause1Controller.clear();
                _scaredBecause2Controller.clear();
                _sadBecause1Controller.clear();
                _sadBecause2Controller.clear();
                _ashamedBecause1Controller.clear();
                _ashamedBecause2Controller.clear();
                _angryBecause1Controller.clear();
                _angryBecause2Controller.clear();
                _lonelyOptionalController.clear();
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
                _selectedReactionType = 'anger';
              }),
              child: const Text('Start Over'),
            ),
          ),
        ],
      ),

    );
  }
}