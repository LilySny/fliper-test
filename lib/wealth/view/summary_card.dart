import 'package:flutter/material.dart';
import 'package:teste_flipper/shared/formatters.dart';
import 'package:teste_flipper/wealth/component/custom_outline_button.dart';
import 'package:teste_flipper/wealth/component/summary_row_component.dart';
import 'package:teste_flipper/wealth/model/wealth_summary.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    Key key,
    @required this.wealthSummary,
  }) : super(key: key);

  final WealthSummary wealthSummary;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Color.fromRGBO(154, 163, 188, 0.7)),
          borderRadius: BorderRadius.circular(25.0)),
      child: Stack(
        children: [
          Container(
            height: 380.0,
            padding: const EdgeInsets.only(
                left: 26.0, right: 26.0, top: 20.0, bottom: 15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Seu resumo",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Valor investido",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text("R\$ " + moneyFormat(wealthSummary.total),
                        style: Theme.of(context).textTheme.headline1),
                  ],
                ),
                SizedBox(
                  height: 32.0,
                ),
                Column(
                  children: [
                    SummaryRowComponent(
                      title: "Rentabilidade/mês",
                      value: percentFormat(wealthSummary.profitability, 3),
                    ),
                    SummaryRowComponent(
                      title: "CDI",
                      value: percentFormat(wealthSummary.cdi, 2),
                    ),
                    SummaryRowComponent(
                      title: "Ganho/mês",
                      value: "R\$ " + moneyFormat(wealthSummary.gain),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Divider(
                  thickness: 0.4,
                  color: Colors.black54,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomOutlineButton(
                    title: "VER MAIS",
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 25.0,
            right: 8.0,
            child: IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  size: 30.0,
                  color: Colors.black38,
                ),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
