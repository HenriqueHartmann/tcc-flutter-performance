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
import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class MainBloc extends StatefulWidget {
  const MainBloc({super.key});

  @override
  State<MainBloc> createState() => _MainBlocState();
}

class _MainBlocState extends State<MainBloc> {
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
                                title: 'Change colors',
                                switchValue: state.getSwitchAllColors(),
                                onChanged: (value) {
                                  titleBloc.changeAllColors();
                                },
                              ),
                              SwitchWidget(
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
                                  title: 'Change colors',
                                  switchValue: state.getSwitchAllColors(),
                                  onChanged: (value) {
                                    descriptionBloc.changeAllColors();
                                  },
                                ),
                                SwitchWidget(
                                  title: 'Change font size',
                                  switchValue: state.getSwitchAllFontSize(),
                                  onChanged: (value) {
                                    descriptionBloc.changeAllFontSizes();
                                  },
                                ),
                              ],
                            );
                          }),
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
                        color: cardState
                            .getDataItemByIndex(index: index)
                            .getCardBackgroundColor(),
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
                                          index: index);
                                    },
                                    child: Text(
                                      stateTitle
                                          .getDataItemByIndex(index: index)
                                          .getTitle(),
                                      style: TextStyle(
                                        fontSize: stateTitle
                                            .getDataItemByIndex(index: index)
                                            .getTitleFontSize(),
                                        color: stateTitle
                                            .getDataItemByIndex(index: index)
                                            .getTitleFontColor(),
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
                                          index: index);
                                    },
                                    child: Text(
                                      stateDescription
                                          .getDataItemByIndex(index: index)
                                          .getDescription(),
                                      style: TextStyle(
                                        fontSize: stateDescription
                                            .getDataItemByIndex(index: index)
                                            .getDescriptionFontSize(),
                                        color: stateDescription
                                            .getDataItemByIndex(index: index)
                                            .getDescriptionFontColor(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              trailing: BlocBuilder<CardBloc, CardState>(
                                bloc: cardBloc,
                                builder: (context, cardState) {
                                  return SwitchWidgetWithoutText(
                                    switchValue: cardState
                                        .getDataItemByIndex(index: index)
                                        .isCardActivated(),
                                    onChanged: (value) {
                                      cardBloc.changeColorByIndex(index: index);
                                    },
                                  );
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
