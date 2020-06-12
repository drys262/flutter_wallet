import 'package:flutter/material.dart';
import 'package:flutter_wallet/library/models/auth_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Container(
        child: Center(
          child: Consumer<AuthModel>(
            builder: (BuildContext context, AuthModel auth, child) {
              return Text('Hello ${auth.user.email}');
            },
          ),
        ),
      ),
    );
  }
}
