import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_wallet/config/locator.dart';
import 'package:flutter_wallet/screens/base/base_screen.dart';

void main() async {
  await DotEnv().load('.env');
  setupLocator();
  runApp(BaseScreen());
}
