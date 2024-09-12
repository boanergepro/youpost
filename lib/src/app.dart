import 'package:flutter/material.dart';
import 'package:youpost/src/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(
            0,
            55,
            165,
            1.0,
          ),
        ),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
