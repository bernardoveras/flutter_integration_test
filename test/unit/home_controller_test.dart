import 'package:flutter_integration_test/pages/home/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Counter must initialize to 0', () {
    expect(HomeController().counter.value, 0);
  });
  test('Increment one on Counter', () {
    final controller = HomeController();
    controller.incrementOne();
    expect(controller.counter.value, 1);
  });
  test('Initial text must be "Home"', () {
    final controller = HomeController();
    expect(controller.title.value, 'Home');
  });
  test('Change app bar title to "Home Edited"', () {
    const newTitle = 'Home Edited';

    final controller = HomeController();

    controller.title.value = newTitle;
    expect(controller.title.value, newTitle);
  });
}
