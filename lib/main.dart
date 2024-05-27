import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/form_bloc.dart';
import 'bloc/form_event.dart';
import 'form_component.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => FormBloc(),
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Form'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              context.read<FormBloc>().add(SubmitForm());
            },
          ),
        ],
      ),
      body: FormComponent(),
    );
  }
}
