import 'package:hasura_connect/hasura_connect.dart';
import 'package:teste_flipper/wealth/model/wealth_summary.dart';
import 'package:teste_flipper/wealth/service/wealth_service.dart';

class GraphQLWealthService implements WealthService {
  final HasuraConnect _hasuraConnect;

  GraphQLWealthService(this._hasuraConnect);

  @override
  Future<WealthSummary> findAll() async {
    try {
      String query = """
        query MyQuery {
          wealthSummary {
            cdi
            gain
            id
            profitability
            total
            hasHistory
          }
        }
                    """;

      var snapshot = await _hasuraConnect.query(query);

      return WealthSummary.fromJson(snapshot["data"]["wealthSummary"].first);
    } catch (e) {
      rethrow;
    }
  }
}
