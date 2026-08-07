import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      // The appBar is now implicitly styled by the global theme
      appBar: AppBar(
        title: const Text('About StressLess'),
        // The background and text color will come from the appBarTheme
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWhatIsStressLess(context, textTheme),
            const SizedBox(height: 24),
            _buildInfoCard(
              context,
              title: 'EFFT Response Framework',
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.play_arrow,
                    // Use the theme's primary color or a secondary text color
                    color: theme.colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Caregivers often react automatically during stressful moments. The first step is recognizing these reactions so you can respond more intentionally.',
                      // Use the bodyLarge style from the theme
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoCard(
              context,
              title: 'Purpose of the App',
              child: Text(
                'The goal of StressLess is to help caregivers build new communication habits through short, repeatable practice sessions.',
                style: textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoCard(
              context,
              title: 'Project Team',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Developed by:',
                    // Use a relevant text style, e.g., titleMedium
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Use bodyMedium for list-style text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            ([
                                  // 'Matthew Miceli',
                                  // 'Yeonhee Lee',
                                  // 'Sheldon Maxwell',
                                  // 'Prabhsimsan Kaur',
                                  // 'Navleen Kaur',
                                  'Ramona Alcantara-McHugh',
                                  'Gohar Khosrupanah',
                                  'Haleigh Nealon',
                                  'Ren You',
                                  'Rachel Mokhtari',
                                  'Khalil Toure',
                                ])
                                .map(
                                  (name) => Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Text(
                                      name,
                                      style: textTheme.bodyMedium,
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: (['Algonquin College', 'Development Project'])
                            .map(
                              (name) => Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text(name, style: textTheme.bodyMedium),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWhatIsStressLess(BuildContext context, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Use headlineLarge for the main page title
        Text('What is StressLess?', style: textTheme.headlineLarge),
        const SizedBox(height: 16),
        // Use bodyLarge for the descriptive paragraphs
        Text(
          'StressLess is a mobile learning tool designed to help caregivers practice emotionally supportive responses to children experiencing stress or distress.',
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 12),
        Text(
          'The application uses short scenario-based practice sessions based on the emotional support module of Emotion-Focused Family Therapy (EFFT).',
          style: textTheme.bodyLarge,
        ),
      ],
    );
  }

  // This widget now uses the global CardTheme for its styling
  Widget _buildInfoCard(
    BuildContext context, {
    required String title,
    required Widget child,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      // The color, elevation, and shape are now sourced from the theme
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Use titleLarge for card titles
            Text(title, style: textTheme.titleLarge),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}
