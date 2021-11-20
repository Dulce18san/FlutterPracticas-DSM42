import 'package:flutter/material.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SignUpScreen(),
      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: SizedBox(
          width: 350,
          height: 600,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _edadTextController = TextEditingController();
  final _correoTextController = TextEditingController();
  final _carreraTextController = TextEditingController();

  double _formProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: _formProgress),
          Text('Formulario de Datos',
              style: Theme.of(context).textTheme.headline4),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: InputDecoration(hintText: 'Nombre(s):'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: InputDecoration(hintText: 'Apellidos: '),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _edadTextController,
              decoration: InputDecoration(hintText: 'Edad:'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _correoTextController,
              decoration: InputDecoration(hintText: 'Correo Electronico:'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _carreraTextController,
              decoration: InputDecoration(hintText: 'Carrera:'),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.blue;
              }),
            ),
            onPressed: null,
            child: Text('Iniciar Sesión'),
          ),
        ],
      ),
    );
  }
}
