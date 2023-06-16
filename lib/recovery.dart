import 'package:flutter/material.dart';
import 'verify_identity.dart';
import 'package:email_validator/email_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recover Password',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RecoveryPage(),
    );
  }
}

class RecoveryPage extends StatefulWidget {
  @override
  _RecoveryPageState createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: Padding(
      //     padding: const EdgeInsets.all(4.0),
      //     child: ,
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Image.asset(
                '../assets/images/recovery.png',
                height: 100,
              ),
              const SizedBox(height: 30),
              const Text(
                'Password Recovery',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D3A70),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your registered email below to receive password instructions',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF6B7280),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email address',
                  hintStyle: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: const EdgeInsets.all(24),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFF1F1F1),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(125, 0, 0, 0),
                      width: 1,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                ),
                style: const TextStyle(
                  color: Color(0xFF1D3A70),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                validator: (value) {
                  // Add your email/username validation logic here
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }

                  bool isValidEmail = EmailValidator.validate(value);
                  if (!isValidEmail) {
                    // Invalid email format
                    return 'Please enter a valid email address';
                  }
                  
                  return null;
                },
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _recoverPassword,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D3A70),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(24),
            ),
            child: const Text(
              'Send recovery email',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _recoverPassword() {
    if (_formKey.currentState!.validate()) {
      // Add your sign in logic here
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerifyIdentityPage(),
        ),
      );
    }
  }
}
