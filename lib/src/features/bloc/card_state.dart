import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class CardState {
  final ItemListModel data;
  final bool switchAllColors;

  CardState({
    required this.data,
    this.switchAllColors = false,
  });

    CardState copyWith({
    ItemListModel? data,
    bool? switchAllColors,
    bool? switchAllFontSize,
  }) {
    return CardState(
      data: data ?? this.data,
      switchAllColors: switchAllColors ?? this.switchAllColors,
    );
  }

  ItemListModel getData() {
    return data;
  } 

  ItemModel getDataItemByIndex({required int index}) {
    return getData().getDataByIndex(index);
  }

  bool getSwitchAllColors() {
    return switchAllColors;
  }
}