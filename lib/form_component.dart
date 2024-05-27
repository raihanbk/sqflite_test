import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/form_bloc.dart';
import 'bloc/form_event.dart';
import 'bloc/form_state.dart';

class FormComponent extends StatelessWidget {
  const FormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBloc, FormState>(
      builder: (context, state) {
        if (state is FormInitial) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ...state.components.asMap().entries.map((entry) {
                  int index = entry.key;
                  FormComponentData data = entry.value;

                  return Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Label *'),
                            initialValue: data.label,
                            onChanged: (value) {
                              context.read<FormBloc>().add(UpdateComponent(
                                index,
                                value,
                                data.infoText,
                                data.settings,
                              ));
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Info-Text'),
                            initialValue: data.infoText,
                            onChanged: (value) {
                              context.read<FormBloc>().add(UpdateComponent(
                                index,
                                data.label,
                                value,
                                data.settings,
                              ));
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: data.settings.contains('Required'),
                                onChanged: (value) {
                                  final settings = Set<String>.from(data.settings);
                                  if (value == true) {
                                    settings.add('Required');
                                  } else {
                                    settings.remove('Required');
                                  }
                                  context.read<FormBloc>().add(UpdateComponent(
                                    index,
                                    data.label,
                                    data.infoText,
                                    settings,
                                  ));
                                },
                              ),
                              Text('Required'),
                              Checkbox(
                                value: data.settings.contains('Readonly'),
                                onChanged: (value) {
                                  final settings = Set<String>.from(data.settings);
                                  if (value == true) {
                                    settings.add('Readonly');
                                  } else {
                                    settings.remove('Readonly');
                                  }
                                  context.read<FormBloc>().add(UpdateComponent(
                                    index,
                                    data.label,
                                    data.infoText,
                                    settings,
                                  ));
                                },
                              ),
                              Text('Readonly'),
                              Checkbox(
                                value: data.settings.contains('Hidden Field'),
                                onChanged: (value) {
                                  final settings = Set<String>.from(data.settings);
                                  if (value == true) {
                                    settings.add('Hidden Field');
                                  } else {
                                    settings.remove('Hidden Field');
                                  }
                                  context.read<FormBloc>().add(UpdateComponent(
                                    index,
                                    data.label,
                                    data.infoText,
                                    settings,
                                  ));
                                },
                              ),
                              Text('Hidden Field'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (state.components.length > 1)
                                TextButton(
                                  onPressed: () {
                                    context.read<FormBloc>().add(RemoveComponent(index));
                                  },
                                  child: Text('Remove'),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                TextButton(
                  onPressed: () {
                    context.read<FormBloc>().add(AddComponent());
                  },
                  child: Text('ADD'),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
