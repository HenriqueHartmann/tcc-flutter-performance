import 'package:flutter/material.dart';

class ItemModel {
  // FIELDS

  late int _id;
  late String _title;
  late String _description;
  late double _titleFontSize;
  late double _descriptionFontSize;
  late Color _titleFontColor;
  late Color _descriptionFontColor;
  late Color _cardBackgroundColor;

  // CONSTANTS

  static const double _titleSize = 16.0;
  static const double _descriptionSize = 12.0;
  static const Color _textColor = Colors.black54;
  static const Color _cardColor = Colors.grey;

  // DEFAULT CONSTRUCTOR

  ItemModel({
    required int id,
    required String title,
    required String description,
    double titleFontSize = _titleSize,
    double descriptionFontSize = _descriptionSize,
    Color titleFontColor = _textColor,
    Color descriptionFontColor = _textColor,
    Color cardBackgroundColor = _cardColor,
  }) {
    setId(id);
    setTitle(title);
    setDescription(description);
    setTitleFontSize(value: titleFontSize);
    setDescriptionFontSize(value: descriptionFontSize);
    setTitleFontColor(value: titleFontColor);
    setDescriptionFontColor(value: descriptionFontColor);
    setCardBackgroundColor(value: cardBackgroundColor);
  }

  // GETTERS AND SETTERS

  int getId() {
    return this._id;
  }

  void setId(int value) {
    this._id = value;
  }

  String getTitle() {
    return this._title;
  }

  void setTitle(String value) {
    this._title = value;
  }

  String getDescription() {
    return this._description;
  }

  void setDescription(String value) {
    this._description = value;
  }

  double getTitleFontSize() {
    return this._titleFontSize;
  }

  void setTitleFontSize({double value = _titleSize}) {
    this._titleFontSize = value;
  }

  double getDescriptionFontSize() {
    return this._descriptionFontSize;
  }

  void setDescriptionFontSize({double value = _descriptionSize}) {
    this._descriptionFontSize = value;
  }

  Color getTitleFontColor() {
    return this._titleFontColor;
  }

  void setTitleFontColor({Color value = _textColor}) {
    this._titleFontColor = value;
  }

  Color getDescriptionFontColor() {
    return this._descriptionFontColor;
  }

  void setDescriptionFontColor({Color value = _textColor}) {
    this._descriptionFontColor = value;
  }

  Color getCardBackgroundColor() {
    return this._cardBackgroundColor;
  }

  void setCardBackgroundColor({Color value = _cardColor}) {
    this._cardBackgroundColor = value;
  }

  // METHODS

  // SK0: Initialization of each library
  // SK1: Change title font color - DONE
  // SK2: Change title font size
  // SK3: Change description font color
  // SK4: Change description font size
  // SK5: Change card background color

  void changeTitleFontColor() {
    if (getTitleFontColor() != Colors.red) {
      setTitleFontColor(value: Colors.red);
    } else {
      setTitleFontColor();
    }
  }
}

class ItemListModel {
  final _data = <ItemModel>[];

  ItemListModel() {
    for (int i = 0; i < 100; i++) {
      const int paragraphs = 2;
      const int words = 100;

      _data.add(
        ItemModel(
          id: i,
          title: 'ID$i',
          description:
              '0000000000000000000000000000000000\n00000000000000000000000000000000000',
        ),
      );
    }
  }

  List<ItemModel> getData() {
    return this._data;
  }

  ItemModel getDataByIndex(int index) {
    return this._data[index];
  }

  void changeAllTitleFontColor(bool value) {
    if (value) {
      _data.forEach((element) {
        element.setTitleFontColor(value: Colors.red);
      });
    } else {
      _data.forEach((element) {
        element.setTitleFontColor();
      });
    }
  }
}

class ItemClient {
  static ItemListModel getData() {
    return ItemListModel();
  }
}
