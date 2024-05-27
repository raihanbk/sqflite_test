import 'package:bloc/bloc.dart';
import 'form_event.dart';
import 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormmState> {
  FormBloc() : super(FormInitial([
    FormComponentData(label: '', infoText: '', settings: {}),
  ])) {
    on<AddComponent>(_onAddComponent);
    on<RemoveComponent>(_onRemoveComponent);
    on<UpdateComponent>(_onUpdateComponent);
    on<SubmitForm>(_onSubmitForm);
  }

  void _onAddComponent(AddComponent event, Emitter<FormmState> emit) {
    if (state is FormInitial) {
      final components = List<FormComponentData>.from((state as FormInitial).components)
        ..add(FormComponentData(label: '', infoText: '', settings: {}));
      emit(FormInitial(components));
    }
  }

  void _onRemoveComponent(RemoveComponent event, Emitter<FormmState> emit) {
    if (state is FormInitial) {
      final components = List<FormComponentData>.from((state as FormInitial).components);
      if (components.length > 1) {
        components.removeAt(event.index);
        emit(FormInitial(components));
      }
    }
  }

  void _onUpdateComponent(UpdateComponent event, Emitter<FormmState> emit) {
    if (state is FormInitial) {
      final components = List<FormComponentData>.from((state as FormInitial).components);
      components[event.index] = components[event.index].copyWith(
        label: event.label,
        infoText: event.infoText,
        settings: event.settings,
      );
      emit(FormInitial(components));
    }
  }

  void _onSubmitForm(SubmitForm event, Emitter<FormmState> emit) {
    if (state is FormInitial) {
      for (var component in (state as FormInitial).components) {
        print('Label: ${component.label}, Info-Text: ${component.infoText}, Settings: ${component.settings.join(', ')}');
      }
    }
  }
}
