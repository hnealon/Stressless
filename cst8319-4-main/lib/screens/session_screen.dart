import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../models/models.dart';
import '../widgets/shared_widgets.dart';
import 'steps/step_automatic_response.dart';
import 'steps/step_validation.dart';
import 'steps/step_emotional_support.dart';
import 'steps/step_practical_support.dart';
import 'script_screen.dart';

class SessionScreen extends StatefulWidget {
  final SessionState session;

  const SessionScreen({super.key, required this.session});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  late SessionState _session;

  static const List<String> _stepLabels = [
    'Automatic',
    'Validation',
    'Emotional',
    'Practical',
  ];

  @override
  void initState() {
    super.initState();
    _session = widget.session;
  }

  void _goToStep(int step) {
    setState(() {
      _session.currentStep = step;
    });
  }

  void _next() {
    if (_session.currentStep < 3) {
      _goToStep(_session.currentStep + 1);
    } else {
      // Navigate to script
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ScriptScreen(session: _session),
        ),
      );
    }
  }

  void _back() {
    if (_session.currentStep > 0) {
      _goToStep(_session.currentStep - 1);
    } else {
      Navigator.pop(context);
    }
  }

  Widget _buildCurrentStep() {
    switch (_session.currentStep) {
      case 0:
        return StepAutomaticResponse(
          session: _session,
          onNext: _next,
          onBack: _back,
        );
      case 1:
        return StepValidation(
          session: _session,
          onNext: _next,
          onBack: _back,
        );
      case 2:
        return StepEmotionalSupport(
          session: _session,
          onNext: _next,
          onBack: _back,
        );
      case 3:
        return StepPracticalSupport(
          session: _session,
          onNext: _next,
          onBack: _back,
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          tooltip: 'Return to scenarios',
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                backgroundColor: AppColors.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: Text(
                  'Leave this session?',
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                content: Text(
                  'Your progress in this session won\'t be saved.',
                  style: GoogleFonts.nunito(fontSize: 14, color: AppColors.textSecondary),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: Text(
                      'Stay',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Leave',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        title: Text(
          _session.scenario.title,
          style: GoogleFonts.cormorantGaramond(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
            child: StepProgressBar(
              totalSteps: 4,
              currentStep: _session.currentStep,
              labels: _stepLabels,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.05, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: KeyedSubtree(
            key: ValueKey(_session.currentStep),
            child: _buildCurrentStep(),
          ),
        ),
      ),
    );
  }
}
