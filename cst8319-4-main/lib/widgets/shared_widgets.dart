import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

// ─── Step Progress Bar ────────────────────────────────────────────────────────

class StepProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final List<String> labels;

  const StepProgressBar({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(totalSteps, (index) {
            final isComplete = index < currentStep;
            final isActive = index == currentStep;
            return Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 4,
                      decoration: BoxDecoration(
                        color: isComplete || isActive
                            ? AppColors.primary
                            : AppColors.stepIndicatorInactive,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  if (index < totalSteps - 1) const SizedBox(width: 4),
                ],
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(totalSteps, (index) {
            final isActive = index == currentStep;
            return Text(
              labels[index],
              style: GoogleFonts.nunito(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                color: isActive ? AppColors.primary : AppColors.textLight,
                letterSpacing: 0.4,
              ),
            );
          }),
        ),
      ],
    );
  }
}

// ─── Section Card ─────────────────────────────────────────────────────────────

class SectionCard extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final EdgeInsets? padding;

  const SectionCard({
    super.key,
    this.backgroundColor,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: child,
    );
  }
}

// ─── Selectable Option Tile ───────────────────────────────────────────────────

class SelectableOptionTile extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final bool multiSelect;

  const SelectableOptionTile({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.multiSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withAlpha(20)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.cardBorder,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 22,
              height: 22,
              margin: const EdgeInsets.only(top: 1),
              decoration: BoxDecoration(
                shape:
                    multiSelect ? BoxShape.rectangle : BoxShape.circle,
                borderRadius: multiSelect ? BorderRadius.circular(6) : null,
                color:
                    isSelected ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.stepIndicatorInactive,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 14)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.nunito(
                  fontSize: 15,
                  fontWeight:
                      isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Microfeedback Banner ─────────────────────────────────────────────────────

class MicrofeedbackBanner extends StatelessWidget {
  final String text;
  final bool isValidating;

  const MicrofeedbackBanner({
    super.key,
    required this.text,
    required this.isValidating,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isValidating
            ? AppColors.primary.withAlpha(20)
            : AppColors.accent.withAlpha(20),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isValidating
              ? AppColors.primary.withAlpha(77)
              : AppColors.accent.withAlpha(77),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isValidating
                ? Icons.favorite_rounded
                : Icons.lightbulb_outline_rounded,
            color: isValidating ? AppColors.primary : AppColors.accent,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Emotion Tag Chip ─────────────────────────────────────────────────────────

class EmotionChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const EmotionChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 8, bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.divider,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.nunito(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color:
                isSelected ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

// ─── Navigation Buttons ───────────────────────────────────────────────────────

class SessionNavButtons extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onNext;
  final String nextLabel;
  final bool nextEnabled;

  const SessionNavButtons({
    super.key,
    this.onBack,
    this.onNext,
    this.nextLabel = 'Continue',
    this.nextEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onBack != null)
          Expanded(
            flex: 1,
            child: OutlinedButton.icon(
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back_rounded, size: 18),
              label: const Text('Back'),
            ),
          ),
        if (onBack != null) const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: nextEnabled ? onNext : null,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  nextEnabled ? AppColors.primary : AppColors.stepIndicatorInactive,
            ),
            child: Text(nextLabel),
          ),
        ),
      ],
    );
  }
}

// ─── Scenario Emotion Badge ───────────────────────────────────────────────────

class EmotionBadge extends StatelessWidget {
  final String label;

  const EmotionBadge({super.key, required this.label});

  Color get _color {
    switch (label.toLowerCase()) {
      case 'anxious':
        return const Color(0xFF7B68AB);
      case 'sad':
        return const Color(0xFF5B8FC9);
      case 'angry':
        return const Color(0xFFBF5B5B);
      case 'scared':
        return const Color(0xFF7B9B7A);
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _color.withAlpha(30),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style: GoogleFonts.nunito(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: _color,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
