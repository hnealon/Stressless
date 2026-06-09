import '../models/models.dart';

class Session {
  final Scenario scenario;
  AutomaticResponse? selectedResponse;
  String? validationText;
  List<String> selectedEmotionalSupport = [];
  List<String> selectedPracticalSupport = [];
  String reflection = '';

  Session({
    required this.scenario,
    this.selectedResponse,
    this.validationText,
  });
}
