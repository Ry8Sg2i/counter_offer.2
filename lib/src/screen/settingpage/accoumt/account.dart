import 'package:counterofferv1/compornents/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AccountSetting extends ConsumerWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: const AppBarComponentWidget(
        title: "Setting",
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10,),
                  child: const Text("アカウントからログアウトしたり、アカウント停止オプションの詳細を確認したりできます。"),
                ),
              ],
            ),
            Card(
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).go('/setting/accountsetting/logout');
                  },
                  child: const Text('Logout')
                ),
              ),
            ),
            Card(
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).go('/setting/accountsetting/deleteaccount');
                  },
                  child: const Text('DeleteAccount')
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}