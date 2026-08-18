import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/screens/home_screen_new.dart';
import 'package:myapp/settings/text_size_preferences.dart';
import 'package:myapp/theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Home text-size icon opens sheet and updates preference',
      (tester) async {
    final prefs = await TextSizePreferences.load();
    await tester.binding.setSurfaceSize(const Size(400, 1200));

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: prefs,
        child: MaterialApp(
          theme: AppTheme.theme,
          home: MediaQuery(
            data: const MediaQueryData(
              size: Size(400, 1200),
              textScaler: TextScaler.linear(1.15),
            ),
            child: const HomeScreenNew(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byTooltip('Text size'), findsOneWidget);
    expect(find.text('Text size'), findsNothing);

    await tester.tap(find.byTooltip('Text size'));
    await tester.pumpAndSettle();

    expect(find.text('Text size'), findsOneWidget);
    expect(
      find.text('Preview: This is how body text will look.'),
      findsOneWidget,
    );

    await tester.tap(find.text('Extra Large'));
    await tester.pumpAndSettle();
    expect(prefs.level, TextSizeLevel.extraLarge);
    expect(prefs.scale, 1.3);

    await tester.tap(find.text('Default'));
    await tester.pumpAndSettle();
    expect(prefs.level, TextSizeLevel.default_);
    expect(prefs.scale, 1.0);
  });
}
