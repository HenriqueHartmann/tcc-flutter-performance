import 'dart:developer';

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
  late ItemListModel itemList;
  bool allTitleFontColorSwitch = false;

  @override
  Widget build(BuildContext context) {
    log('\nBUILDED');

    itemList = ModalRoute.of(context)!.settings.arguments as ItemListModel;

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
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Change font colors of all titles'),
                    Switch(
                        activeColor: Colors.amber,
                        inactiveThumbColor: Colors.blueGrey.shade600,
                        inactiveTrackColor: Colors.grey.shade400,
                        splashRadius: 50.0,
                        value: allTitleFontColorSwitch,
                        onChanged: (value) {
                          setState(() {
                            allTitleFontColorSwitch = !allTitleFontColorSwitch;
                            itemList.changeAllTitleFontColor(
                                allTitleFontColorSwitch);
                          });
                        }),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: itemList.getData().length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: StatefulBuilder(
                              builder: (context, setStateTitle) {
                            log('\nINDEX: $index BUILDED');
                            return InkWell(
                              onTap: () {
                                setStateTitle(() {
                                  itemList.getDataByIndex(index).changeTitleFontColor();
                                });
                              },
                              child: Text(
                                itemList.getDataByIndex(index).getTitle(),
                                style: TextStyle(
                                  color: itemList.getDataByIndex(index).getTitleFontColor(),
                                ),
                              ),
                            );
                          }),
                          subtitle: Text(
                            itemList.getDataByIndex(index).getDescription(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
