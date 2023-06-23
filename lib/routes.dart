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
import 'reason.dart';
import 'facial.dart';
import 'choose_card.dart';
import 'new_card.dart';
import 'create_card.dart';
import 'home1.dart';
import 'testView.dart';

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
  '/reason': (BuildContext context) => ReasonPage(),
  '/facial': (BuildContext context) => FacialPage(),
  '/choose_card': (BuildContext context) => ChooseCardPage(),
  '/new_card': (BuildContext context) => NewCardPage(),
  '/create_card': (BuildContext context) => const CreateCardPage(),
  '/home1': (BuildContext context) => HomeOnePage(),
  '/testView': (BuildContext context) => ChatPage(),
};
