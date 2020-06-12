import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_wallet/library/firebase_auth.dart';

class AuthModel extends ChangeNotifier {
  FirebaseUser _user;

  FirebaseUser get user => _user;

  AuthModel() {
    auth.onAuthStateChanged.listen((event) {
      if (event != null) {
        updateUser(event);
      } else {
        updateUser(null);
      }
    });
  }

  void updateUser(FirebaseUser user) {
    _user = user;
    notifyListeners();
  }
}
