import 'package:counterofferv1/compornents/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: const AppBarComponentWidget(
        title: "Setting",
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).go('/setting/accountsetting');
                  },
                  child: const Text('Account')
                ),
              ),
            ),
            Card(
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).go('/setting/colorsetting');
                  },
                  child: const Text('Colorsetting')
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}