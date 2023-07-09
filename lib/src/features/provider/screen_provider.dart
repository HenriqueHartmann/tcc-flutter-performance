import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_performance_app/src/features/provider/card_provider.dart';
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
              builder: (context, value, child) {
                return SwitchWidget(
                  title: 'Change colors',
                  switchValue: value.getSwitchAllColors(),
                  onChanged: (value) {
                    context.read<CardProvider>().changeAllColors();
                  },
                );
              },
            ),
            Row(
              children: [
                // Expanded(
                //   flex: 1,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         'Title',
                //         textScaleFactor: 1.2,
                //       ),
                //       SizedBox(
                //         height: 8.0,
                //       ),
                //       BlocBuilder<TitleBloc, TitleState>(
                //         bloc: titleBloc,
                //         builder: (context, state) {
                //           return Column(
                //             children: [
                //               SwitchWidget(
                //                 title: 'Change colors',
                //                 switchValue: state.getSwitchAllColors(),
                //                 onChanged: (value) {
                //                   titleBloc.changeAllColors();
                //                 },
                //               ),
                //               SwitchWidget(
                //                 title: 'Change font size',
                //                 switchValue: state.getSwitchAllFontSize(),
                //                 onChanged: (value) {
                //                   titleBloc.changeAllFontSizes();
                //                 },
                //               ),
                //             ],
                //           );
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                // Expanded(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         'Description',
                //         textScaleFactor: 1.2,
                //       ),
                //       SizedBox(
                //         height: 8.0,
                //       ),
                //       BlocBuilder<DescriptionBloc, DescriptionState>(
                //           bloc: descriptionBloc,
                //           builder: (context, state) {
                //             return Column(
                //               children: [
                //                 SwitchWidget(
                //                   title: 'Change colors',
                //                   switchValue: state.getSwitchAllColors(),
                //                   onChanged: (value) {
                //                     descriptionBloc.changeAllColors();
                //                   },
                //                 ),
                //                 SwitchWidget(
                //                   title: 'Change font size',
                //                   switchValue: state.getSwitchAllFontSize(),
                //                   onChanged: (value) {
                //                     descriptionBloc.changeAllFontSizes();
                //                   },
                //                 ),
                //               ],
                //             );
                //           }),
                //     ],
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: itemList.getData().length,
                itemBuilder: (context, index) {
                  return Consumer<CardProvider>(
                    builder: (context, cardValue, child) {
                      return Card(
                        color: cardValue.getCardBackgroundByIndex(index: index),
                        child: Column(
                          children: [
                            ListTile(
                              // title: BlocBuilder<TitleBloc, TitleState>(
                              //   bloc: titleBloc,
                              //   builder: (context, stateTitle) {
                              //     log('\nINDEX: $index BUILDED');
                              //     return InkWell(
                              //       onTap: () {
                              //         titleBloc.changeColorByIndex(
                              //             index: index);
                              //       },
                              //       child: Text(
                              //         stateTitle
                              //             .getDataItemByIndex(index: index)
                              //             .getTitle(),
                              //         style: TextStyle(
                              //           fontSize: stateTitle
                              //               .getDataItemByIndex(index: index)
                              //               .getTitleFontSize(),
                              //           color: stateTitle
                              //               .getDataItemByIndex(index: index)
                              //               .getTitleFontColor(),
                              //         ),
                              //       ),
                              //     );
                              //   },
                              // ),
                              // subtitle: BlocBuilder<DescriptionBloc,
                              //     DescriptionState>(
                              //   bloc: descriptionBloc,
                              //   builder: (context, stateDescription) {
                              //     return InkWell(
                              //       onTap: () {
                              //         descriptionBloc.changeColorByIndex(
                              //             index: index);
                              //       },
                              //       child: Text(
                              //         stateDescription
                              //             .getDataItemByIndex(index: index)
                              //             .getDescription(),
                              //         style: TextStyle(
                              //           fontSize: stateDescription
                              //               .getDataItemByIndex(index: index)
                              //               .getDescriptionFontSize(),
                              //           color: stateDescription
                              //               .getDataItemByIndex(index: index)
                              //               .getDescriptionFontColor(),
                              //         ),
                              //       ),
                              //     );
                              //   },
                              // ),
                              trailing: SwitchWidgetWithoutText(
                                switchValue: cardValue.getSwitchValueByIndex(
                                    index: index),
                                onChanged: (value) {
                                  context
                                      .read<CardProvider>()
                                      .changeColorByIndex(index: index);
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
