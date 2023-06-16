import 'package:flutter/material.dart';
import 'create_password.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verify Identity',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: VerifyIdentityPage(),
    );
  }
}

class VerifyIdentityPage extends StatefulWidget {
  @override
  _VerifyIdentityPageState createState() => _VerifyIdentityPageState();
}

class _VerifyIdentityPageState extends State<VerifyIdentityPage> {
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
                '../assets/images/verify.png',
                height: 100,
              ),
              const SizedBox(height: 30),
              const Text(
                'Verify your identity',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D3A70),
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                textAlign: TextAlign.left,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text: 'Where would you like ',
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    TextSpan(
                      text: 'Co.payment ',
                      style: TextStyle(
                        color: Color(0xFF1DAB87),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'to send your security code?',
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 243, 243),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1DAB87),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Transform.scale(
                          scale: .8, // Adjust the scale factor as needed
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              color: Color(0xFF1D3A70),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'T*******@gmail.com',
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.network(
                      '../assets/images/email.png',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
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
            onPressed: _verifyThenContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D3A70),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(24),
            ),
            child: const Text(
              'Continue',
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

  void _verifyThenContinue() {
    if (_formKey.currentState!.validate()) {
      // Add your sign in logic here

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreatePasswordPage(),
        ),
      );
    }
  }
}
