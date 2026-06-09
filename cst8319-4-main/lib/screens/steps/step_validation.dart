import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme.dart';
import '../../models/models.dart';
import '../../widgets/shared_widgets.dart';

class StepValidation extends StatefulWidget {
  final SessionState session;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const StepValidation({
    super.key,
    required this.session,
    required this.onNext,
    required this.onBack,
  });

  @override
  State<StepValidation> createState() => _StepValidationState();
}

class _StepValidationState extends State<StepValidation> {
  String? _selectedSentence;
  final List<String> _becauses = [];

  @override
  void initState() {
    super.initState();
    _selectedSentence = widget.session.selectedValidationSentence;
    _becauses.addAll(widget.session.validationBecause);
  }

  void _save() {
    widget.session.selectedValidationSentence = _selectedSentence;
    widget.session.validationBecause = List.from(_becauses);
  }

  bool get _canContinue =>
      _selectedSentence != null && _becauses.length == 3;

  @override
  Widget build(BuildContext context) {
    final vc = widget.session.scenario.validationContent;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      children: [
        Text(
          'STEP 2 · VALIDATION',
          style: GoogleFonts.nunito(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            letterSpacing: 1.2,
          ),
        ).animate().fadeIn(duration: 300.ms),
        const SizedBox(height: 6),
        Text(
          'Validate your child\'s experience',
          style: GoogleFonts.cormorantGaramond(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ).animate().fadeIn(delay: 80.ms, duration: 300.ms),
        const SizedBox(height: 10),
        Text(
          'Validation means naming and accepting your child’s feelings, thoughts, or urges, without judgment or trying to fix things right away.',
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: AppColors.textSecondary,
            height: 1.65,
          ),
        ).animate().fadeIn(delay: 140.ms, duration: 300.ms),
        const SizedBox(height: 20),

        // --- Live preview of built sentence ------------------
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _canContinue
                ? AppColors.validationCard
                : AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _canContinue
                  ? AppColors.primary.withAlpha(77)
                  : AppColors.divider,
            ),
          ),
          child: _canContinue
              ? Text(
                  widget.session.builtValidationSentence,
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textPrimary,
                    height: 1.65,
                  ),
                )
              : Text(
                  'Your validation sentence will appear here as you build it...',
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textLight,
                    height: 1.65,
                  ),
                ),
        ).animate().fadeIn(delay: 180.ms, duration: 300.ms),
        const SizedBox(height: 24),

        // --- Step 1 – Sentence --------------------------------
        _buildSectionHeader('1. Choose a sentence starter'),
        const SizedBox(height: 10),
        ...vc.validationSentences.asMap().entries.map((e) => SelectableOptionTile(
              text: e.value,
              isSelected: _selectedSentence == e.value,
              onTap: () => setState(() {
                _selectedSentence = e.value;
                _save();
              }),
            ).animate().fadeIn(delay: Duration(milliseconds: 200 + e.key * 60))),
        const SizedBox(height: 20),

        // --- Step 2 – Because (must choose 3) ----------------
        _buildSectionHeader('2. Choose exactly 3 because statements'),
        const SizedBox(height: 10),
        ...vc.becauseStatements.asMap().entries.map((e) => SelectableOptionTile(
              text: e.value,
              isSelected: _becauses.contains(e.value),
              multiSelect: true,
              onTap: () => setState(() {
                if (_becauses.contains(e.value)) {
                  _becauses.remove(e.value);
                } else {
                  if (_becauses.length < 3) {
                    _becauses.add(e.value);
                  }
                }
                _save();
              }),
            ).animate().fadeIn(delay: Duration(milliseconds: 300 + e.key * 60))),

        const SizedBox(height: 28),

        SessionNavButtons(
          onBack: widget.onBack,
          onNext: _canContinue ? widget.onNext : null,
          nextEnabled: _canContinue,
        ).animate().fadeIn(delay: 400.ms, duration: 300.ms),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildSectionHeader(String text) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
    );
  }
}
