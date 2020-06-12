import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_wallet/library/firebase_auth.dart';
import 'package:flutter_wallet/library/google.dart';
import 'package:flutter_wallet/library/models/auth_model.dart';
import 'package:provider/provider.dart';
import 'package:stripe_payment/stripe_payment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    String publishableKey = DotEnv().env['STRIPE_PUBLISHABLE_KEY'];
    print('publishableKey here $publishableKey');
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: publishableKey,
        androidPayMode: 'test', // if you are testing
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  await Future.wait([googleSignIn.signOut(), auth.signOut()]);
                },
                child: Text('Logout'),
              ),
              Consumer<AuthModel>(
                builder: (BuildContext context, AuthModel authModel, child) {
                  String email =
                      authModel.user != null ? authModel.user.email : "";
                  return Text('Hello $email');
                },
              ),
              RaisedButton(
                onPressed: () async {
                  StripePayment.paymentRequestWithNativePay(
                    androidPayOptions: AndroidPayPaymentRequest(
                      currencyCode: 'USD',
                      totalPrice: '10.0',
                    ),
                    applePayOptions: null,
                  ).then((value) {
                    print('value here');
                    print(value);
                  }).catchError((error) {
                    print('error here');
                    print(error);
                  });
                },
                child: Text('Add Balance in Stripe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
