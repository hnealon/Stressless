import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../theme.dart';

class ScriptBuilderScreen extends StatefulWidget {
  const ScriptBuilderScreen({super.key});

  @override
  State<ScriptBuilderScreen> createState() => _ScriptBuilderScreenState();
}

class _ScriptBuilderScreenState extends State<ScriptBuilderScreen> {
  String? _selectedStarter;
  String? _selectedVerb;
  final TextEditingController _phraseController = TextEditingController();
  final TextEditingController _because1Controller = TextEditingController();
  final TextEditingController _because2Controller = TextEditingController();
  final TextEditingController _because3Controller = TextEditingController();
  final List<String> _selectedEmotionalSupports = [];
  final List<String> _selectedPracticalSupports = [];
  final TextEditingController _customEmotionalSupportController =
  TextEditingController();
  final TextEditingController _customPracticalSupportController =
  TextEditingController();

  String _generatedScript = '';

  final AudioRecorder _audioRecorder = AudioRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();

  String? _recordingPath;
  bool _isRecording = false;
  bool _isPlaying = false;

  final List<String> _starters = [
    "I could understand you might",
    "I can imagine you",
    "No wonder you",
    "It makes sense that you",
    "I will never fully understand, but when I try to put myself in your shoes, I imagine you",
    "When I try to see it from your perspective, I imagine you might",
  ];

  final List<String> _verbs = [
    "feel",
    "think",
    "want to",
    "don't want to",
    "not want to",
  ];

  final List<String> _emotionalStarters = [
    "I'm here with you.",
    "I believe it's going to be okay",
    "I know you're doing the best you can right now.",
    "I believe in you.",
    "I know you can do this.",
    "We're in this together.",
    "I want the best for you too.",
    "Other (Write your own)",
  ];

  final List<String> _practicalStarters = [
    "Let's make a plan for how to handle this.",
    "How about we do something calming together, like listening to music?",
    "Let's set aside some special time for just us later.",
    "Would you like me to help you brainstorm some ideas?",
    "It's important that we finish this, but we can take a short break first.",
    "I'm here with you, and that's all that matters right now.",
    "Other (Write your own)",
  ];

