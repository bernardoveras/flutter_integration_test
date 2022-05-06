import 'package:flutter/cupertino.dart';

class HomeController {
  final ValueNotifier<int> counter = ValueNotifier<int>(0);
  final ValueNotifier<String> title = ValueNotifier<String>('Home');

  void incrementOne() => counter.value++;
}
