import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_flipper/shared/formatters.dart';
import 'package:teste_flipper/wealth/model/wealth_summary.dart';
import 'package:teste_flipper/wealth/view/summary_card.dart';

void main() {
  group("info testing", () {
    testWidgets('Tests if the widget its getting the data',
        (WidgetTester tester) async {
      final mockResult = WealthSummary(
          cdi: 1.0,
          gain: 1.0,
          id: 1,
          profitability: 1,
          total: 100,
          hasHistory: false);

      await tester.pumpWidget(
        MaterialApp(
          title: 'Flipper Test',
          theme: ThemeData(
            primaryColor: Color.fromRGBO(59, 92, 184, 1),
            textTheme: TextTheme(
                headline1: TextStyle(
                    color: Color.fromRGBO(59, 92, 184, 1),
                    fontSize: 28.0,
                    fontFamily: 'ProximaNovaBold',
                    fontWeight: FontWeight.w900),
                subtitle1: TextStyle(
                  fontFamily: 'ProximaNovaMedium',
                  color: Color.fromRGBO(96, 99, 119, 1),
                  fontSize: 18.0,
                )),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SummaryCard(wealthSummary: mockResult),
        ),
      );

      await tester.pump();

      expect(
          find.text(percentFormat(mockResult.profitability, 3)), findsWidgets);
    });
  });
}
