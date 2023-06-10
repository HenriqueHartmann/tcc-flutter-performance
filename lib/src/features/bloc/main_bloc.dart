import 'package:flutter/material.dart';
import 'package:tcc_performance_app/src/utils/common/widgets/app_bar_widget.dart';

class MainBloc extends StatefulWidget {
  const MainBloc({super.key});

  @override
  State<MainBloc> createState() => _MainBlocState();
}

class _MainBlocState extends State<MainBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'BLoC',),
      body: Container(),
    );
  }
}
