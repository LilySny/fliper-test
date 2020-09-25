import 'package:teste_flipper/wealth/bloc/wealth_bloc.dart';
import 'package:teste_flipper/wealth/service/wealth_service.dart';

class WealthBlocFactory {

  static WealthBloc create(){
    return WealthBloc(WealthService.create());
  }
}