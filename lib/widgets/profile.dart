import 'package:alerta/globals/environment.dart';
import 'package:alerta/services/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormBuilderState>();
  late String _username;
  late String _email;

  @override
  void initState() {
    super.initState();
    _getUserInState();
  }

  Future<void> _getUserInState() async {
    await HelperFunctions.getUserNamePreference().then((value) {
      _username = value!;
      print(_username);
    });
    await HelperFunctions.getUserEmailPreference().then((value) {
      _email = value!;
      print(_email);
    });

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    print(_formKey.currentState?.value);
  }

  _saveData() {}

  formBuilder(context) {
    return FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            FormBuilderTextField(
                name: 'username',
                key: Key(_username.toString()),
                initialValue: _username,
                decoration: Environment.inputDecoration(
                    'Número de cuenta', 'Ingresa tu número de cuenta'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                onChanged: _saveData()),
            const SizedBox(height: 10),
            FormBuilderTextField(
              name: 'email',
              initialValue: _email,
              decoration: Environment.inputDecoration(
                  'Correo electrónico', 'Ingresa tu correo electrónico'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FutureBuilder(
        future: HelperFunctions.getUserNamePreference(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return formBuilder(context);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
