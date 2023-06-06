import 'package:alerta/pages/credits_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  Future<void> _openMail(String url) async {
    if (await canLaunch('mailto:$url')) {
      await launch(
        'mailto:$url',
      );
      return;
    }
  }

  _textButton(String myText) {
    return TextButton(
      onPressed: () {
        _openMail(myText);
      },
      child: Text(
        myText,
        style: const TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.italic,
            color: Colors.lightBlueAccent),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(
            image: AssetImage('assets/images/logo_about.png'), width: 200),
        const Text(
            'Aplicación desarrollada por la Facultad de Estudios Superiores Iztacala. '
            'Hecho en México, Universidad Nacional Autónoma de México (UNAM), '
            'todos los derechos reservados 2021.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black45)),
        _textButton('apps@iztacala.unam.mx'),
        SizedBox(
          height: 50,
          width: 250,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo, // Background color
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return const CreditsPage();
                },
                fullscreenDialog: true,
              ));
            },
            child: const Text(
              'Creditos',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
