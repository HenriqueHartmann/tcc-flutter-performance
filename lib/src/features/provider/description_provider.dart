import 'package:flutter/material.dart';
import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class DescriptionProvider extends ChangeNotifier {
  late ItemListModel data;

  late bool switchAllColors;
  late bool switchAllFontSizes;

  DescriptionProvider({required ItemListModel data}) {
    setData(value: data);
    setSwitchAllColors(value: false);
    setSwitchAllFontSizes(value: false);
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

  bool getSwitchAllFontSizes() {
    return switchAllFontSizes;
  }

  void setSwitchAllFontSizes({required bool value}) {
    this.switchAllFontSizes = value;
  }

  String getValueByIndex({required int index}) {
    return getData().getDataByIndex(index).getDescription();
  }

  bool getColorSwitchValueByIndex({required int index}) {
    return getData().getDataByIndex(index).isDescriptionTextColorActivated();
  }

  Color getColorByIndex({required int index}) {
    return getData().getDataByIndex(index).getDescriptionFontColor();
  }

  double getFontSizeByIndex({required int index}) {
    return getData().getDataByIndex(index).getDescriptionFontSize();
  }

  // CHANGE SWITCHES

  void changeAllColors() {
    setSwitchAllColors(value: !getSwitchAllColors());
    getData().changeAllDescriptionFontColor(getSwitchAllColors());

    notifyListeners();
  }

  void changeColorByIndex({required int index}) {
    getData().getDataByIndex(index).changeDescriptionFontColor();

    notifyListeners();
  }

  void changeAllFontSizes() {
    setSwitchAllFontSizes(value: !getSwitchAllFontSizes());
    getData().changeAllDescriptionFontSizes(getSwitchAllFontSizes());

    notifyListeners();
  }
}