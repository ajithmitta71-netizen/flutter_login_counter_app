import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_counter_app/app.dart';
import 'package:flutter_login_counter_app/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //ensures widgets and Firebase setup before runApp.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // initializes Firebase services.
  runApp(
    ProviderScope(child: MyApp()),
  ); //makes Riverpod providers globally accessible
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
