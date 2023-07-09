import 'package:flutter/material.dart';
import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class CardProvider extends ChangeNotifier {
  late ItemListModel data;

  late bool switchAllColors;

  CardProvider({required ItemListModel data}) {
    setData(value: data);
    setSwitchAllColors(value: false);
  }

  ItemListModel getData() {
    return this.data;
  }

  void setData({required ItemListModel value}) {
    this.data = value;
  }

  bool getSwitchAllColors() {
    return switchAllColors;
  }

  void setSwitchAllColors({required bool value}) {
    this.switchAllColors = value;
  }

  bool getSwitchValueByIndex({required int index}) {
    return getData().getDataByIndex(index).isCardActivated();
  }

  Color getCardBackgroundByIndex({required int index}) {
    return getData().getDataByIndex(index).getCardBackgroundColor();
  }

  // CHANGE SWITCHES

  void changeAllColors() {
    setSwitchAllColors(value: !getSwitchAllColors());
    getData().changeAllCardBackgroundColors(getSwitchAllColors());

    notifyListeners();
  }

  void changeColorByIndex({required int index}) {
    getData().getDataByIndex(index).changeCardBackgroundColor();

    notifyListeners();
  }
}
