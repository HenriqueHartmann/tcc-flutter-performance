import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_performance_app/src/features/provider/card_provider.dart';
import 'package:tcc_performance_app/src/features/provider/screen_provider.dart';
import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class MainProvider extends StatefulWidget {
  const MainProvider({super.key});

  @override
  State<MainProvider> createState() => _MainProviderState();
}

class _MainProviderState extends State<MainProvider> {
  late ItemListModel itemList;

  @override
  Widget build(BuildContext context) {
    itemList = ModalRoute.of(context)!.settings.arguments as ItemListModel;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CardProvider(data: itemList),
        ),
      ],
      child: ScreenProvider(),
    );
  }
}
