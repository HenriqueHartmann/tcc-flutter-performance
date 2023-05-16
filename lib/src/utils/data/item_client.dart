import 'package:flutter/material.dart';

class ItemModel {
  int id;
  String title;
  String description;
  double titleFontSize;
  double descriptionFontSize;
  Color? titleFontColor;
  Color? descriptionFontColor;
  Color? cardBackgroundColor;

  static const double _titleSize = 16.0;
  static const double _descriptionSize = 12.0;
  static const Color _textColor = Colors.black54;
  static const Color _cardColor = Colors.grey;

  ItemModel({
    required this.id,
    required this.title,
    required this.description,
    this.titleFontSize = _titleSize,
    this.descriptionFontSize = _descriptionSize,
    this.titleFontColor = _textColor,
    this.descriptionFontColor = _textColor,
    this.cardBackgroundColor = _cardColor,
  });

  // SK0: Initialization of each library
  // SK1: Change title font color
  // SK2: Change title font size
  // SK3: Change description font color
  // SK4: Change description font size
  // SK5: Change card background color
}

class ItemClient {
  static List<ItemModel> getData() {
    final data = <ItemModel>[];

    for (int i = 0; i < 100; i++) {
      const int paragraphs = 2;
      const int words = 100;

      data.add(
        ItemModel(
          id: i,
          title: 'ID$i',
          description:
              '0000000000000000000000000000000000\n00000000000000000000000000000000000',
        ),
      );
    }

    return data;
  }
}
