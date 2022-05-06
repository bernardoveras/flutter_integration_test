## Tests

We use 3 forms of tests, Unit, Widget and Integration.

### Unit Test
We will use unit tests to validate all business rules (purely dart codes).

```dart
test('Increment one on Counter', () async {
    final controller = HomeController();
    controller.incrementOne();
    expect(controller.counter.value, 1);
});
```
### Widget Test
We use Widget tests to validate that our pages are rendering as expected.

```dart
testWidgets("Should find a single widget per view on screen rendering", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    final appBarTitle = find.text('Login');
    expect(appBarTitle, findsOneWidget);
});
```

### Integration Test
We will use integration tests to ensure complete end-to-end operation.

```dart
import 'package:integration_test/integration_test_driver.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
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
}
```

Useful links

- [Flutter Test](https://flutter.dev/docs/testing)
- [Integration Test](https://flutter.dev/docs/cookbook/testing/integration/introduction)
