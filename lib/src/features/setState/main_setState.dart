import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tcc_performance_app/src/utils/common/widgets/app_bar_widget.dart';
import 'package:tcc_performance_app/src/utils/common/widgets/switch_widget.dart';
import 'package:tcc_performance_app/src/utils/common/widgets/switch_widget_without_text.dart';
import 'package:tcc_performance_app/src/utils/constants/keys_constant.dart';
import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class MainSetState extends StatefulWidget {
  const MainSetState({
    super.key,
  });

  @override
  State<MainSetState> createState() => MainSetStateState();
}

class MainSetStateState extends State<MainSetState> {
  late ItemListModel itemList;

  bool allCardsBackgroundColorSwitch = false;

  bool allTitleFontColorSwitch = false;
  bool allTitleFontSizeSwitch = false;

  bool allDescriptionFontColorSwitch = false;
  bool allDescriptionFontSizeSwitch = false;

  @override
  Widget build(BuildContext context) {
    itemList = ModalRoute.of(context)!.settings.arguments as ItemListModel;

    return Scaffold(
      key: KeysConstant.getSetStatePageKey(),
      appBar: AppBarWidget(
        title: 'SetState',
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Card',
                  textScaleFactor: 1.2,
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            SwitchWidget(
              key: KeysConstant.getSwitchAllCardColorsKey(),
              title: 'Change colors',
              switchValue: allCardsBackgroundColorSwitch,
              onChanged: (value) {
                setState(() {
                  allCardsBackgroundColorSwitch =
                      !allCardsBackgroundColorSwitch;
                  itemList.changeAllCardBackgroundColors(
                      allCardsBackgroundColorSwitch);
                });
              },
            ),
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
                        key: KeysConstant.getSwitchAllTitleColorsKey(),
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
                        key: KeysConstant.getSwitchAllTitleFontSizesKey(),
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
                        key: KeysConstant.getSwitchAllDescriptionColorsKey(),
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
                        key: KeysConstant.getSwitchAllDescriptionFontSizesKey(),
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
                    color:
                        itemList.getDataByIndex(index).getCardBackgroundColor(),
                    child: Column(
                      children: [
                        ListTile(
                          title: StatefulBuilder(
                            builder: (context, setStateTitle) {
                              log('\nINDEX: $index BUILDED');
                              return InkWell(
                                onTap: () {
                                  setStateTitle(
                                    () {
                                      itemList
                                          .getDataByIndex(index)
                                          .changeTitleFontColor();
                                    },
                                  );
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
                          subtitle: StatefulBuilder(
                              builder: (context, setStateDescription) {
                            return InkWell(
                              onTap: () {
                                setStateDescription(
                                  () {
                                    itemList
                                        .getDataByIndex(index)
                                        .changeDescriptionFontColor();
                                  },
                                );
                              },
                              child: Text(
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
                            );
                          }),
                          trailing: SwitchWidgetWithoutText(
                            switchValue: itemList
                                .getDataByIndex(index)
                                .isCardActivated(),
                            onChanged: (value) {
                              setState(() {
                                itemList
                                    .getDataByIndex(index)
                                    .changeCardBackgroundColor();
                              });
                            },
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
