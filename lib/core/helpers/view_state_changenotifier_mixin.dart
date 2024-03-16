import 'package:flutter/foundation.dart';

import 'view_state.dart';

mixin ViewStateMixin on ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setBusy() {
    _state = ViewState.Busy;
    notifyListeners();
  }

  void setIdle() {
    _state = ViewState.Idle;
    notifyListeners();
  }
}