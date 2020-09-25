import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_flipper/wealth/bloc/wealth_bloc_factory.dart';
import 'package:teste_flipper/wealth/service/wealth_service.dart';
import 'package:teste_flipper/wealth/view/resume_card_page.dart';

void main() {
  var wealth = WealthService.create();
  wealth.findAll().then((value) => print(value));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => WealthBlocFactory.create(),
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
    );
  }
}
