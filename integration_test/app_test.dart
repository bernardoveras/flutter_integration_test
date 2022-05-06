import 'package:flutter/material.dart';
import 'package:flutter_integration_test/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Home Page E2E Test', () {
    testWidgets('Click on Fab 5x', (tester) async {
      app.main();

      await tester.pumpAndSettle();

      for (var i = 0; i < 5; i++) {
        await tester.tap(find.byKey(const Key('increment_one_button_fab')));
      }

      await tester.pumpAndSettle();

      var counterText = find.byKey(const Key('counter_text')).evaluate().single.widget as Text;

      expect(counterText.data, equals('5'));
    });
    testWidgets('Change text on TextField and change App bar title', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      var title = find.byKey(const Key('app_bar_title_text')).evaluate().single.widget as Text;
      expect(title.data, equals('Home'));

      var textField = find.byKey(const Key('title_text_field')).evaluate().single.widget as TextFormField;

      textField.controller!.selection = TextSelection(baseOffset: 0, extentOffset: textField.controller!.text.length);

      await tester.enterText(find.byKey(const Key('title_text_field')), 'Home Edited');
      await tester.pumpAndSettle();

      title = find.byKey(const Key('app_bar_title_text')).evaluate().single.widget as Text;
      expect(title.data, equals('Home Edited'));
    });
  });
}
