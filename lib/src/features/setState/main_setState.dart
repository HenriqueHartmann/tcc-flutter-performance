import 'package:flutter/material.dart';

class MainSetState extends StatefulWidget {
  const MainSetState({super.key});

  @override
  State<MainSetState> createState() => _MainSetStateState();
}

class _MainSetStateState extends State<MainSetState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'SetState',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Container(),
    );
  }
}
