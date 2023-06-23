import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'first.dart';
import 'create_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verify Your Identity',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: FacialPage(),
    );
  }
}

class FacialPage extends StatefulWidget {
  @override
  _FacialPageState createState() => _FacialPageState();
}

class _FacialPageState extends State<FacialPage> {
  final LocalAuthentication localAuth = LocalAuthentication();
  bool isBiometricAvailable = false;

  @override
  void initState() {
    super.initState();
    checkBiometricAvailability();
  }

  void checkBiometricAvailability() async {
    isBiometricAvailable = await localAuth.canCheckBiometrics;
    setState(() {});
  }

  void enableBiometricAccess() async {
    try {
      bool didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Please authenticate to enable biometric access.',
      );
      if (didAuthenticate) {
        // Biometric authentication successful, enable biometric access in your app
        // Navigate to the next page or perform the necessary action
      } else {
        // Biometric authentication failed
      }
    } catch (e) {
      // An error occurred during biometric authentication
    }
  }

  void doThisLater() {
    // Action to be performed when "I'll do this later" button is pressed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              // Action to be performed when the icon is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FirstPage(),
                ),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: Color(0xFFE5E7EB),
                ),
              ),
            ),
            child: Image.asset(
              'assets/images/back.png',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Let’s verify your identity',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D3A70),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 16),
            const Text(
              'We’re required by law to verify your identity before we can use your money',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF6B7280),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    Image.asset(
                      'assets/images/facial.png', // Replace with the actual image path
                      width: 300,
                      // height: 140,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _submit,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1D3A70),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
          ),
          child: const Text(
            'Verify Identity',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateCardPage(),
      ),
    );
  }
}
