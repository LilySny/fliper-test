import 'package:hasura_connect/hasura_connect.dart';

class HasuraProvider {
  static HasuraConnect _hasuraConnect;

  static HasuraConnect get hasuraConnect {
    _hasuraConnect ??=
        HasuraConnect("https://harura-fliper-test.herokuapp.com/v1/graphql", headers: {
          "x-hasura-admin-secret": "fliperdevtest2020"
        });
    return _hasuraConnect;
  }
}