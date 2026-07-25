import 'package:flutter/material.dart';

enum NavAction { push, pushReplace, pushRemove }

Future<T?> goTo<T>(
  BuildContext context, {
  required Widget page,
  NavAction state = NavAction.push,
}) async {
  var pageRoute = MaterialPageRoute<T>(builder: (context) => page);

  switch (state) {
    case NavAction.push:
      return Navigator.push<T>(context, pageRoute);
    case NavAction.pushReplace:
      return Navigator.pushReplacement(context, pageRoute);
    case NavAction.pushRemove:
      return Navigator.pushAndRemoveUntil<T>(context, pageRoute, (r) => false);
  }
}
