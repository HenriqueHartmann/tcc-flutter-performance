import 'package:flutter/material.dart';
import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class MainSetState extends StatefulWidget {
  const MainSetState({
    super.key,
  });

  @override
  State<MainSetState> createState() => _MainSetStateState();
}

class _MainSetStateState extends State<MainSetState> {
  late List<ItemModel> data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as List<ItemModel>;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'SetState',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                data[index].title,
              ),
            );
          },
        ),
      ),
    );
  }
}
