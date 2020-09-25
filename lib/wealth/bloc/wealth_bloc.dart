import 'package:teste_flipper/wealth/model/wealth_summary.dart';
import 'package:teste_flipper/wealth/service/wealth_service.dart';

class WealthBloc {
  final WealthService _wealthService;

  WealthBloc(this._wealthService);

  Stream<WealthSummary> _request = Stream.value(null);

  Stream<WealthSummary> get request => _request;

  void findAll() {
    _request = Stream.fromFuture(_wealthService.findAll());
  }
}
