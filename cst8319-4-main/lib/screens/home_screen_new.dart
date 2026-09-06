import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import 'about_screen.dart';
import 'support_app_screen.dart';

class HomeScreenNew extends StatelessWidget {
  const HomeScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.favorite_border, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(
              'EFFT Companion',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to EFFT Companion',
              style: textTheme.headlineLarge,
            ).animate().fadeIn(delay: 100.ms),
            const SizedBox(height: 16),
            Text(
              'Drawing on the principles and techniques of Emotion-Focused Family Therapy,'
              ' EFFT Companion and Script-Builder offers parents and caregivers the opportunity to learn and practice new tools to round out their toolkit.',
              style: textTheme.bodyLarge,
            ).animate().fadeIn(delay: 200.ms),
            const SizedBox(height: 24),

            const SizedBox(height: 24),

            // Card 0: What is EFFT Companion?
            _buildInfoCard(
              context,
              title: 'What is EFFT Companion?',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EFFT Companion and Script-Builder is a mobile learning tool designed to help caregivers practice supportive responses to children experiencing stress or distress.',
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'The application uses short scenario-based practice sessions based on the emotional and '
                    'relational support modules of Emotion-Focused Family Therapy (EFFT).',
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'The goal of this app is to support parents to increase skill and fluency with new emotional '
                    'and relational skills through short, repeatable practice sessions.',
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 250.ms),
            const SizedBox(height: 20),

            // Card 1: Welcome / the problem this app addresses
            _buildInfoCard(
              context,
              title: 'You\'re not alone in this',
              child: Text(
                'Parenting isn\'t easy. It\'s even harder in moments of tension, stress, and distress. '
                'We all know what it\'s like to be at a loss for what to say or how to say it - and even '
                'the most caring, attuned parents find themselves there sometimes. This app is here to help.',
                style: textTheme.bodyLarge,
              ),
            ).animate().fadeIn(delay: 300.ms),
            const SizedBox(height: 20),

            // Card 2: How this app can help
            _buildInfoCard(
              context,
              title: 'How this app can help',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The tools here are grounded in Emotion-Focused Family Therapy (EFFT), a well-researched approach that '
                    'recognizes caregivers as key agents of healing and growth in their children\'s lives. Informed by neurobiology, '
                    'the Validation & Support Framework at the heart of this app is designed to help shift children from a place of '
                    'stress and reactivity to one of openness, flexibility, and engagement, and caregivers are uniquely positioned to make that possible.',
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'You\'ll find teachings that walk you through the Validation & Support framework, opportunities to practice, '
                    'and a script builder to help you find your own words. Whether you\'re navigating everyday stress or more emotionally charged moments, '
                    'these tools offer a compassionate, structured way to find your way together. ',
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 400.ms),
            const SizedBox(height: 20),

            // Card 3: Therapeutic Apology callout
            _buildInfoCard(
              context,
              title: 'Want to go further?',
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star_border_outlined,
                    color: Theme.of(context).colorScheme.primary,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'For those who want to deepen their skills, this app also includes the opportunity to learn about EFFT\'s Therapeutic Apology, '
                      'an advanced validation and support technique for repairing ruptures and deepening trust with your child, among other potential benefits.',
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 500.ms),
            const SizedBox(height: 20),

            // Card 4: Companion to clinician support, and closing reassurance
            _buildInfoCard(
              context,
              title: 'A companion to support your effort',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'This app is designed to complement the support of an EFFT-trained clinician. Think of it as a companion resource, '
                    'a place to revisit what you\'re learning, practice new skills, and build confidence between sessions.',
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'You don\'t have to be a perfect parent. You already care, and that matters more than you might think. This app is simply here to help you translate that care into words.',
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 600.ms),
            const SizedBox(height: 12),

            // Support this app (contribution entry point)
            _buildSupportAppCard(context),

            const SizedBox(height: 20),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 24),

            // About entry point (moved here from its own nav tab)
            _buildAboutCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required String title,
    required Widget child,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: textTheme.titleLarge),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildSupportAppCard(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        leading: const Icon(
          //Icons.handshake_rounded,
          Icons.wallet_giftcard_rounded,
          color: AppColors.primary,
          size: 26,
        ),
        title: Text(
          'Contribute',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            'Contribute - help fund development and access to care for families who need it.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 14,
          color: AppColors.textSecondary,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SupportAppScreen()),
          );
        },
      ),
    ).animate().fadeIn(delay: 650.ms);
  }

  Widget _buildAboutCard(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        leading: const Icon(
          Icons.info_outline,
          color: AppColors.primary,
          size: 26,
        ),
        title: Text(
          'Project Team',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 14,
          color: AppColors.textSecondary,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AboutScreen()),
          );
        },
      ),
    ).animate().fadeIn(delay: 700.ms);
  }
}
