import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const StressLessApp());
}

class StressLessApp extends StatelessWidget {
  const StressLessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EFFT Companion',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const DisclaimerGate(),
    );
  }
}

class DisclaimerGate extends StatefulWidget {
  const DisclaimerGate({super.key});

  @override
  State<DisclaimerGate> createState() => _DisclaimerGateState();
}

class _DisclaimerGateState extends State<DisclaimerGate> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDisclaimer();
    });
  }

  void _showDisclaimer() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Before You Begin',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          content: SingleChildScrollView(
            child: Text(
              'This app is meant to be used as a supplemental resource when working '
                  'with a clinician or therapist trained in Emotion-Focused Family Therapy. '
                  'It is meant solely for educational purposes and is not a substitute for professional mental health support. '
                  'Every family\'s situation is unique, and what is appropriate for one may not be for another - only you and a qualified '
                  'professional who knows you and your child can determine that. Use of this content is therefore at your own discretion and risk, '
                  'and the creators cannot be held responsible for outcomes arising from its use.',
              style: TextStyle(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('I Agree'),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MainScreen();
  }
}
