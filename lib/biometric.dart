import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'facial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Password',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: BiometricAccessPage(),
    );
  }
}

class BiometricAccessPage extends StatefulWidget {
  @override
  _BiometricAccessPageState createState() => _BiometricAccessPageState();
}

class _BiometricAccessPageState extends State<BiometricAccessPage> {
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FacialPage(),
      ),
    );
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
              Navigator.of(context).pop();
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
          children: [
            const Text(
              'Enable biometric Access',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D3A70),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Login quickly and securely with the fingerprint stored on this device',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF6B7280),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    Image.asset(
                      'assets/images/fingerprint.png', // Replace with the actual image path
                      width: 140,
                      height: 140,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed:
                      isBiometricAvailable ? enableBiometricAccess : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D3A70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text(
                    'Enable biometric access',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: doThisLater,
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text(
                    "I'll do this later",
                    style: TextStyle(
                      color: Color(0xFF1DAB87),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
