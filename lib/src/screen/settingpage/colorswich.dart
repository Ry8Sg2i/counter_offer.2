import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/provider/river1.dart';

class Colorsetting extends ConsumerWidget {
  const Colorsetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brightness Demo"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: PopupMenuButton<ThemeMode>(
              icon: const Icon(Icons.settings_brightness,),
              onSelected: (ThemeMode selectedThemeMode) => themeMode.state = selectedThemeMode,
              itemBuilder: (context) => <PopupMenuEntry<ThemeMode>>[
                const PopupMenuItem(
                  value: ThemeMode.system,
                  child: Text('システム設定に従う'),
                ),
                const PopupMenuItem(
                  value: ThemeMode.light, 
                  child: Text('ライトモード'),
                ),
                const PopupMenuItem(
                  value: ThemeMode.dark,
                  child: Text('ダークモード'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


