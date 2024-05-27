abstract class FormEvent {}

class AddComponent extends FormEvent {}

class RemoveComponent extends FormEvent {
  final int index;

  RemoveComponent(this.index);
}

class UpdateComponent extends FormEvent {
  final int index;
  final String label;
  final String infoText;
  final Set<String> settings;

  UpdateComponent(this.index, this.label, this.infoText, this.settings);
}

class SubmitForm extends FormEvent {}
