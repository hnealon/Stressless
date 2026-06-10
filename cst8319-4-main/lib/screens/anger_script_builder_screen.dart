import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';

/// Anger Script Builder
///
/// A variant of the Script Builder specialised for responding to a child's
/// anger. Based on the V/S Anger caregiver handout, its defining features are:
///   1. Anger-specific validation (starter + verb + because-statements)
///   2. "Anger as a connecting emotion" reframing section with illustration
///   3. Anger-appropriate emotional and practical support
class AngerScriptBuilderScreen extends StatefulWidget {
  const AngerScriptBuilderScreen({super.key});

  @override
  State<AngerScriptBuilderScreen> createState() =>
      _AngerScriptBuilderScreenState();
}

class _AngerScriptBuilderScreenState extends State<AngerScriptBuilderScreen> {
  static const _illustrationAsset =
      'assets/images/anger_connecting_emotion.png';

  // Validation — your child's anger
  String? _selectedStarter;
  String? _selectedVerb;
  final TextEditingController _phraseController = TextEditingController();
  final TextEditingController _because1Controller = TextEditingController();
  final TextEditingController _because2Controller = TextEditingController();
  final TextEditingController _because3Controller = TextEditingController();

  // Anger as a connecting emotion
  String? _selectedConnectingLine;
  final TextEditingController _customConnectingController =
      TextEditingController();

  // Support
  final List<String> _selectedEmotionalSupports = [];
  final List<String> _selectedPracticalSupports = [];
  final TextEditingController _customEmotionalSupportController =
      TextEditingController();
  final TextEditingController _customPracticalSupportController =
      TextEditingController();

  String _generatedScript = '';

  final List<String> _starters = [
    "I could understand you might",
    "I can imagine you",
    "No wonder you",
    "It makes sense that you",
    "I will never fully understand, but when I try to put myself in your shoes, I imagine you",
    "When I try to see it from your perspective, I imagine you might",
  ];

  final List<String> _verbs = [
    "feel angry",
    "feel furious",
    "feel really upset",
    "feel like it's not fair",
    "want to yell",
    "need to let this out",
  ];

  final List<String> _connectingLines = [
    "Your anger tells me something important is happening for you.",
    "I want you to know your feelings can bring us closer, not push us apart.",
    "When you're angry, it means something matters — and that matters to me too.",
    "I'm not scared of your anger. I'm listening.",
    "Anger can be a way of asking for connection — and I'm right here.",
    "Other (Write your own)",
  ];

  final List<String> _emotionalStarters = [
    "Your anger makes complete sense to me.",
    "I'm on your side, and I hear you.",
    "You're allowed to feel angry about this.",
    "I'm here. You don't have to calm down right away.",
    "It's okay to have big feelings. I'm not going anywhere.",
    "Other (Write your own)",
  ];

  final List<String> _practicalStarters = [
    "Right now, I can just be here with you.",
    "When you're ready, we can talk about what happened.",
    "Would it help to have some space right now, or do you want to stay with me?",
    "We could think together about what fair might look like.",
    "Other (Write your own)",
  ];

  @override
  void initState() {
    super.initState();
    _phraseController.addListener(_updateScript);
    _because1Controller.addListener(_updateScript);
    _because2Controller.addListener(_updateScript);
    _because3Controller.addListener(_updateScript);
    _customConnectingController.addListener(_updateScript);
    _customEmotionalSupportController.addListener(_updateScript);
    _customPracticalSupportController.addListener(_updateScript);
  }

  @override
  void dispose() {
    _phraseController.dispose();
    _because1Controller.dispose();
    _because2Controller.dispose();
    _because3Controller.dispose();
    _customConnectingController.dispose();
    _customEmotionalSupportController.dispose();
    _customPracticalSupportController.dispose();
    super.dispose();
  }

  String _resolveLine(String? selected, TextEditingController custom) {
    if (selected == null) return '';
    if (selected == "Other (Write your own)") return custom.text.trim();
    return selected;
  }

