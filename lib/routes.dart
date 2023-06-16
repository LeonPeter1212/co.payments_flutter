import 'package:flutter/material.dart';
import 'first.dart';
import 'signin.dart';
import 'signup.dart';
import 'recovery.dart';
import 'verify_identity.dart';
import 'verification.dart';
import 'create_password.dart';
import 'biometric.dart';
import 'country.dart';
import 'pincode.dart';

final Map<String, WidgetBuilder> routes = {
  '/first': (BuildContext context) => const FirstPage(),
  '/signin': (BuildContext context) => SignInPage(),
  '/signup': (BuildContext context) => SignUpPage(),
  '/recovery': (BuildContext context) => RecoveryPage(),
  '/verify_identity': (BuildContext context) => VerifyIdentityPage(),
  '/verification': (BuildContext context) => VerificationPage(),
  '/create_password': (BuildContext context) => CreatePasswordPage(),
  '/biometric': (BuildContext context) => BiometricAccessPage(),
  '/country': (BuildContext context) => CountryPage(),
  '/pincode': (BuildContext context) => PinCodePage(),
};
