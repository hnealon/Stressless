import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class EmotionBadge extends StatelessWidget {
  final String label;

  const EmotionBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.accent.withAlpha(25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.accent.withAlpha(77),
        ),
      ),
      child: Text(
        label.toUpperCase(),
        style: GoogleFonts.nunito(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: AppColors.accent,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
