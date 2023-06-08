import 'package:alerta/globals/environment.dart';
import 'package:alerta/services/helper_functions.dart';
import 'package:alerta/utils/logger.dart';
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
  late String _phone;

  @override
  void initState() {
    super.initState();
    _getUserInState();
  }

  Future<void> _getUserInState() async {
    await HelperFunctions.getUserNamePreference().then((value) {
      _username = value!;
    });
    await HelperFunctions.getUserEmailPreference().then((value) {
      _email = value!;
    });
    await HelperFunctions.getUserPhonePreference().then((value) {
      _phone = value!;
    });

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    Logs.p.i(_formKey.currentState?.value);
  }

  _saveData(var data) {
    Logs.p.i(data);
    try {
      HelperFunctions.saveUserNamePreference(data["username"]);
      HelperFunctions.saveUserEmailPreference(data["email"]);
      HelperFunctions.saveUserPhonePreference(data["phone"]);

      Environment.showSnackbar(
          context, 'Se guardaron los datos correctamente.');
    } catch (e) {
      Environment.showSnackbar(context, 'Ocurrio un error.');
    }
  }

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
                FormBuilderValidators.required(
                    errorText: 'El número de cuenta es obligatorio.'),
                FormBuilderValidators.match(Environment.username,
                    errorText: 'Un número de cuenta a 9 digitos.')
              ]),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              name: 'email',
              initialValue: _email,
              decoration: Environment.inputDecoration(
                  'Correo electrónico', 'Ingresa tu correo electrónico'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'El correo electrónico es obligatorio.'),
                FormBuilderValidators.email(),
              ]),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              name: 'phone',
              initialValue: _phone,
              decoration: Environment.inputDecoration('Télefono celular',
                  'Ingresa el número de tu télefono personal'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'El número de télefono es obligatorio.'),
                FormBuilderValidators.match(Environment.phone,
                    errorText: 'Un número de télefono a 10 digitos.')
              ]),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo, // Background color
                ),
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    _saveData(_formKey.currentState?.value);
                  }
                },
                child: const Text(
                  'Guardar datos',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
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
