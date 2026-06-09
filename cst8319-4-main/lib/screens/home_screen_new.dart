import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import 'scenario_list_screen.dart';

class HomeScreenNew extends StatelessWidget {
  const HomeScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite_border,
              color: AppColors.primary,
            ), // Placeholder for logo
            const SizedBox(width: 8),
            Text(
              'StressLess',
              style: GoogleFonts.cormorantGaramond(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Helping caregivers support children\'s stress and distress.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ).animate().fadeIn(delay: 200.ms),
            const SizedBox(height: 24),
            Text(
              'Practice supportive responses using guidance based on Emotion-Focused Family Therapy (EFFT).',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ).animate().fadeIn(delay: 400.ms),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScenarioListScreen(),
                  ),
                );
              },
              child: const Text('Start Practice Session'),
            ).animate().scale(delay: 600.ms),
            const SizedBox(height: 48),
            _buildSectionHeader(context, 'Why StressLess?', Icons.help_outline),
            const SizedBox(height: 16),
            Text(
              'Caregivers often learn emotional support strategies through workshops or educational materials, but applying these techniques in stressful moments can be difficult.\n\nStressLess helps caregivers rehearse supportive responses through short, structured practice scenarios.',
              style: Theme.of(context).textTheme.bodyMedium,
            ).animate().fadeIn(delay: 800.ms),
            const SizedBox(height: 48),
            _buildSectionHeader(
              context,
              'How Practice Works',
              Icons.lightbulb_outline,
            ),
            const SizedBox(height: 24),
            _buildPracticeStep(
              context,
              '1',
              'Identify your automatic response',
              1000.ms,
            ),
            _buildPracticeStep(
              context,
              '2',
              'Practice validation skills',
              1100.ms,
            ),
            _buildPracticeStep(
              context,
              '3',
              'Identify emotional support sentences',
              1200.ms,
            ),
            _buildPracticeStep(
              context,
              '4',
              'Consider practical support strategies',
              1300.ms,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(icon, color: AppColors.textSecondary, size: 28),
        const SizedBox(width: 12),
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
      ],
    ).animate().fadeIn(delay: 700.ms);
  }

  Widget _buildPracticeStep(
    BuildContext context,
    String number,
    String text,
    Duration delay,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                text,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(height: 1.5),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: delay).slideX(begin: 0.2, duration: 400.ms);
  }
}
