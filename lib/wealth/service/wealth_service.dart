import 'package:hasura_connect/hasura_connect.dart';
import 'package:teste_flipper/wealth/model/hasura_provider.dart';
import 'package:teste_flipper/wealth/model/wealth_summary.dart';
import 'package:teste_flipper/wealth/service/graphql_wealth_service.dart';

abstract class WealthService {
  Future<WealthSummary> findAll();

  static WealthService create() {
    return GraphQLWealthService(HasuraProvider.hasuraConnect);
  }
}
