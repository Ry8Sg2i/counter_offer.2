import 'package:counterofferv1/auth/login_page.dart';
import 'package:counterofferv1/colors/color_schemes.g.dart';
import 'package:counterofferv1/route/router.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
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
        routerConfig: goRouter,
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StreamProvider を監視し、AsyncValue<User?> を取得する。
    final authStateAsync = ref.watch(authStateChangesProvider);
    // パターンマッチングを使用して、状態をUIにマッピングする
    return authStateAsync.when(
      data: (user) => user != null ? const HomePage() : const LoginPage(),
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
