
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:teste_flipper/wealth/bloc/wealth_bloc.dart';
import 'package:teste_flipper/wealth/model/wealth_summary.dart';
import 'package:teste_flipper/wealth/view/resume_card_page.dart';
import 'package:teste_flipper/wealth/view/summary_card.dart';

import '../mock_graphql_wealth_service.dart';

void main() {
  group("stream widget test", () {
    testWidgets('Test if widget show loading and data', (WidgetTester tester) async {
      final mockResult = WealthSummary(
          cdi: 1.0,
          gain: 1.0,
          id: 1,
          profitability: 1,
          total: 100,
          hasHistory: false);
      final graphqlWealthService = MockGraphqlWealthService();
      final bloc = WealthBloc(graphqlWealthService);

      when(graphqlWealthService.findAll()).thenAnswer((realInvocation) async {
        return mockResult;
      });

      await tester.pumpWidget(Provider(
        create: (_) => bloc,
        child: MaterialApp(
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
          home: ResumeCard(),
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.idle();

      await tester.pump(Duration.zero);

      expect(find.byType(SummaryCard), findsOneWidget);
    });

    testWidgets('Test if widget show loading and error', (WidgetTester tester) async {

      final graphqlWealthService = MockGraphqlWealthService();
      final bloc = WealthBloc(graphqlWealthService);

      when(graphqlWealthService.findAll()).thenAnswer((realInvocation) => Future.error(Exception()));
      bloc.findAll();
      await tester.pumpWidget(Provider(
        create: (_) => bloc,
        child: MaterialApp(
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
          home: ResumeCard(),
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.idle();

      await tester.pump(Duration.zero);

      expect(find.text("Ocorreu um erro, tente novamente mais tarde."), findsOneWidget);
    });
  });
}
