import 'package:flutter/material.dart';

class MainProvider extends StatefulWidget {
  const MainProvider({super.key});

  @override
  State<MainProvider> createState() => _MainProviderState();
}

class _MainProviderState extends State<MainProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'PROVIDER',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Container(),
    );
  }
}