  void _updateScript() {
    setState(() {
      final starter = _selectedStarter ?? '[Starter]';
      final verb = _selectedVerb ?? '[verb]';
      final phrase = _phraseController.text.trim();

      String becauseClause = '';
      if (_because1Controller.text.isNotEmpty &&
          _because2Controller.text.isNotEmpty &&
          _because3Controller.text.isNotEmpty) {
        becauseClause =
            'because ${_because1Controller.text.trim()}, ${_because2Controller.text.trim()}, and ${_because3Controller.text.trim()}';
      }

      String validationPart = '$starter $verb';
      if (phrase.isNotEmpty) {
        validationPart += ' $phrase';
      }
      if (becauseClause.isNotEmpty) {
        validationPart += ' $becauseClause';
      }
      validationPart += '.';

      final connecting =
          _resolveLine(_selectedConnectingLine, _customConnectingController);

      final emotional = _selectedEmotionalSupports.map((e) {
        if (e == "Other (Write your own)") {
          return _customEmotionalSupportController.text.trim();
        }
        return e;
      }).join(' ');

      final practical = _selectedPracticalSupports.map((e) {
        if (e == "Other (Write your own)") {
          return _customPracticalSupportController.text.trim();
        }
        return e;
      }).join(' ');

      _generatedScript =
          '$validationPart $connecting $emotional $practical';
    });
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
                      'ANGER SCRIPT BUILDER',
                      style: GoogleFonts.nunito(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: 1.4,
                      ),
                    ).animate().fadeIn(duration: 300.ms),
                    const SizedBox(height: 4),
                    Text(
                      'Respond to your child’s anger.',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        height: 1.15,
                      ),
                    ).animate().fadeIn(delay: 80.ms, duration: 400.ms),
                    const SizedBox(height: 10),
                    Text(
                      'Validate their anger, reframe it as connection, and offer support. Your script assembles itself at the bottom as you go.',
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
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildConnectingEmotionSection(),
                  const SizedBox(height: 32),
                  _buildSectionTitle(
                    'Step 1: Validation',
                    'Help your child feel understood in their anger.',
                  ),
                  const SizedBox(height: 16),
                  _buildSubSectionTitle(
                    'Sentence Starter',
                    'Select a sentence starter.',
                  ),
                  _buildChoiceChipGroup(_starters, _selectedStarter, (selected) {
                    setState(() {
                      _selectedStarter = selected;
                      _updateScript();
                    });
                  }),
                  const SizedBox(height: 24),
                  _buildSubSectionTitle('Verb', 'Select an anger-related verb.'),
                  _buildChoiceChipGroup(_verbs, _selectedVerb, (selected) {
                    setState(() {
                      _selectedVerb = selected;
                      _updateScript();
                    });
                  }),
                  const SizedBox(height: 24),
                  _buildSubSectionTitle(
                    'Added Detail (optional)',
                    'Add context, such as who or what the anger is about.',
                  ),
                  _buildTextField(
                    _phraseController,
                    'e.g., "at your sibling" or "about what happened"',
                  ),
                  const SizedBox(height: 24),
                  _buildSubSectionTitle(
                    'Because-statements',
                    'Add 3 reasons the anger makes sense from their view.',
                  ),
                  _buildTextField(
                    _because1Controller,
                    'e.g., "that toy was special to you"',
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    _because2Controller,
                    'e.g., "it feels like this happens a lot"',
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    _because3Controller,
                    'e.g., "you want things to be fair"',
                  ),
                  const SizedBox(height: 32),
                  _buildSectionTitle(
                    'Step 2: Anger as a connecting emotion',
                    'Reframe anger as a bridge, not a barrier. (Select one)',
                  ),
                  _buildChoiceChipGroup(
                    _connectingLines,
                    _selectedConnectingLine,
                    (selected) {
                      setState(() {
                        _selectedConnectingLine =
                            _selectedConnectingLine == selected
                                ? null
                                : selected;
                        _updateScript();
                      });
                    },
                  ),
                  if (_selectedConnectingLine == "Other (Write your own)") ...[
                    const SizedBox(height: 16),
                    _buildTextField(
                      _customConnectingController,
                      'Write your own connecting-emotion line...',
                    ),
                  ],
                  const SizedBox(height: 32),
                  _buildSupportSection(
                    'Emotional Support',
                    'Stay present with their anger. (Select up to 2)',
                    _emotionalStarters,
                    _selectedEmotionalSupports,
                    _customEmotionalSupportController,
                    2,
                  ),
                  const SizedBox(height: 32),
                  _buildSupportSection(
                    'Practical Support',
                    'Offer a next step without rushing them. (Select up to 2)',
                    _practicalStarters,
                    _selectedPracticalSupports,
                    _customPracticalSupportController,
                    2,
                  ),
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

  Widget _buildConnectingEmotionSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.validationCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Anger as a Connecting Emotion',
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Anger often signals that something important needs attention. When we validate it, we stay connected.',
            style: GoogleFonts.nunito(
              fontSize: 13,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              _illustrationAsset,
              width: double.infinity,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.cardBorder),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.favorite_border_rounded,
                        size: 40,
                        color: AppColors.accent.withValues(alpha: 0.8),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Illustration placeholder',
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Add anger_connecting_emotion.png to assets/images/',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildSupportSection(
    String title,
    String subtitle,
    List<String> items,
    List<String> selectedItems,
    TextEditingController customTextController,
    int maxSelection,
  ) {
    final showCustomField =
        selectedItems.contains("Other (Write your own)");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title, subtitle),
        _buildMultiChoiceChipGroup(items, selectedItems, maxSelection),
        if (showCustomField) ...[
          const SizedBox(height: 16),
          _buildTextField(
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
    ).animate().fadeIn(delay: 200.ms);
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
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildChoiceChipGroup(
    List<String> items,
    String? selectedItem,
    ValueChanged<String> onSelected,
  ) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 6.0,
      children: items.map((item) {
        final isSelected = item == selectedItem;
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
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              color: isSelected ? AppColors.primary : AppColors.cardBorder,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        );
      }).toList(),
    ).animate().fadeIn(delay: 300.ms);
  }

  Widget _buildMultiChoiceChipGroup(
    List<String> items,
    List<String> selectedItems,
    int maxSelection,
  ) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 6.0,
      children: items.map((item) {
        final isSelected = selectedItems.contains(item);
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
              _updateScript();
            });
          },
          backgroundColor: AppColors.surface,
          selectedColor: AppColors.primary,
          labelStyle: GoogleFonts.nunito(
            color: isSelected ? Colors.white : AppColors.textPrimary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            fontSize: 13,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              color: isSelected ? AppColors.primary : AppColors.cardBorder,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        );
      }).toList(),
    ).animate().fadeIn(delay: 300.ms);
  }

  Widget _buildTextField(
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
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.cardBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      onChanged: (_) => _updateScript(),
    ).animate().fadeIn(delay: 300.ms);
  }

  Widget _buildGeneratedScript() {
    final hasContent = _selectedStarter != null &&
        _selectedVerb != null &&
        _because1Controller.text.isNotEmpty &&
        _because2Controller.text.isNotEmpty &&
        _because3Controller.text.isNotEmpty;

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
                'Your Generated Script',
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
            hasContent
                ? _generatedScript.trim().replaceAll(RegExp(r'\s+'), ' ')
                : 'Your script will appear here once the validation fields are complete...',
            style: GoogleFonts.nunito(
              fontSize: 15,
              color: hasContent ? AppColors.textPrimary : AppColors.textLight,
              height: 1.6,
              fontStyle: hasContent ? FontStyle.normal : FontStyle.italic,
            ),
          ),
          const SizedBox(height: 20),
          if (hasContent)
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
                    const SnackBar(
                      content: Text('Script copied to clipboard'),
                    ),
                  );
                },
                icon: const Icon(Icons.copy_all_outlined, size: 18),
                label: const Text('Copy Script'),
              ),
            ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1, end: 0);
  }
}
