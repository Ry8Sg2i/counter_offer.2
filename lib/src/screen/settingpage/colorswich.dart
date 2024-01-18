import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/provider/river1.dart';

// 1. ConsumerWidgetを継承する
class Colorsetting extends ConsumerWidget {
  const Colorsetting({Key? key}) : super(key: key);

  @override
  // 2. 引数に WidgetRef ref を取る 
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch() を宣言する
    final themeMode = ref.watch(themeModeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brightness Demo"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: PopupMenuButton<ThemeMode>(
              icon: const Icon(Icons.settings_brightness,),
              // themeMode.state に選択された 外観モード をセットする
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
      body: const Center(
        child: Text(
          "設定に応じてfontColorが入れ替わる", 
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}


