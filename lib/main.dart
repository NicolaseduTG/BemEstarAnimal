import 'package:bem_estar_animal/constants.dart';
import 'package:flutter/material.dart';
import 'registro.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Nao foi possivel executar');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: kPrimaryColor,
            maximumSize: const Size(400, 40),
            minimumSize: const Size(400, 40),
          )),
          appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor)),
      title: 'Principal',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        //'Animais': (context) => VerAnimais(),
        'Registro': (context) => Registrar(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri toLauch = Uri(
      scheme: 'https',
      host: 'www.google.com',
      path: '/maps/search/veterinarios');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Bem Estar Animal',
          )),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'Registro');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.pets),
                      Text('  Registrar Animal'),
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'Animais');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_library),
                      Text('  Ver Animais'),
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await launchInBrowser(toLauch);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.medical_services),
                      Text('  Veterinarios'),
                    ],
                  ))
            ]),
      ),
    );
  }
}
