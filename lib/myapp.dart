import 'package:flutter/material.dart';
import 'package:play/screens/main_menu_screen.dart';

import 'package:play/theme/theme.dart';
import 'package:play/utils/lifecycle_watcher_state.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends LifecycleWatcherState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Investment Port",
      theme: theme(),
      home: const MainMenuScreen(),
    );
  }

  @override
  void onDetached() {
    debugPrint("onDetached");
  }

  @override
  void onInactive() {
    debugPrint("onInactive");
  }

  @override
  void onPaused() {
    debugPrint("onPaused");
  }

  @override
  void onResumed() {
    debugPrint("onResumed");
  }
}
