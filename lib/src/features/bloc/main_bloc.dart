import 'package:flutter/material.dart';

class MainBloc extends StatefulWidget {
  const MainBloc({super.key});

  @override
  State<MainBloc> createState() => _MainBlocState();
}

class _MainBlocState extends State<MainBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'BLOC',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Container(),
    );
  }
}
