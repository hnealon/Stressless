import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum TextSizeLevel {
  default_,
  large,
  extraLarge;

  String get label {
    switch (this) {
      case TextSizeLevel.default_:
        return 'Default';
      case TextSizeLevel.large:
        return 'Large';
      case TextSizeLevel.extraLarge:
        return 'Extra Large';
    }
  }

  double get scale {
    switch (this) {
      case TextSizeLevel.default_:
        return 1.0;
      case TextSizeLevel.large:
        return 1.15;
      case TextSizeLevel.extraLarge:
        return 1.3;
    }
  }

  static TextSizeLevel fromStorageKey(String? key) {
    switch (key) {
      case 'default':
        return TextSizeLevel.default_;
      case 'extraLarge':
        return TextSizeLevel.extraLarge;
      case 'large':
      default:
        return TextSizeLevel.large;
    }
  }

  String get storageKey {
    switch (this) {
      case TextSizeLevel.default_:
        return 'default';
      case TextSizeLevel.large:
        return 'large';
      case TextSizeLevel.extraLarge:
        return 'extraLarge';
    }
  }
}

class TextSizePreferences extends ChangeNotifier {
  static const _prefsKey = 'text_size_level';

  TextSizeLevel _level = TextSizeLevel.large;

  TextSizeLevel get level => _level;

  double get scale => _level.scale;

  static Future<TextSizePreferences> load() async {
    final prefs = TextSizePreferences();
    final stored = await SharedPreferences.getInstance();
    prefs._level = TextSizeLevel.fromStorageKey(stored.getString(_prefsKey));
    return prefs;
  }

  Future<void> setLevel(TextSizeLevel level) async {
    if (_level == level) return;
    _level = level;
    notifyListeners();
    final stored = await SharedPreferences.getInstance();
    await stored.setString(_prefsKey, level.storageKey);
  }
}
