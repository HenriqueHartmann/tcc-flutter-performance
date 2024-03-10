import 'package:flutter/material.dart';

class KeysConstant {
  // Common Widget Keys
  static Key getLibSelectionItemKey() {
    return Key('libSelectionItem');
  }

  static Key getSwitchWidgetKey() {
    return Key('switchWidget');
  }

  // Library Selection Keys
  static Key getSetStateSelectionKey() {
    return Key('setStateSelection');
  }

  static Key getProviderSelectionKey() {
    return Key('providerSelection');
  }

  static Key getBlocSelectionKey() {
    return Key('blocSelection');
  }

  // Page Keys
  static Key getSetStatePageKey() {
    return Key('setStatePage');
  }

  static Key getProviderPageKey() {
    return Key('providerPage');
  }

  static Key getBlocPageKey() {
    return Key('blocPage');
  }

  // Main Panel Keys
  static Key getSwitchAllCardColorsKey() {
    return Key('changeAllCardColors');
  }

  static Key getSwitchAllTitleColorsKey() {
    return Key('changeAllTitleColors');
  }

  static Key getSwitchAllTitleFontSizesKey() {
    return Key('changeAllTitleFontSizes');
  }

  static Key getSwitchAllDescriptionColorsKey() {
    return Key('changeAllDescriptionColors');
  }

  static Key getSwitchAllDescriptionFontSizesKey() {
    return Key('changeAllDescriptionFontSizes');
  }

  // Index Panel Keys
  // ...
}
