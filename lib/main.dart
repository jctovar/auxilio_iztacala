import 'package:alerta/pages/home_page.dart';
import 'package:alerta/services/helper_functions.dart';
import 'package:alerta/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var uuid = const Uuid();

  @override
  void initState() {
    super.initState();
    _getUuidUser();
  }

  _getUuidUser() async {
    await HelperFunctions.getUuidUserPreference().then((value) {
      if (value == '') {
        HelperFunctions.saveUuidUserPreference(uuid.v4());
      } else {
        Logs.p.i('Recuperado uuid... $value');
      }
      setState(() {});
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auxilio iztacala',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Auxilio iztacala'),
    );
  }
}
