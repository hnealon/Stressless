import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../data/scenario_data.dart';
import '../models/models.dart';
import '../widgets/shared_widgets.dart';
import 'session_screen.dart';

class ScenarioListScreen extends StatelessWidget {
  const ScenarioListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scenarios = scenarioData;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Choose a Scenario'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          children: [
            Text(
              'Each scenario is a short practice opportunity.',
              style: GoogleFonts.nunito(
                fontSize: 15,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ).animate().fadeIn(duration: 300.ms),
            const SizedBox(height: 20),
            ...scenarios.asMap().entries.map((entry) {
              final i = entry.key;
              final scenario = entry.value;
              return _ScenarioCard(scenario: scenario)
                  .animate()
                  .fadeIn(delay: Duration(milliseconds: 100 + i * 80))
                  .slideY(begin: 0.1, end: 0);
            }),
          ],
        ),
      ),
    );
  }
}

class _ScenarioCard extends StatelessWidget {
  final Scenario scenario;

  const _ScenarioCard({required this.scenario});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                SessionScreen(session: SessionState(scenario: scenario)),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    scenario.title,
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                EmotionBadge(label: scenario.emotionTag),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Child age: ${scenario.childAge}',
              style: GoogleFonts.nunito(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textLight,
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              scenario.situation,
              style: GoogleFonts.nunito(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.format_quote_rounded,
                    color: AppColors.textLight,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      scenario.childStatement,
                      style: GoogleFonts.nunito(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Begin',
                  style: GoogleFonts.nunito(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.primary,
                  size: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
