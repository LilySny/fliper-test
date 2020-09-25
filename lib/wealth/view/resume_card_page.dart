import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_flipper/wealth/bloc/wealth_bloc.dart';
import 'package:teste_flipper/wealth/model/wealth_summary.dart';
import 'package:teste_flipper/wealth/view/summary_card.dart';

class ResumeCard extends StatefulWidget {
  @override
  _ResumeCardState createState() => _ResumeCardState();
}

class _ResumeCardState extends State<ResumeCard> {
  WealthBloc _wealthBloc;

  @override
  void didChangeDependencies() {
    if (_wealthBloc == null) {
      _wealthBloc = Provider.of<WealthBloc>(context);
      _wealthBloc.findAll();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<WealthSummary>(
          stream: _wealthBloc.request,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                "Ocorreu um erro, tente novamente mais tarde.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 19.0),
              ));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation(Theme.of(context).primaryColor)),
              );
            } else {
              final data = snapshot.data;
              return Align(
                alignment: Alignment.center,
                child: SummaryCard(wealthSummary: data),
              );
            }
          }),
    );
  }
}
