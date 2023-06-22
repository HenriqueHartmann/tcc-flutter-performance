import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class TitleState {
  final ItemListModel data;
  final bool switchAllColors;
  final bool switchAllFontSize;

  TitleState({
    required this.data,
    this.switchAllColors = false,
    this.switchAllFontSize = false,
  });

    TitleState copyWith({
    ItemListModel? data,
    bool? switchAllColors,
    bool? switchAllFontSize,
  }) {
    return TitleState(
      data: data ?? this.data,
      switchAllColors: switchAllColors ?? this.switchAllColors,
      switchAllFontSize: switchAllFontSize ?? this.switchAllFontSize,
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

  bool getSwitchAllFontSize() {
    return switchAllFontSize;
  }
}
