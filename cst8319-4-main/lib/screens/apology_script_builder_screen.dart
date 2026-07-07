import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'apology_guide_screen.dart';
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
  // Audio state variables matching File 1 exactly
  final AudioRecorder _audioRecorder = AudioRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _recordingPath;
  bool _isRecording = false;
  bool _isPlaying = false;

  // Step tracking
  int _currentStep = 0;

  // Step 1 - Acknowledge
  String? _selectedAcknowledgement;

  // Step 2 - Take Responsibility
  String? _selectedResponsibility;

  // Step 3 - Validate Feelings
  String? _selectedValidation;

  // Step 4 - Express Regret
  String? _selectedRegret;

  // Step 5 - Make Amends
  String? _selectedAmends;

  // Step 6 - Commit to Change
  String? _selectedCommitment;

  final List<String> _acknowledgements = [
    'I know I hurt you when I...',
    'I realize that what I did was wrong...',
    'I can see that my actions affected you...',
    'I understand that I made a mistake when I...',
  ];

  final List<String> _responsibilities = [
    'I take full responsibility for my actions.',
    'I should not have done that.',
    'There is no excuse for my behaviour.',
    'I own what I did and I am sorry.',
  ];

  final List<String> _validations = [
    'It makes sense that you feel hurt.',
    'I understand why you are upset with me.',
    'Your feelings are completely valid.',
    'I can imagine how that must have felt for you.',
  ];

  final List<String> _regrets = [
    'I am truly sorry for what I did.',
    'I deeply regret hurting you.',
    'I wish I had handled things differently.',
    'I am sorry for the pain I caused you.',
  ];

  final List<String> _amendsList = [
    'I want to make this right by...',
    'Going forward, I will...',
    'To repair this, I am willing to...',
    'I would like to make it up to you by...',
  ];

  final List<String> _commitments = [
    'I commit to doing better.',
    'I will work on this so it does not happen again.',
    'I am committed to being more mindful of your feelings.',
    'I promise to think before I act next time.',
  ];

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

  @override
  void dispose() {
    _audioRecorder.dispose();
    _audioPlayer.dispose();
    super.dispose();
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
    final parts = [
      _selectedAcknowledgement,
      _selectedResponsibility,
      _selectedValidation,
      _selectedRegret,
      _selectedAmends,
      _selectedCommitment,
    ].where((e) => e != null).toList();
    return parts.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'Therapeutic Apology',
          style: AppTextStyles.heading,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Progress indicator
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
                ? _buildStepContent()
                : _buildSummaryScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildStepContent() {
    final steps = [
      {
        'title': 'Step 1: Acknowledge the Hurt',
        'subtitle': 'Start by acknowledging what happened.',
        'options': _acknowledgements,
        'selected': _selectedAcknowledgement,
        'onSelect': (val) =>
            setState(() => _selectedAcknowledgement = val),
      },
      {
        'title': 'Step 2: Take Responsibility',
        'subtitle': 'Own your actions without excuses.',
        'options': _responsibilities,
        'selected': _selectedResponsibility,
        'onSelect': (val) =>
            setState(() => _selectedResponsibility = val),
      },
      {
        'title': 'Step 3: Validate Their Feelings',
        'subtitle': 'Show that their feelings make sense.',
        'options': _validations,
        'selected': _selectedValidation,
        'onSelect': (val) => setState(() => _selectedValidation = val),
      },
      {
        'title': 'Step 4: Express Regret',
        'subtitle': 'Say sorry in a meaningful way.',
        'options': _regrets,
        'selected': _selectedRegret,
        'onSelect': (val) => setState(() => _selectedRegret = val),
      },
      {
        'title': 'Step 5: Make Amends',
        'subtitle': 'Offer to make things right.',
        'options': _amendsList,
        'selected': _selectedAmends,
        'onSelect': (val) => setState(() => _selectedAmends = val),
      },
      {
        'title': 'Step 6: Commit to Change',
        'subtitle': 'Promise to do better.',
        'options': _commitments,
        'selected': _selectedCommitment,
        'onSelect': (val) =>
            setState(() => _selectedCommitment = val),
      },
    ];

    final step = steps[_currentStep];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(step['title'] as String,
              style: AppTextStyles.heading),
          const SizedBox(height: 8),
          Text(step['subtitle'] as String,
              style: AppTextStyles.body),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              children:
              (step['options'] as List<String>).map((option) {
                final isSelected = step['selected'] == option;
                return GestureDetector(
                  onTap: () =>
                      (step['onSelect'] as Function)(option),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary.withOpacity(0.15)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.grey.shade200,
                        width: 2,
                      ),
                    ),
                    child: Text(option,
                        style: AppTextStyles.body),
                  ),
                );
              }).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_currentStep > 0)
                TextButton(
                  onPressed: () =>
                      setState(() => _currentStep--),
                  child: const Text('Back'),
                ),
              ElevatedButton(
                onPressed: step['selected'] != null
                    ? () => setState(() => _currentStep++)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 14),
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
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryScreen() {
    final script = _buildScript();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Apology Script',
              style: AppTextStyles.heading),
          const SizedBox(height: 8),
          Text('Here is your complete therapeutic apology:',
              style: AppTextStyles.body),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: AppColors.primary.withOpacity(0.3)),
              ),
              child: SingleChildScrollView(
                child: Text(script, style: AppTextStyles.body),
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
                  const SnackBar(
                    content: Text('Script copied to clipboard!'),
                  ),
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
                _selectedAcknowledgement = null;
                _selectedResponsibility = null;
                _selectedValidation = null;
                _selectedRegret = null;
                _selectedAmends = null;
                _selectedCommitment = null;
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