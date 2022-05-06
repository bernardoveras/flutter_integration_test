import 'package:flutter/material.dart';
import 'package:flutter_integration_test/main.dart';
import 'package:flutter_integration_test/pages/home/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Increment Counter on HomePage', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(HomePage), findsOneWidget);

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byKey(const Key('increment_one_button_fab')));
    await tester.tap(find.byKey(const Key('increment_one_button_fab')));

    await tester.pump();

    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('Change app bar title', (tester) async {
    await tester.pumpWidget(const MyApp());

    var title = find.byKey(const Key('app_bar_title_text')).evaluate().single.widget as Text;

    expect(find.byType(HomePage), findsOneWidget);
    expect(title.data, equals('Home'));

    await tester.enterText(find.byKey(const Key('title_text_field')), 'Home Edited');
    await tester.pumpAndSettle();

    title = find.byKey(const Key('app_bar_title_text')).evaluate().single.widget as Text;
    expect(title.data, equals('Home Edited'));
  });
}
