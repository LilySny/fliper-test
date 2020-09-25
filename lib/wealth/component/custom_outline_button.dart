import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  const CustomOutlineButton({
    Key key, @required this.title, @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1.5),
          borderRadius: BorderRadius.circular(30.0)),
      color: Colors.white,
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}
