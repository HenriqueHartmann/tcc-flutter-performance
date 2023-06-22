import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class DescriptionState {
  final ItemListModel data;
  final bool switchAllColors;
  final bool switchAllFontSize;

  DescriptionState({
    required this.data,
    this.switchAllColors = false,
    this.switchAllFontSize = false,
  });

    DescriptionState copyWith({
    ItemListModel? data,
    bool? switchAllColors,
    bool? switchAllFontSize,
  }) {
    return DescriptionState(
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