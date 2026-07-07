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

  // Step 3 - Communicate a sincere apology
  final _apologyController = TextEditingController();

  // Step 4 - State what they needed and what will change
  final _whatTheyNeededController = TextEditingController();
  final _whatWillChangeController = TextEditingController();

  // Step 5 - Respond with validation to their reaction
  String _selectedReactionType = 'anger';
  final _reactionContinuationController = TextEditingController();

  // Step 6 - Repeat steps 3 and 4 (auto-suggested, editable)
  final _repeatedApologyController = TextEditingController();
  final _repeatedChangeController = TextEditingController();

  static const Map<String, String> _reactionStarters = {
    'anger': "I can understand why you would be angry. It probably feels "
        "like too little too late...you've tried to get my attention on "
        "this issue many times…",
    'reassurance': "I can understand why you would want to reassure me. "
        "You've seen me hurting in the past and that's been really hard…",
    'denial': "I can understand why you wouldn't remember this / would "
        "want to deny this, it's a hard truth in our family…",
    'pain': "I can understand why you'd feel pain. It's an old wound that "
        "hasn't received the attention it deserves…",
  };

  @override
  void dispose() {
    _injuryController.dispose();
    _uniqueImpactController.dispose();
    _scaredBecause1Controller.dispose();
    _scaredBecause2Controller.dispose();
    _sadBecause1Controller.dispose();
    _sadBecause2Controller.dispose();
    _ashamedBecause1Controller.dispose();
    _ashamedBecause2Controller.dispose();
    _angryBecause1Controller.dispose();
    _angryBecause2Controller.dispose();
    _lonelyOptionalController.dispose();
    _apologyController.dispose();
    _whatTheyNeededController.dispose();
    _whatWillChangeController.dispose();
    _reactionContinuationController.dispose();
    _repeatedApologyController.dispose();
    _repeatedChangeController.dispose();
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
      "I can imagine that you might have felt scared because "
          "${_scaredBecause1Controller.text} and because "
          "${_scaredBecause2Controller.text}.",
    );
    buffer.writeln();
    buffer.writeln(
      "I can also imagine you might have felt sad because "
          "${_sadBecause1Controller.text} and because "
          "${_sadBecause2Controller.text}.",
    );
    buffer.writeln();
    buffer.writeln(
      "It would have made sense for you to feel ashamed because "
          "${_ashamedBecause1Controller.text} and because "
          "${_ashamedBecause2Controller.text}.",
    );
    buffer.writeln();
    buffer.writeln(
      "I can imagine you would have also felt angry because "
          "${_angryBecause1Controller.text} and because "
          "${_angryBecause2Controller.text}.",
    );
    if (_lonelyOptionalController.text.trim().isNotEmpty) {
      buffer.writeln();
      buffer.writeln(_lonelyOptionalController.text);
    }
    buffer.writeln();

    // Step 3
    buffer.writeln(_apologyController.text);
    buffer.writeln();

    // Step 4
    buffer.writeln(
      "I can see now that some of what you would have needed from me was "
          "${_whatTheyNeededController.text}.\n\nStarting today, "
          "${_whatWillChangeController.text}. It won't always go perfectly, "
          "but I won't stop working on this.",
    );
    buffer.writeln();

    // Step 5
    buffer.writeln(_reactionContinuationController.text);
    buffer.writeln();

    // Step 6
    buffer.writeln(
      "And I want you to know that I am so sorry. Knowing what I know now, "
          "I would have ${_repeatedApologyController.text}. Starting today I "
          "will ${_repeatedChangeController.text}.",
    );

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
              label: 'Especially because...',
              hint: 'unique impact given their age, temperament, etc.',
              maxLines: 3,
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
                controller: _scaredBecause1Controller, label: 'i can imagine that when I___ / when ___ occurred, you might have felt scared because',
                required: false),
            _textField(
                controller: _scaredBecause2Controller,
                label: 'and because... (relating to feeling out of control or overwhelmed)',
                required: false),
            const SizedBox(height: 8),
            Text('Sad', style: Theme.of(context).textTheme.bodyLarge!),
            _textField(
                controller: _sadBecause1Controller, label: 'I can also imagine that you might have felt sad because…',
                required: false),
            _textField(
                controller: _sadBecause2Controller, label: 'and because...(relating to longing, missing, loving)',
                required: false),
            const SizedBox(height: 8),
            Text('Ashamed', style: Theme.of(context).textTheme.bodyLarge!),
            _textField(
                controller: _ashamedBecause1Controller, label: 'It would have made sense for you to feel ashamed/embarrassed because… ',
                required: false),
            _textField(
                controller: _ashamedBecause2Controller,
                label: 'and because... (relating to feeling defective; too much, etc)',
                required: false),
            const SizedBox(height: 8),
            Text('Angry', style: Theme.of(context).textTheme.bodyLarge!),
            _textField(
                controller: _angryBecause1Controller, label: 'I can imagine that you would have also felt angry because...',
                required: false),
            _textField(
                controller: _angryBecause2Controller, label: 'and because... I can imagine that you would have also felt angry',
                required: false),
            const SizedBox(height: 8),
            Text('Optional: loneliness/overwhelm', style: Theme.of(context).textTheme.bodyLarge!),
            _textField(
              controller: _lonelyOptionalController,
              label: 'I can also imagine that you would have felt really lonely/overwhelmed going through all of this on your own/without my support (optional)',
              required: false,
              maxLines: 2,
            ),
          ],
        );
      case 2:
        return _stepScaffold(
          title: 'Step 3: Communicate a Sincere Apology',
          subtitle: 'Write a direct, genuine apology in your own words.',
          fields: [
            _textField(
              controller: _apologyController,

              label: 'I am so sorry or the pain this caused you (then and throughout your life). ',
              maxLines: 3,
            ),
          ],
        );
      case 3:
        return _stepScaffold(
          title: 'Step 4: Name What They Needed',
          subtitle: 'State what they needed instead, and what will change.',
          fields: [
            _noteCard(
              // REPLACE WITH WORKSHEET TEXT
              "Ensure follow through if possible.",
            ),
            _textField(
              controller: _whatTheyNeededController,
              label: 'I can see now that some of what you would have needed from me was… (given the benefit of a crystal ball and sufficient time, money and support)',
              maxLines: 3,
            ),
            _textField(
              controller: _whatWillChangeController,
              label: 'Starting today, I will... (+ it won’t always go perfectly, but I won’t stop working on this) ',
              maxLines: 3,
            ),
          ],
        );
      case 4:
        return _stepScaffoldNoValidation(
          title: 'Step 5: Respond with validation to their reaction - whether anger, denial, reassurance or pain',
          subtitle:
          'Select how your child is most likely to respond, then continue in your own words.',
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
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _reactionStarters[_selectedReactionType] ?? '',
                style: Theme.of(context).textTheme.bodyLarge!
                    .copyWith(fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 16),
            _textField(
              controller: _reactionContinuationController,
              label: 'Continue in your own words...',
              maxLines: 4,
            ),
          ],
        );
      case 5:
        return _stepScaffold(
          title: 'Step 6: Repeat Steps 3 and 4',
          subtitle:
          'Restate your apology and commitment, calmly and steadily.',
          fields: [
            _textField(
              controller: _repeatedApologyController,
              label: 'Knowing what I know now, I would have...',
              maxLines: 3,
            ),
            _textField(
              controller: _repeatedChangeController,
              label: 'Starting today I will...',
              maxLines: 3,
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
            if (_reactionContinuationController.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please add your own words.')),
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