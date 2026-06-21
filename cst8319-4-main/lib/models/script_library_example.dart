/// A single selectable option with the category it belongs to.
///
/// Source: EFFT-EC_General_and_Micro-skills.docx — caregivers are shown
/// the category alongside each option so they keep learning the underlying
/// skill, not just memorizing sentences.
class CategorizedOption {
  const CategorizedOption({
    required this.category,
    required this.text,
  });

  final String category;
  final String text;
}

/// A pre-written script example from the client document library.
///
/// Source: EC_Scripts_Youth_Ages_8-12.revised.docx (EFFT Validate & Support)
class ScriptLibraryExample {
  const ScriptLibraryExample({
    required this.id,
    required this.emotion,
    required this.title,
    required this.sourceReference,
    required this.validationOpener,
    required this.becauseStatements,
    required this.emotionalSupport,
    required this.practicalSupport,
    this.becauseCount = 3,
    this.emotionalCount = 2,
    this.practicalCount = 2,
  });

  final String id;
  final String emotion;
  final String title;
  final String sourceReference;
  final String validationOpener;
  final List<String> becauseStatements;
  final List<CategorizedOption> emotionalSupport;
  final List<CategorizedOption> practicalSupport;
  final int becauseCount;
  final int emotionalCount;
  final int practicalCount;
}