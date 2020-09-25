import 'package:matcher/matcher.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_flipper/wealth/bloc/wealth_bloc.dart';
import 'package:teste_flipper/wealth/model/wealth_summary.dart';

import '../mock_graphql_wealth_service.dart';

void main() {
  group("Test service", () {
    test("Tests if bloc stream initially emits null", () {
      final graphqlWealthService = MockGraphqlWealthService();
      final bloc = WealthBloc(graphqlWealthService);

      expect(bloc.request, emitsInOrder([null]));
    });

    test("Tests if bloc stream emits items", () {
      final graphqlWealthService = MockGraphqlWealthService();
      final bloc = WealthBloc(graphqlWealthService);

      when(graphqlWealthService.findAll()).thenAnswer((realInvocation) async {
        return WealthSummary(
          cdi: 1.0,
          gain: 1.0,
          id: 1,
          profitability: 1,
          total: 100,
          hasHistory: false);
      });

      bloc.findAll();

      expect(bloc.request, emits(TypeMatcher<WealthSummary>()));
    });

    test("Tests if bloc stream emits error", () {
      final graphqlWealthService = MockGraphqlWealthService();
      final bloc = WealthBloc(graphqlWealthService);

      when(graphqlWealthService.findAll()).thenAnswer((realInvocation) => Future.error(Exception()));
      bloc.findAll();

      expect(bloc.request, emitsError(TypeMatcher<Exception>()));
    });
  });
}
