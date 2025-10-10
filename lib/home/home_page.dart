import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart' show StateProvider;
import '../auth/auth_controller.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final auth = ref.read(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async => await auth.signOut(),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $count', style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).state++,
              child: const Text("Increment"),
            ),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).state--,
              child: const Text("Decrement"),
            ),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).state = 0,
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
