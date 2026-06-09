import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme.dart';
import '../../models/models.dart';
import '../../widgets/shared_widgets.dart';

class StepEmotionalSupport extends StatefulWidget {
  final SessionState session;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const StepEmotionalSupport({
    super.key,
    required this.session,
    required this.onNext,
    required this.onBack,
  });

  @override
  State<StepEmotionalSupport> createState() => _StepEmotionalSupportState();
}

class _StepEmotionalSupportState extends State<StepEmotionalSupport> {
  final List<String> _selected = [];
  final _otherController = TextEditingController();
  bool _isOtherSelected = false;

  @override
  void initState() {
    super.initState();
    for (var option in widget.session.selectedEmotionalSupport) {
      if (widget.session.scenario.emotionalSupportOptions.contains(option)) {
        _selected.add(option);
      } else {
        _otherController.text = option;
        _isOtherSelected = true;
      }
    }
  }

  void _saveState() {
    final allSelections = List<String>.from(_selected);
    if (_isOtherSelected && _otherController.text.isNotEmpty) {
      allSelections.add(_otherController.text);
    }
    widget.session.selectedEmotionalSupport = allSelections;
  }

  int get _totalSelections => _selected.length + (_isOtherSelected ? 1 : 0);

  void _toggleOption(String option) {
    setState(() {
      if (_selected.contains(option)) {
        _selected.remove(option);
      } else {
        if (_totalSelections < 2) {
          _selected.add(option);
        }
      }
      _saveState();
    });
  }

  void _toggleOther() {
    setState(() {
      _isOtherSelected = !_isOtherSelected;
      if (_totalSelections > 2) {
        if (_selected.isNotEmpty) {
          _selected.removeLast();
        } else {
          _isOtherSelected = false;
        }
      }
      if (!_isOtherSelected) {
        _otherController.clear();
      }
      _saveState();
    });
  }

  bool get _canContinue =>
      _selected.isNotEmpty || (_isOtherSelected && _otherController.text.isNotEmpty);

  String get _selectionCountText {
    switch (2 - _totalSelections) {
      case 0:
        return 'You can clear a selection to choose another.';
      case 1:
        return 'You can select 1 more.';
      case 2:
        return 'Select 1 or 2 statements to add:';
      default:
        return 'Select statements to add:';
    }
  }

  @override
  Widget build(BuildContext context) {
    final options = widget.session.scenario.emotionalSupportOptions;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      children: [
        Text(
          'STEP 3 · EMOTIONAL SUPPORT',
          style: GoogleFonts.nunito(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            letterSpacing: 1.2,
          ),
        ).animate().fadeIn(duration: 300.ms),
        const SizedBox(height: 6),
        Text(
          'Offer warmth and presence',
          style: GoogleFonts.cormorantGaramond(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ).animate().fadeIn(delay: 80.ms, duration: 300.ms),
        const SizedBox(height: 10),
        Text(
          'These statements offer your child connection, reassurance, and acceptance, without trying to fix or change how they feel.',
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: AppColors.textSecondary,
            height: 1.65,
          ),
        ).animate().fadeIn(delay: 140.ms, duration: 300.ms),
        const SizedBox(height: 20),

        if (widget.session.builtValidationSentence.isNotEmpty) ...[
          SectionCard(
            backgroundColor: AppColors.validationCard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your validation so far',
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.session.builtValidationSentence,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textPrimary,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 180.ms, duration: 300.ms),
          const SizedBox(height: 20),
        ],

        Text(
          _selectionCountText,
          style: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 300.ms),
        const SizedBox(height: 12),

        ...options.asMap().entries.map((e) => SelectableOptionTile(
              text: e.value,
              isSelected: _selected.contains(e.value),
              multiSelect: true,
              onTap: () => _toggleOption(e.value),
            ).animate().fadeIn(delay: Duration(milliseconds: 250 + e.key * 70))),

        SelectableOptionTile(
          text: 'Other (Write your own)',
          isSelected: _isOtherSelected,
          multiSelect: true,
          onTap: _toggleOther,
        ).animate().fadeIn(delay: 400.ms, duration: 300.ms),

        if (_isOtherSelected)
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 40, right: 8),
            child: TextField(
              controller: _otherController,
              onChanged: (_) => _saveState(),
              maxLines: 2,
              style: GoogleFonts.nunito(fontSize: 14, color: AppColors.textPrimary),
              decoration: InputDecoration(
                hintText: 'Type your response here...',
                hintStyle: GoogleFonts.nunito(color: AppColors.textLight),
                filled: true,
                fillColor: AppColors.surfaceVariant,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                ),
              ),
            ),
          ).animate().fadeIn(duration: 200.ms).slideY(begin: -0.2, end: 0),

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
}
