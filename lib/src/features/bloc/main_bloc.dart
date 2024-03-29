import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_performance_app/src/features/bloc/card_bloc.dart';
import 'package:tcc_performance_app/src/features/bloc/card_state.dart';
import 'package:tcc_performance_app/src/features/bloc/description_bloc.dart';
import 'package:tcc_performance_app/src/features/bloc/description_state.dart';
import 'package:tcc_performance_app/src/features/bloc/title_bloc.dart';
import 'package:tcc_performance_app/src/features/bloc/title_state.dart';
import 'package:tcc_performance_app/src/utils/common/widgets/app_bar_widget.dart';
import 'package:tcc_performance_app/src/utils/common/widgets/switch_widget.dart';
import 'package:tcc_performance_app/src/utils/common/widgets/switch_widget_without_text.dart';
import 'package:tcc_performance_app/src/utils/constants/keys_constant.dart';
import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class MainBloc extends StatefulWidget {
  const MainBloc({super.key});

  @override
  State<MainBloc> createState() => MainBlocState();
}

class MainBlocState extends State<MainBloc> {
  late ItemListModel itemList;
  late TitleBloc titleBloc;
  late DescriptionBloc descriptionBloc;
  late CardBloc cardBloc;

  @override
  Widget build(BuildContext context) {
    itemList = ModalRoute.of(context)!.settings.arguments as ItemListModel;
    titleBloc = TitleBloc(data: itemList);
    descriptionBloc = DescriptionBloc(data: itemList);
    cardBloc = CardBloc(data: itemList);

    return Scaffold(
      key: KeysConstant.getBlocPageKey(),
      appBar: AppBarWidget(
        title: 'Bloc',
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
            BlocBuilder<CardBloc, CardState>(
              bloc: cardBloc,
              builder: (context, state) {
                return SwitchWidget(
                  key: KeysConstant.getSwitchAllCardColorsKey(),
                  title: 'Change colors',
                  switchValue: state.getSwitchAllColors(),
                  onChanged: (value) {
                    cardBloc.changeAllColors();
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
                      BlocBuilder<TitleBloc, TitleState>(
                        bloc: titleBloc,
                        builder: (context, state) {
                          return Column(
                            children: [
                              SwitchWidget(
                                key: KeysConstant.getSwitchAllTitleColorsKey(),
                                title: 'Change colors',
                                switchValue: state.getSwitchAllColors(),
                                onChanged: (value) {
                                  titleBloc.changeAllColors();
                                },
                              ),
                              SwitchWidget(
                                key: KeysConstant.getSwitchAllTitleFontSizesKey(),
                                title: 'Change font size',
                                switchValue: state.getSwitchAllFontSize(),
                                onChanged: (value) {
                                  titleBloc.changeAllFontSizes();
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
                      BlocBuilder<DescriptionBloc, DescriptionState>(
                        bloc: descriptionBloc,
                        builder: (context, state) {
                          return Column(
                            children: [
                              SwitchWidget(
                                key: KeysConstant.getSwitchAllDescriptionColorsKey(),
                                title: 'Change colors',
                                switchValue: state.getSwitchAllColors(),
                                onChanged: (value) {
                                  descriptionBloc.changeAllColors();
                                },
                              ),
                              SwitchWidget(
                                key: KeysConstant.getSwitchAllDescriptionFontSizesKey(),
                                title: 'Change font size',
                                switchValue: state.getSwitchAllFontSize(),
                                onChanged: (value) {
                                  descriptionBloc.changeAllFontSizes();
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
                  return BlocBuilder<CardBloc, CardState>(
                    bloc: cardBloc,
                    builder: (context, cardState) {
                      return Card(
                        color: cardState.getCardBackgroundByIndex(index: index),
                        child: Column(
                          children: [
                            ListTile(
                              title: BlocBuilder<TitleBloc, TitleState>(
                                bloc: titleBloc,
                                builder: (context, stateTitle) {
                                  log('\nINDEX: $index BUILDED');
                                  return InkWell(
                                    onTap: () {
                                      titleBloc.changeColorByIndex(
                                        index: index,
                                      );
                                    },
                                    child: Text(
                                      stateTitle.getTitleValueByIndex(
                                          index: index),
                                      style: TextStyle(
                                        fontSize:
                                            stateTitle.getTitleFontSizeByIndex(
                                                index: index),
                                        color: stateTitle.getTitleColorByIndex(
                                            index: index),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              subtitle: BlocBuilder<DescriptionBloc,
                                  DescriptionState>(
                                bloc: descriptionBloc,
                                builder: (context, stateDescription) {
                                  return InkWell(
                                    onTap: () {
                                      descriptionBloc.changeColorByIndex(
                                        index: index,
                                      );
                                    },
                                    child: Text(
                                      stateDescription
                                          .getDescriptionValueByIndex(
                                              index: index),
                                      style: TextStyle(
                                        fontSize: stateDescription
                                            .getDescriptionFontSizeByIndex(
                                                index: index),
                                        color: stateDescription
                                            .getDescriptionColorByIndex(
                                                index: index),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              trailing: SwitchWidgetWithoutText(
                                switchValue: cardState.getSwitchValueByIndex(
                                    index: index),
                                onChanged: (value) {
                                  cardBloc.changeColorByIndex(index: index);
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
