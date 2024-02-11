import 'package:flutter/material.dart';
import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class TitleProvider extends ChangeNotifier {
  late ItemListModel data;

  late bool switchAllColors;
  late bool switchAllFontSizes;

  TitleProvider({required ItemListModel data}) {
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
    return getData().getDataByIndex(index).getTitle();
  }

  bool getColorSwitchValueByIndex({required int index}) {
    return getData().getDataByIndex(index).isTitleTextColorActivated();
  }

  Color getColorByIndex({required int index}) {
    return getData().getDataByIndex(index).getTitleFontColor();
  }

  double getFontSizeByIndex({required int index}) {
    return getData().getDataByIndex(index).getTitleFontSize();
  }

  // CHANGE SWITCHES

  void changeAllColors() {
    setSwitchAllColors(value: !getSwitchAllColors());
    getData().changeAllTitleFontColor(getSwitchAllColors());

    notifyListeners();
  }

  void changeColorByIndex({required int index}) {
    print('alow');

    getData().getDataByIndex(index).changeTitleFontColor();

    notifyListeners();
  }

  void changeAllFontSizes() {
    setSwitchAllFontSizes(value: !getSwitchAllFontSizes());
    getData().changeAllTitleFontSizes(getSwitchAllFontSizes());

    notifyListeners();
  }
}