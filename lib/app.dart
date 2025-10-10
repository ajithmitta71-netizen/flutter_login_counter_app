import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth/login_page.dart';
import 'home/home_page.dart';
import 'auth/auth_controller.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);

    return MaterialApp(
      title: 'Login Counter App',
      debugShowCheckedModeBanner: false,
      home: user.when(
        data: (user) {
          if (user != null) {
            return const HomePage(); // Logged-in user
          } else {
            return const LoginPage(); // Not logged-in user
          }
        },
        loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
        error: (e, _) => Scaffold(
          body: Center(child: Text('Error: $e')),
        ),
      ),
    );
  }
}
