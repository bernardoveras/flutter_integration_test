## Testes

Utilizamos 3 formas de testes, Unit, Widget e Integration.

### Unit Test
Utilizaremos os testes de unidades para validar tudo que é regra de negocio (códigos puramente dart).

```dart
test('Increment one on Counter', () async {
    final controller = HomeController();
    controller.incrementOne();
    expect(controller.counter.value, 1);
});
```
### Widget Test
Utilizaremos os testes de Widget para validar se nossas Pages estão renderizando conforme o esperado.

```dart
testWidgets("Should find a single widget per view on screen rendering", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    final appBarTitle = find.text('Login');
    expect(appBarTitle, findsOneWidget);
});
```

### Integration Test
Utilizaremos os testes de integração para garantir um completo funcionamento end-to-end.

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

Links úteis

- [Flutter Test](https://flutter.dev/docs/testing)
- [Integration Test](https://flutter.dev/docs/cookbook/testing/integration/introduction)
