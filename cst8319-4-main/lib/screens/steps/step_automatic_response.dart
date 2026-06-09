import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme.dart';
import '../../models/models.dart';
import '../../widgets/shared_widgets.dart';

class StepAutomaticResponse extends StatefulWidget {
  final SessionState session;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const StepAutomaticResponse({
    super.key,
    required this.session,
    required this.onNext,
    required this.onBack,
  });

  @override
  State<StepAutomaticResponse> createState() => _StepAutomaticResponseState();
}

class _StepAutomaticResponseState extends State<StepAutomaticResponse> {
  // Helper method to build the step header, based on the pattern from other step screens.
  Widget _buildStepHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'STEP 1 · AUTOMATIC RESPONSE',
          style: GoogleFonts.nunito(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Notice your first instinct',
          style: GoogleFonts.cormorantGaramond(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Based on your past experiences and current state, what is your most likely automatic reaction to this scenario? Don\'t overthink it.',
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: AppColors.textSecondary,
            height: 1.65,
          ),
        ),
      ],
    );
  }

  // Helper method to build the scenario recap card.
  Widget _buildScenarioRecap({required Scenario scenario}) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.psychology_alt_rounded,
                  color: AppColors.textLight, size: 18),
              const SizedBox(width: 8),
              Text(
                'SCENARIO RECAP',
                style: GoogleFonts.nunito(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textLight,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            scenario.title,
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            scenario.situation,
            style: GoogleFonts.nunito(
                fontSize: 14, color: AppColors.textSecondary, height: 1.6),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scenario = widget.session.scenario;

    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        _buildStepHeader(),
        const SizedBox(height: 24),
        _buildScenarioRecap(scenario: scenario),
        const SizedBox(height: 24),
        Text(
          'What’s your automatic response likely to be?',
          style: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        // Use the correct SelectableOptionTile widget
        ...scenario.automaticResponses.map((response) {
          return SelectableOptionTile(
            text: response.text,
            isSelected: widget.session.selectedAutomaticResponse == response,
            onTap: () {
              setState(() {
                widget.session.selectedAutomaticResponse = response;
              });
            },
          );
        }),
        const SizedBox(height: 24),
        const MicrofeedbackBanner(
          isValidating: false, // Using 'false' gives it the informational/advice style
          text:
              'This is your automatic or conditioned response. Recognizing it is the first step toward choosing a different way to engage with your child.',
        ),
        const SizedBox(height: 28),
        // Use the correct SessionNavButtons widget
        SessionNavButtons(
          onBack: widget.onBack,
          // The 'next' button is enabled only when a selection has been made.
          onNext: widget.session.selectedAutomaticResponse != null
              ? widget.onNext
              : null,
          nextEnabled: widget.session.selectedAutomaticResponse != null,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
