class FormComponentData {
  String label;
  String infoText;
  Set<String> settings;

  FormComponentData({
    required this.label,
    required this.infoText,
    required this.settings,
  });

  FormComponentData copyWith({
    String? label,
    String? infoText,
    Set<String>? settings,
  }) {
    return FormComponentData(
      label: label ?? this.label,
      infoText: infoText ?? this.infoText,
      settings: settings ?? this.settings,
    );
  }
}

abstract class FormmState {}

class FormInitial extends FormmState {
  final List<FormComponentData> components;

  FormInitial(this.components);
}
