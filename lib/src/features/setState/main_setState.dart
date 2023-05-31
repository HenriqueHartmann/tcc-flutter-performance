import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tcc_performance_app/src/utils/common/widgets/switch_widget.dart';
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
  bool allTitleFontSizeSwitch = false;

  bool allDescriptionFontColorSwitch = false;
  bool allDescriptionFontSizeSwitch = false;

  @override
  Widget build(BuildContext context) {
    itemList = ModalRoute.of(context)!.settings.arguments as ItemListModel;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'SetState',
          style: TextStyle(color: Colors.black87),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title',
                        textScaleFactor: 1.2,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      SwitchWidget(
                        title: 'Change colors',
                        switchValue: allTitleFontColorSwitch,
                        onChanged: (value) {
                          setState(() {
                            allTitleFontColorSwitch = !allTitleFontColorSwitch;
                            itemList.changeAllTitleFontColor(
                                allTitleFontColorSwitch);
                          });
                        },
                      ),
                      SwitchWidget(
                        title: 'Change font size',
                        switchValue: allTitleFontSizeSwitch,
                        onChanged: (value) {
                          setState(() {
                            allTitleFontSizeSwitch = !allTitleFontSizeSwitch;
                            itemList.changeAllTitleFontSizes(
                                allTitleFontSizeSwitch);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        textScaleFactor: 1.2,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      SwitchWidget(
                        title: 'Change colors',
                        switchValue: allDescriptionFontColorSwitch,
                        onChanged: (value) {
                          setState(() {
                            allDescriptionFontColorSwitch =
                                !allDescriptionFontColorSwitch;
                            itemList.changeAllDescriptionFontColor(
                                allDescriptionFontColorSwitch);
                          });
                        },
                      ),
                      SwitchWidget(
                        title: 'Change font size',
                        switchValue: allDescriptionFontSizeSwitch,
                        onChanged: (value) {
                          setState(() {
                            allDescriptionFontSizeSwitch =
                                !allDescriptionFontSizeSwitch;
                            itemList.changeAllDescriptionFontSizes(
                                allDescriptionFontSizeSwitch);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
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
                                    itemList
                                        .getDataByIndex(index)
                                        .changeTitleFontColor();
                                  });
                                },
                                child: Text(
                                  itemList.getDataByIndex(index).getTitle(),
                                  style: TextStyle(
                                    fontSize: itemList
                                        .getDataByIndex(index)
                                        .getTitleFontSize(),
                                    color: itemList
                                        .getDataByIndex(index)
                                        .getTitleFontColor(),
                                  ),
                                ),
                              );
                            },
                          ),
                          subtitle: Text(
                            itemList.getDataByIndex(index).getDescription(),
                            style: TextStyle(
                              fontSize: itemList
                                  .getDataByIndex(index)
                                  .getDescriptionFontSize(),
                              color: itemList
                                  .getDataByIndex(index)
                                  .getDescriptionFontColor(),
                            ),
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
