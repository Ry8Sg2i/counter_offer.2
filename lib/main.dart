import 'package:counterofferv1/colors/color_schemes.g.dart';
import 'package:counterofferv1/route/router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/provider/river1.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: CounterOffer()));
}

class CounterOffer extends ConsumerWidget {
  const CounterOffer({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      // アプリ名
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.transparent,
          ),
        ),
        title: 'CounterOffer',
        theme: ThemeData(
          // テーマカラー
          colorScheme: lightColorScheme,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.transparent,
          ),
        ),
        themeMode: themeMode,
        routerConfig: goRouter,
    );
  }
}