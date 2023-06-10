import 'package:flutter/material.dart';
import 'package:tcc_performance_app/src/utils/common/widgets/app_bar_widget.dart';

class MainProvider extends StatefulWidget {
  const MainProvider({super.key});

  @override
  State<MainProvider> createState() => _MainProviderState();
}

class _MainProviderState extends State<MainProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Provider',),
      body: Container(),
    );
  }
}
