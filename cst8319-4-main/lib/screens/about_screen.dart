import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('About StressLess')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(
              context,
              title: 'Project Team',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Developed by:', style: textTheme.titleMedium),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            ([
                                  'Matthew Miceli',
                                  'Yeonhee Lee',
                                  'Sheldon Maxwell',
                                  'Prabhsimsan Kaur',
                                  'Navleen Kaur',
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
