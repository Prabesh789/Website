// presentation/my_app/my_app.dart
import 'package:flutter/material.dart';
import 'package:portfolio_web/presentation/utils/extensions/theme.dart';
import 'package:portfolio_web/presentation/views/main_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'raiprabesh',
      debugShowCheckedModeBanner: false,
      theme: context.theme(),
      home: MainView(),
    );
  }
}
