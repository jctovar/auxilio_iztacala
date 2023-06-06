import 'package:flutter/material.dart';
import 'package:alerta/globals/environment.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({Key? key}) : super(key: key);

  _title(title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w800,
          color: Colors.blue,
          letterSpacing: -.3),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  _subtitle(subTitle) {
    return Text(
      subTitle,
      style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
          letterSpacing: -.3),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Environment.backgroundColor,
        appBar: AppBar(
          title: const Text("Creditos"),
        ),
        body: Center(
            child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                    height: 150,
                    child: Image.asset('assets/images/logo_login.png')),
              ),
              const SizedBox(height: 10),
              _title('Lider de proyecto'),
              _subtitle('Ing. Juan Carlos Tovar Gómez'),
              const SizedBox(height: 10),
              _title('Desarrollo'),
              _subtitle('Ing. Juan Carlos Tovar Gómez'),
              const SizedBox(height: 10),
              _title('Diseño UI y UX'),
              _subtitle('Ing. Juan Carlos Tovar Gómez'),
            ],
          ),
        )));
  }
}
