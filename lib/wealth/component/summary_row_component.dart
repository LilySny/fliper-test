import 'package:flutter/material.dart';

class SummaryRowComponent extends StatelessWidget {
  final String title;
  final String value;

  const SummaryRowComponent(
      {Key key, @required this.title, @required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            value,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 21.0,
                fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
