// ─── Scenario Model ───────────────────────────────────────────────────────────

class Scenario {
  final String id;
  final String title;
  final String childAge;
  final String situation;
  final String childStatement;
  final String emotionTag;
  final List<AutomaticResponse> automaticResponses;
  final ValidationContent validationContent;
  final List<String> emotionalSupportOptions;
  final List<String> practicalSupportOptions;

  const Scenario({
    required this.id,
    required this.title,
    required this.childAge,
    required this.situation,
    required this.childStatement,
    required this.emotionTag,
    required this.automaticResponses,
    required this.validationContent,
    required this.emotionalSupportOptions,
    required this.practicalSupportOptions,
  });
}

class AutomaticResponse {
  final String text;
  final String type; // 'fixing' | 'reassuring' | 'problem-solving' | 'validating'
  final String microfeedback;

  const AutomaticResponse({
    required this.text,
    required this.type,
    required this.microfeedback,
  });
}

class ValidationContent {
  final List<String> validationSentences;
  final List<String> becauseStatements;

  const ValidationContent({
    required this.validationSentences,
    required this.becauseStatements,
  });
}

// ─── Session State Model ──────────────────────────────────────────────────────

class SessionState {
  final Scenario scenario;
  int currentStep; // 0–4

  // Step 1 – Awareness
  AutomaticResponse? selectedAutomaticResponse;

  // Step 2 – Validation
  String? selectedValidationSentence;
  List<String> validationBecause;

  // Step 3 – Emotional Support
  List<String> selectedEmotionalSupport;

  // Step 4 – Practical Support
  List<String> selectedPracticalSupport;

  SessionState({
    required this.scenario,
    this.currentStep = 0,
    this.selectedAutomaticResponse,
    this.selectedValidationSentence,
    List<String>? validationBecause,
    List<String>? selectedEmotionalSupport,
    List<String>? selectedPracticalSupport,
  })  : validationBecause = validationBecause ?? [],
        selectedEmotionalSupport = selectedEmotionalSupport ?? [],
        selectedPracticalSupport = selectedPracticalSupport ?? [];

  String get builtValidationSentence {
    if (selectedValidationSentence == null) return '';

    String becausePart = '';
    if (validationBecause.isNotEmpty) {
      final statements = validationBecause.map((b) => b.replaceFirst('because ', '')).toList();
      if (statements.length == 1) {
        becausePart = ' because ${statements[0]}';
      } else if (statements.length == 2) {
        becausePart = ' because ${statements[0]} and ${statements[1]}';
      } else {
        becausePart = ' because ${statements.sublist(0, statements.length - 1).join(', ')}, and ${statements.last}';
      }
    }

    return '$selectedValidationSentence$becausePart';
  }

  String get fullScript {
    final parts = <String>[];
    if (builtValidationSentence.isNotEmpty) {
      parts.add(builtValidationSentence);
    }
    parts.addAll(selectedEmotionalSupport);
    if (selectedPracticalSupport.isNotEmpty) {
      parts.addAll(selectedPracticalSupport);
    }
    return parts.join(' ');
  }
}