  @override
  void initState() {
    super.initState();
    _phraseController.addListener(_updateScript);
    _because1Controller.addListener(_updateScript);
    _because2Controller.addListener(_updateScript);
    _because3Controller.addListener(_updateScript);
    _customEmotionalSupportController.addListener(_updateScript);
    _customPracticalSupportController.addListener(_updateScript);

    _audioPlayer.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _phraseController.dispose();
    _because1Controller.dispose();
    _because2Controller.dispose();
    _because3Controller.dispose();
    _customEmotionalSupportController.dispose();
    _customPracticalSupportController.dispose();
    _audioRecorder.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _toggleRecording() async {
    try {
      if (_isRecording) {
        final String? savedPath = await _audioRecorder.stop();

        if (!mounted) return;

        setState(() {
          _isRecording = false;
          _recordingPath = savedPath;
        });

        if (savedPath == null || savedPath.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The recording could not be saved.'),
            ),
          );
        }

        return;
      }

      if (_isPlaying) {
        await _audioPlayer.stop();
      }

      final bool hasPermission = await _audioRecorder.hasPermission();

      if (!hasPermission) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Microphone permission is needed to record.'),
          ),
        );

        return;
      }

      final directory = await getApplicationDocumentsDirectory();

      final String recordingPath =
          '${directory.path}/practice_recording_'
          '${DateTime.now().millisecondsSinceEpoch}.wav';

      await _audioRecorder.start(
        const RecordConfig(
          encoder: AudioEncoder.wav,
          sampleRate: 44100,
          numChannels: 1,
        ),
        path: recordingPath,
      );

      if (!mounted) return;

      setState(() {
        _isRecording = true;
        _isPlaying = false;
        _recordingPath = null;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _isRecording = false;
        _isPlaying = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Recording failed: $error')),
      );

      debugPrint('Recording error: $error');
    }
  }

  Future<void> _togglePlayback() async {
    try {
      final String? path = _recordingPath;

      if (path == null || path.isEmpty) {
        return;
      }

      if (_isPlaying) {
        await _audioPlayer.pause();

        if (!mounted) return;

        setState(() {
          _isPlaying = false;
        });

        return;
      }

      await _audioPlayer.play(DeviceFileSource(path));

      if (!mounted) return;

      setState(() {
        _isPlaying = true;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _isPlaying = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Playback failed: $error')),
      );

      debugPrint('Playback error: $error');
    }
  }

  void _updateScript() {
    if (!mounted) return;

    setState(() {
      _generatedScript = _buildCustomScript();
    });
  }

  String _buildCustomScript() {
    final starter = _selectedStarter ?? '[Starter]';
    final verb = _selectedVerb != null
        ? _selectedVerb!.replaceAll('...', '')
        : '[verb]';
    final phrase = _phraseController.text.isNotEmpty
        ? _phraseController.text
        : '...';

    String becauseClause = '';
    if (_because1Controller.text.isNotEmpty &&
        _because2Controller.text.isNotEmpty &&
        _because3Controller.text.isNotEmpty) {
      becauseClause =
      'because ${_because1Controller.text}, ${_because2Controller.text}, and ${_because3Controller.text}';
    }

    final emotional = _selectedEmotionalSupports
        .map((e) {
      if (e == "Other (Write your own)") {
        return _customEmotionalSupportController.text;
      }
      return e;
    })
        .join(' ');

    final practical = _selectedPracticalSupports
        .map((e) {
      if (e == "Other (Write your own)") {
        return _customPracticalSupportController.text;
      }
      return e;
    })
        .join(' ');

    var validationPart = '$starter $verb $phrase';

    if (becauseClause.isNotEmpty) {
      validationPart += ' $becauseClause';
    }

    validationPart += '.';

    return '$validationPart ${emotional.isNotEmpty ? emotional : ''} ${practical.isNotEmpty ? practical : ''}'
        .trim();
  }

  bool get _hasCompleteScript {
    return _selectedStarter != null &&
        _selectedVerb != null &&
        _phraseController.text.isNotEmpty &&
        _because1Controller.text.isNotEmpty &&
        _because2Controller.text.isNotEmpty &&
        _because3Controller.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SCRIPT BUILDER',
                      style: GoogleFonts.nunito(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: 1.4,
                      ),
                    ).animate().fadeIn(duration: 300.ms),
                    const SizedBox(height: 4),
                    Text(
                      'Build a validation and support script.',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        height: 1.15,
                      ),
                    ).animate().fadeIn(delay: 80.ms, duration: 400.ms),
                    const SizedBox(height: 10),
                    Text(
                      'Build your own script from scratch. Your script assembles at the bottom as you go.',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                        height: 1.6,
                      ),
                    ).animate().fadeIn(delay: 160.ms, duration: 400.ms),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildCustomBuilderSection(),
                  const SizedBox(height: 32),
                  _buildGeneratedScript(),
                  const SizedBox(height: 32),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomBuilderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubSectionTitle('Sentence Starter', 'Select a sentence starter.'),
        _buildChoiceChipGroup(_starters, _selectedStarter, (selected) {
          setState(() {
            _selectedStarter = selected;
          });
          _updateScript();
        }),
        const SizedBox(height: 24),
        _buildSubSectionTitle('Verb', 'Select a verb.'),
        _buildChoiceChipGroup(_verbs, _selectedVerb, (selected) {
          setState(() {
            _selectedVerb = selected;
          });
          _updateScript();
        }),
        const SizedBox(height: 24),
        _buildSubSectionTitle(
          'Feeling/Action Phrase',
          'Describe your child\'s feeling, thought or urge.',
        ),
        _buildBecauseTextField(
          _phraseController,
          'e.g., "really anxious about the test"',
        ),
        const SizedBox(height: 24),
        _buildSubSectionTitle(
          'Because-statements',
          'Add 3 because-statements to complete the validation statement.',
        ),
        _buildBecauseTextField(
          _because1Controller,
          'e.g., "it is important to you that you do well"',
        ),
        const SizedBox(height: 12),
        _buildBecauseTextField(
          _because2Controller,
          'e.g., "you\'ve been studying for days"',
        ),
        const SizedBox(height: 12),
        _buildBecauseTextField(
          _because3Controller,
          'e.g., "you might feel a lot of pressure"',
        ),
        const SizedBox(height: 32),
        _buildSupportSection(
          'Emotional Support',
          'Offer warmth and presence. (Select up to 2)',
          _emotionalStarters,
          _selectedEmotionalSupports,
          _customEmotionalSupportController,
          2,
        ),
        const SizedBox(height: 32),
        _buildSupportSection(
          'Practical Support',
          'Gently offer to help. (Select up to 2)',
          _practicalStarters,
          _selectedPracticalSupports,
          _customPracticalSupportController,
          2,
        ),
      ],
    );
  }

  Widget _buildSupportSection(
      String title,
      String subtitle,
      List<String> items,
      List<String> selectedItems,
      TextEditingController customTextController,
      int maxSelection,
      ) {
    final showCustomField = selectedItems.contains("Other (Write your own)");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title, subtitle),
        _buildMultiChoiceChipGroup(items, selectedItems, maxSelection),
        if (showCustomField) ...[
          const SizedBox(height: 16),
          _buildBecauseTextField(
            customTextController,
            'Enter your custom support phrase...',
          ),
        ],
      ],
    );
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSubSectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildChoiceChipGroup(
      List<String> items,
      String? selectedItem,
      ValueChanged<String> onSelected,
      ) {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: items.map((item) {
        final bool isSelected = item == selectedItem;

        return ChoiceChip(
          label: Text(item),
          selected: isSelected,
          onSelected: (_) => onSelected(item),
          backgroundColor: AppColors.surface,
          selectedColor: AppColors.primary,
          labelStyle: GoogleFonts.nunito(
            color: isSelected ? Colors.white : AppColors.textPrimary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            fontSize: 13,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected ? AppColors.primary : AppColors.cardBorder,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        );
      }).toList(),
    );
  }

  Widget _buildMultiChoiceChipGroup(
      List<String> items,
      List<String> selectedItems,
      int maxSelection,
      ) {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: items.map((item) {
        final bool isSelected = selectedItems.contains(item);

        return ChoiceChip(
          label: Text(item),
          selected: isSelected,
          onSelected: (_) {
            setState(() {
              if (isSelected) {
                selectedItems.remove(item);
              } else if (selectedItems.length < maxSelection) {
                selectedItems.add(item);
              }
            });
            _updateScript();
          },
          backgroundColor: AppColors.surface,
          selectedColor: AppColors.primary,
          labelStyle: GoogleFonts.nunito(
            color: isSelected ? Colors.white : AppColors.textPrimary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            fontSize: 13,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected ? AppColors.primary : AppColors.cardBorder,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        );
      }).toList(),
    );
  }

  Widget _buildBecauseTextField(
      TextEditingController controller,
      String hintText,
      ) {
    return TextField(
      controller: controller,
      style: GoogleFonts.nunito(fontSize: 14, color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.nunito(color: AppColors.textLight),
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.cardBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }

  Widget _buildGeneratedScript() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.edit_note_rounded,
                color: AppColors.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Your Validation and Support Script',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            _hasCompleteScript
                ? _generatedScript.trim().replaceAll(RegExp(r'\s+'), ' ')
                : 'Your script will appear here once the required fields are complete...',
            style: GoogleFonts.nunito(
              fontSize: 15,
              color: _hasCompleteScript
                  ? AppColors.textPrimary
                  : AppColors.textLight,
              height: 1.6,
              fontStyle: _hasCompleteScript
                  ? FontStyle.normal
                  : FontStyle.italic,
            ),
          ),
          const SizedBox(height: 20),
          if (_hasCompleteScript)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(
                      text: _generatedScript.trim().replaceAll(
                        RegExp(r'\s+'),
                        ' ',
                      ),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Script copied to clipboard')),
                  );
                },
                icon: const Icon(Icons.copy_all_outlined, size: 18),
                label: const Text('Copy Script'),
              ),
            ),
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
        ],
      ),
    );
  }
}