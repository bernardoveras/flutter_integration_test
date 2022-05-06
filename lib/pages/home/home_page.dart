import 'package:flutter/material.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: controller.title,
          builder: (_, String title, __) => Text(
            title,
            key: const Key('app_bar_title_text'),
          ),
        ),
      ),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.8,
              child: TextFormField(
                key: const Key('title_text_field'),
                controller: TextEditingController(text: controller.title.value),
                onChanged: (value) => controller.title.value = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Title'),
                ),
              ),
            ),
            const SizedBox(height: 24),
            CardCounter(controller.counter),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementOne,
        tooltip: 'Increment one',
        child: const Icon(Icons.plus_one),
        key: const Key('increment_one_button_fab'),
      ),
    );
  }
}

class CardCounter extends StatelessWidget {
  const CardCounter(this.counter, {Key? key}) : super(key: key);

  final ValueNotifier<int> counter;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Counter',
              style: TextStyle(color: Colors.white),
            ),
            ValueListenableBuilder(
              valueListenable: counter,
              builder: (_, int value, __) => Text(
                '$value',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                key: const Key('counter_text'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
