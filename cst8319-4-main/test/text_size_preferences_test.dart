import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/settings/text_size_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('default level is Large with scale 1.15', () async {
    final prefs = await TextSizePreferences.load();
    expect(prefs.level, TextSizeLevel.large);
    expect(prefs.scale, 1.15);
  });

  test('setLevel persists and notifies', () async {
    final prefs = await TextSizePreferences.load();
    var notified = 0;
    prefs.addListener(() => notified++);

    await prefs.setLevel(TextSizeLevel.extraLarge);
    expect(prefs.level, TextSizeLevel.extraLarge);
    expect(prefs.scale, 1.3);
    expect(notified, 1);

    final reloaded = await TextSizePreferences.load();
    expect(reloaded.level, TextSizeLevel.extraLarge);
    expect(reloaded.scale, 1.3);
  });

  test('Default and Large scales', () async {
    final prefs = await TextSizePreferences.load();
    await prefs.setLevel(TextSizeLevel.default_);
    expect(prefs.scale, 1.0);
    await prefs.setLevel(TextSizeLevel.large);
    expect(prefs.scale, 1.15);
  });
}
