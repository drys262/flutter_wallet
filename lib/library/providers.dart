import 'package:flutter/widgets.dart';
import 'package:flutter_wallet/library/models/auth_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (BuildContext context) => AuthModel())
];
