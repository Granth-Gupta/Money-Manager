import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveTexttButton extends StatelessWidget {
  final String text;
  final Function handler;

  AdaptiveTexttButton(this.handler, this.text);

  @override
  Widget build(BuildContext context) {
    // print('Build() AdaptiveTextButton');
    return Platform.isIOS
        ? CupertinoButton(
            // color: Colors.blue,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: handler,
          )
        : TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
            ),
            onPressed: handler,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
