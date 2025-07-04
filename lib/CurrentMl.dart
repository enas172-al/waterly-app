
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CurrentMl extends ChangeNotifier {
  int get currentMl {
    return _currentMl;
  }

  set currentMl(int value) {
    _currentMl = value;
    notifyListeners();
  }

  CurrentMl();

  factory CurrentMl.of(BuildContext context, {bool listen = true}) {
    return Provider.of<CurrentMl>(context, listen: listen);
  }

  int _currentMl = 0;
}
