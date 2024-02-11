import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_performance_app/src/features/provider/card_provider.dart';
import 'package:tcc_performance_app/src/features/provider/description_provider.dart';
import 'package:tcc_performance_app/src/features/provider/title_provider.dart';
import 'package:tcc_performance_app/src/utils/common/widgets/app_bar_widget.dart';
import 'package:tcc_performance_app/src/utils/common/widgets/switch_widget.dart';
import 'package:tcc_performance_app/src/utils/common/widgets/switch_widget_without_text.dart';
import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class ScreenProvider extends StatefulWidget {
  const ScreenProvider({super.key});

  @override
  State<ScreenProvider> createState() => _ScreenProviderState();
}

class _ScreenProviderState extends State<ScreenProvider> {
  late ItemListModel itemList;

  @override
  Widget build(BuildContext context) {
    itemList = ModalRoute.of(context)!.settings.arguments as ItemListModel;

    return Scaffold(
      appBar: AppBarWidget(
        title: 'Provider',
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
            Consumer<CardProvider>(
              builder: (context, cardProvider, child) {
                return SwitchWidget(
                  title: 'Change colors',
                  switchValue: cardProvider.getSwitchAllColors(),
                  onChanged: (onChangedValue) {
                    cardProvider.changeAllColors();
                  },
                );
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
                      Consumer<TitleProvider>(
                        builder: (context, titleProvider, child) {
                          return Column(
                            children: [
                              SwitchWidget(
                                title: 'Change colors',
                                switchValue: titleProvider.getSwitchAllColors(),
                                onChanged: (value) {
                                  titleProvider.changeAllColors();
                                },
                              ),
                              SwitchWidget(
                                title: 'Change font size',
                                switchValue:
                                    titleProvider.getSwitchAllFontSizes(),
                                onChanged: (value) {
                                  titleProvider.changeAllFontSizes();
                                },
                              ),
                            ],
                          );
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
                      Consumer<DescriptionProvider>(
                        builder: (context, descriptionProvider, child) {
                          return Column(
                            children: [
                              SwitchWidget(
                                title: 'Change colors',
                                switchValue:
                                    descriptionProvider.getSwitchAllColors(),
                                onChanged: (value) {
                                  descriptionProvider.changeAllColors();
                                },
                              ),
                              SwitchWidget(
                                title: 'Change font size',
                                switchValue:
                                    descriptionProvider.getSwitchAllFontSizes(),
                                onChanged: (value) {
                                  descriptionProvider.changeAllFontSizes();
                                },
                              ),
                            ],
                          );
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
                  return Consumer<CardProvider>(
                    builder: (context, cardProvider, child) {
                      return Card(
                        color:
                            cardProvider.getCardBackgroundByIndex(index: index),
                        child: Column(
                          children: [
                            ListTile(
                              title: Consumer<TitleProvider>(
                                builder: (context, titleProvider, child) {
                                  return InkWell(
                                    onTap: () {
                                      titleProvider.changeColorByIndex(
                                        index: index,
                                      );
                                    },
                                    child: Text(
                                      titleProvider.getValueByIndex(
                                          index: index),
                                      style: TextStyle(
                                        fontSize: titleProvider
                                            .getFontSizeByIndex(index: index),
                                        color: titleProvider.getColorByIndex(
                                            index: index),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              subtitle: Consumer<DescriptionProvider>(
                                builder: (context, descriptionProvider, child) {
                                  return InkWell(
                                    onTap: () {
                                      descriptionProvider.changeColorByIndex(
                                        index: index,
                                      );
                                    },
                                    child: Text(
                                      descriptionProvider.getValueByIndex(
                                          index: index),
                                      style: TextStyle(
                                        fontSize: descriptionProvider
                                            .getFontSizeByIndex(index: index),
                                        color: descriptionProvider
                                            .getColorByIndex(index: index),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              trailing: SwitchWidgetWithoutText(
                                switchValue: cardProvider.getSwitchValueByIndex(
                                    index: index),
                                onChanged: (onChangedValue) {
                                  cardProvider.changeColorByIndex(index: index);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
