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
  final List<String> emotionalSupport;
  final List<String> practicalSupport;
  final int becauseCount;
  final int emotionalCount;
  final int practicalCount;
}
