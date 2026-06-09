import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';

/// Silence Script Builder
///
/// A variant of the Script Builder specialised for responding to a child's
/// silence or withdrawal. Based on the V/S Silence caregiver handout, its
/// defining feature is validating from three perspectives:
///   1. Your child's experience (why the silence makes sense for them)
///   2. The relationship (the space between you)
///   3. Your own perspective (what is true on your end)
/// followed by silence-appropriate emotional and practical support.
class SilenceScriptBuilderScreen extends StatefulWidget {
  const SilenceScriptBuilderScreen({super.key});

  @override
  State<SilenceScriptBuilderScreen> createState() =>
      _SilenceScriptBuilderScreenState();
}

class _SilenceScriptBuilderScreenState
    extends State<SilenceScriptBuilderScreen> {
  // Perspective 1 — your child's experience
  String? _selectedStarter;
  String? _selectedVerb;
  final TextEditingController _phraseController = TextEditingController();
  final TextEditingController _because1Controller = TextEditingController();
  final TextEditingController _because2Controller = TextEditingController();

  // Perspective 2 — the relationship (the space between you)
  String? _selectedRelationshipLine;
  final TextEditingController _customRelationshipController =
  TextEditingController();

  // Perspective 3 — your own perspective
  String? _selectedOwnLine;
  final TextEditingController _customOwnController = TextEditingController();

  // Support
  final List<String> _selectedEmotionalSupports = [];
  final List<String> _selectedPracticalSupports = [];
  final TextEditingController _customEmotionalSupportController =
  TextEditingController();
  final TextEditingController _customPracticalSupportController =
  TextEditingController();

  String _generatedScript = '';

  // Sentence starters — kept consistent with the Learn hub and main builder.
  final List<String> _starters = [
    "I could understand you might",
    "I can imagine you",
    "No wonder you",
    "It makes sense that you",
    "I will never fully understand, but when I try to put myself in your shoes, I imagine you",
    "When I try to see it from your perspective, I imagine you might",
  ];

  // Silence-oriented verbs to label the child's internal experience.
  final List<String> _verbs = [
    "don't want to talk",
    "might not want to talk",
    "aren't ready to share",
    "need some space",
    "want to be left alone",
    "don't feel like talking",
  ];

  // Perspective 2 — acknowledging the relationship and the space between you.
  final List<String> _relationshipLines = [
    "I don't want my questions to feel like pressure.",
    "I'd rather sit with you in the quiet than push you to talk.",
    "Your silence doesn't change how much I care about you.",
    "We don't have to fix anything right now.",
    "I'm not going anywhere.",
    "Other (Write your own)",
  ];

  // Perspective 3 — what is true from your end.
  final List<String> _ownLines = [
    "From my end, I just want you to know I'm here.",
    "From my end, I care about you even when we're not talking.",
    "From my end, I trust you'll come to me when you're ready.",
    "From my end, I'm not upset with you.",
    "Other (Write your own)",
  ];

  final List<String> _emotionalStarters = [
    "I'm right here whenever you're ready.",
    "You don't have to say anything.",
    "Take all the time you need.",
    "It's okay to be quiet.",
    "I love you, even in the quiet.",
    "You're not alone in this.",
    "Other (Write your own)",
  ];

  final List<String> _practicalStarters = [
    "Would you like some space, or would you rather I stay nearby?",
    "We can just sit here together, no talking needed.",
    "When you're ready, I'm here to listen.",
    "Would it help to do something quiet together, like a walk?",
    "You can write it down or text me if that's easier.",
    "Other (Write your own)",
  ];

  @override
  void initState() {
    super.initState();
    _phraseController.addListener(_updateScript);
    _because1Controller.addListener(_updateScript);
    _because2Controller.addListener(_updateScript);
    _customRelationshipController.addListener(_updateScript);
    _customOwnController.addListener(_updateScript);
    _customEmotionalSupportController.addListener(_updateScript);
    _customPracticalSupportController.addListener(_updateScript);
  }

  @override
  void dispose() {
    _phraseController.dispose();
    _because1Controller.dispose();
    _because2Controller.dispose();
    _customRelationshipController.dispose();
    _customOwnController.dispose();
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
      // Perspective 1 — your child's experience.
      final starter = _selectedStarter ?? '[Starter]';
      final verb = _selectedVerb ?? '[verb]';
      final phrase = _phraseController.text.trim();

      String becauseClause = '';
      if (_because1Controller.text.isNotEmpty &&
          _because2Controller.text.isNotEmpty) {
        becauseClause =
        'because ${_because1Controller.text.trim()}, and ${_because2Controller.text.trim()}';
      }

      String validationPart = '$starter $verb';
      if (phrase.isNotEmpty) {
        validationPart += ' $phrase';
      }
      if (becauseClause.isNotEmpty) {
        validationPart += ' $becauseClause';
      }
      validationPart += '.';

      // Perspective 2 and 3.
      final relationship =
      _resolveLine(_selectedRelationshipLine, _customRelationshipController);
      final own = _resolveLine(_selectedOwnLine, _customOwnController);

      // Support.
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
      '$validationPart $relationship $own $emotional $practical';
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
                      'SILENCE SCRIPT BUILDER',
                      style: GoogleFonts.nunito(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: 1.4,
                      ),
                    ).animate().fadeIn(duration: 300.ms),
                    const SizedBox(height: 4),
                    Text(
                      'Respond to your child’s silence.',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        height: 1.15,
                      ),
                    ).animate().fadeIn(delay: 80.ms, duration: 400.ms),
                    const SizedBox(height: 10),
                    Text(
                      'When your child goes quiet or withdraws, validation can come from three perspectives. Build your script below and it will assemble itself at the bottom of the page.',
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
                  // ---- Perspective 1 ----
                  _buildSectionTitle(
                    'Perspective 1: Your child’s experience',
                    'Validate the silence from their point of view.',
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
                  _buildSubSectionTitle('Verb', 'Select a verb.'),
                  _buildChoiceChipGroup(_verbs, _selectedVerb, (selected) {
                    setState(() {
                      _selectedVerb = selected;
                      _updateScript();
                    });
                  }),
                  const SizedBox(height: 24),
                  _buildSubSectionTitle(
                    'Added Detail (optional)',
                    'Add any context, such as a time or place.',
                  ),
                  _buildTextField(
                    _phraseController,
                    'e.g., "right now" or "after school today"',
                  ),
                  const SizedBox(height: 24),
                  _buildSubSectionTitle(
                    'Because-statements',
                    'Add 2 reasons the silence makes sense from their view.',
                  ),
                  _buildTextField(
                    _because1Controller,
                    'e.g., "today felt like a lot to handle"',
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    _because2Controller,
                    'e.g., "talking about it can feel hard right now"',
                  ),
                  const SizedBox(height: 32),

                  // ---- Perspective 2 ----
                  _buildSectionTitle(
                    'Perspective 2: The space between you',
                    'Acknowledge the silence in your relationship. (Select one)',
                  ),
                  _buildChoiceChipGroup(
                    _relationshipLines,
                    _selectedRelationshipLine,
                        (selected) {
                      setState(() {
                        _selectedRelationshipLine =
                        _selectedRelationshipLine == selected
                            ? null
                            : selected;
                        _updateScript();
                      });
                    },
                  ),
                  if (_selectedRelationshipLine == "Other (Write your own)") ...[
                    const SizedBox(height: 16),
                    _buildTextField(
                      _customRelationshipController,
                      'Write your own line about the space between you...',
                    ),
                  ],
                  const SizedBox(height: 32),

                  // ---- Perspective 3 ----
                  _buildSectionTitle(
                    'Perspective 3: From your end',
                    'Share what is true for you. (Select one)',
                  ),
                  _buildChoiceChipGroup(_ownLines, _selectedOwnLine, (selected) {
                    setState(() {
                      _selectedOwnLine =
                      _selectedOwnLine == selected ? null : selected;
                      _updateScript();
                    });
                  }),
                  if (_selectedOwnLine == "Other (Write your own)") ...[
                    const SizedBox(height: 16),
                    _buildTextField(
                      _customOwnController,
                      'Write your own line from your perspective...',
                    ),
                  ],
                  const SizedBox(height: 32),

                  // ---- Support ----
                  _buildSupportSection(
                    'Emotional Support',
                    'Offer presence without pressure. (Select up to 2)',
                    _emotionalStarters,
                    _selectedEmotionalSupports,
                    _customEmotionalSupportController,
                    2,
                  ),
                  const SizedBox(height: 32),
                  _buildSupportSection(
                    'Practical Support',
                    'Offer a low-pressure way to connect. (Select up to 2)',
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

  Widget _buildSupportSection(
      String title,
      String subtitle,
      List<String> items,
      List<String> selectedItems,
      TextEditingController customTextController,
      int maxSelection,
      ) {
    bool showCustomField = selectedItems.contains("Other (Write your own)");

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
          onSelected: (selected) {
            onSelected(item);
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
          onSelected: (selected) {
            setState(() {
              if (isSelected) {
                selectedItems.remove(item);
              } else {
                if (selectedItems.length < maxSelection) {
                  selectedItems.add(item);
                }
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
    bool hasContent = _selectedStarter != null &&
        _selectedVerb != null &&
        _because1Controller.text.isNotEmpty &&
        _because2Controller.text.isNotEmpty;

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
                : "Your script will appear here once the validation fields are complete...",
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
