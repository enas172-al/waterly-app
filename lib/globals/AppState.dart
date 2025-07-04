import 'package:flutter/material.dart';
import 'package:waterly/globals/ThemeData.dart';
import 'package:provider/provider.dart';


class AppState extends ChangeNotifier {
  ThemeData get theme {
    return _theme;
  }

  factory AppState.of(BuildContext context, {bool listen = true}) {
    return Provider.of<AppState>(context, listen: listen);
  }

  AppState();

  ThemeData _theme = lightTheme;

  void changeTheme(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }
}
