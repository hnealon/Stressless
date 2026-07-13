import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import 'scenario_list_screen.dart';
import '../data/scenario_data.dart';
import '../models/models.dart';
import 'session_screen.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header --------------------------------------
              _buildHeader(context),
              const SizedBox(height: 32),

              // --- Intro card ----------------------------------
              _buildIntroCard(),
              const SizedBox(height: 28),

              // --- EFFT Framework -----------------------------
              _buildFrameworkSection(),
              const SizedBox(height: 32),

              // --- Subtitle Replacing the button --------------
              Text(
                'Practice with the scenarios below.',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ).animate().fadeIn(delay: 600.ms, duration: 400.ms),
              const SizedBox(height: 16),
              // --- Inline scenarios ----------------------------
              _buildInlineScenarios(context),
              const SizedBox(height: 16),
              // --- Continue practicing button -----------------
              _buildContinueButton(context),
              const SizedBox(height: 16),


              // --- Disclaimer ----------------------------------
              _buildDisclaimer(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.favorite_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'StressLess',
              style: GoogleFonts.cormorantGaramond(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.2, end: 0),
        const SizedBox(height: 24),
        Text(
              'Supporting your child in a new way starts with practice.',
              style: GoogleFonts.cormorantGaramond(
                fontSize: 34,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                height: 1.15,
              ),
            )
            .animate()
            .fadeIn(delay: 150.ms, duration: 500.ms)
            .slideY(begin: 0.2, end: 0),
        const SizedBox(height: 12),
        Text(
          'Short daily practice sessions to help you build new supportive habits with your child.',
          style: GoogleFonts.nunito(
            fontSize: 16,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ).animate().fadeIn(delay: 250.ms, duration: 500.ms),
      ],
    );
  }

  Widget _buildIntroCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.validationCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withAlpha(38)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.access_time_rounded,
                color: AppColors.primary,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                '3 to 5 minutes per session',
                style: GoogleFonts.nunito(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Each practice scenario walks you through a structured way of responding to your child\'s stress or distress. Like learning any new skill, the more you rehearse, the more natural it becomes.',
            style: GoogleFonts.nunito(
              fontSize: 15,
              color: AppColors.textPrimary,
              height: 1.65,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 500.ms).slideY(begin: 0.1, end: 0);
  }

  Widget _buildFrameworkSection() {
    final steps = [
      _FrameworkStep(
        number: '01',
        title: 'Automatic Responses',
        description: 'Notice any urge to fix, reassure, explain, distract, or problem-solve. Before offering solutions, focus on helping your loved one feel understood.',
        color: const Color(0xFFBF7B5E),
      ),
      _FrameworkStep(
        number: '02',
        title: 'Validation',
        description: 'Validate your loved one\'s silence or reluctance to engage. Help them feel understood by considering their perspective, the relationship, and your own role. You can also validate possible underlying emotions such as sadness, fear, hopelessness, embarrassment, or anger.',
        color: const Color(0xFF4A7C6F),
      ),
      _FrameworkStep(
        number: '03',
        title: 'Emotional Support',
        description: 'Communicate that there is space to build trust, no pressure to engage, and time to go at their own pace. Let them know their silence does not push you away and that you will be there for them no matter what.',
        color: const Color(0xFF7B68AB),
      ),
      _FrameworkStep(
        number: '04',
        title: 'Practical Support',
        description: 'Offer low-pressure support such as sharing a cup of tea, spending time together without talking, or simply letting them know you will check in later. The goal is to communicate steady presence and understanding.',
        color: const Color(0xFF5B8FC9),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The EFFT Approach - Review',
          style: GoogleFonts.cormorantGaramond(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Remember, the validation and support framework guides each session.',
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 16),
        ...steps.asMap().entries.map((entry) {
          final i = entry.key;
          final step = entry.value;
          return _FrameworkStepTile(step: step)
              .animate()
              .fadeIn(delay: Duration(milliseconds: 350 + i * 80))
              .slideX(begin: 0.1, end: 0);
        }),
      ],
    );
  }

  Widget _buildInlineScenarios(BuildContext context) {
    final scenarios = scenarioData;
    return Column(
      children: scenarios.asMap().entries.map((entry) {
        final i = entry.key;
        final scenario = entry.value;
        return _InlineScenarioCard(scenario: scenario)
            .animate()
            .fadeIn(delay: Duration(milliseconds: 650 + i * 80))
            .slideY(begin: 0.1, end: 0);
      }).toList(),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const _AllScenariosScreen(),
            ),
          );
        },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text('Click here to continue practicing'),
      ),
    ).animate().fadeIn(delay: 900.ms, duration: 400.ms);
  }




  Widget _buildDisclaimer() {
    return Text(
      'StressLess is an educational tool based on the principles of emotional support from Emotino-Focused Family Therapy. It is not a crisis resource and does not replace professional mental health support.',
      style: GoogleFonts.nunito(
        fontSize: 12,
        color: AppColors.textLight,
        height: 1.6,
      ),
      textAlign: TextAlign.center,
    ).animate().fadeIn(delay: 700.ms, duration: 400.ms);
  }
}
// --- Inline Scenario Card (no emotion badge) ---------------------------------

class _InlineScenarioCard extends StatelessWidget {
  final Scenario scenario;

  const _InlineScenarioCard({required this.scenario});

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
            Text(
              scenario.title,
              style: GoogleFonts.cormorantGaramond(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
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
// --- All Scenarios Screen ----------------------------------------------------

class _AllScenariosScreen extends StatelessWidget {
  const _AllScenariosScreen();

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
              return _InlineScenarioCard(scenario: scenario)
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
// --- Helper Classes ------------------------------------------------------------

class _FrameworkStep {
  final String number;
  final String title;
  final String description;
  final Color color;

  const _FrameworkStep({
    required this.number,
    required this.title,
    required this.description,
    required this.color,
  });
}

class _FrameworkStepTile extends StatelessWidget {
  final _FrameworkStep step;

  const _FrameworkStepTile({required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: step.color.withAlpha(30),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                step.number,
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: step.color,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  step.description,
                  style: GoogleFonts.nunito(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
