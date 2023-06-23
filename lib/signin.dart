import 'package:flutter/material.dart';
import 'first.dart';
import 'signup.dart';
import 'country.dart';
import 'recovery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign In',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Hi There!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1D3A70),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/images/waving-hand.png',
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Welcome back, Sign in to your account.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email / Username',
                    hintStyle: const TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: const EdgeInsets.all(16),
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
                      return 'Please enter your email/username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: const EdgeInsets.all(16),
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
                    suffixIcon: IconButton(
                      icon: _obscureText
                          ? const Icon(Icons.visibility_off) // Eye open icon
                          : const Icon(Icons.visibility), // Eye closed icon
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  style: const TextStyle(
                    color: Color(0xFF1D3A70),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  obscureText: _obscureText,
                  validator: (value) {
                    // Add your password validation logic here
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      // Action to be performed when the 'Forgot Password?' link is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecoveryPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFF1DAB87),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _signIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D3A70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Row(
                  children: [
                    Expanded(
                      child: Image(
                        image: AssetImage(
                          'assets/images/line-left.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image(
                        image: AssetImage(
                          'assets/images/line-right.png',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          // Action to be performed when the 'Google' button is pressed
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: const BorderSide(
                              color: Color(0xFFE5E7EB),
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                        ),
                        child: const Image(
                          image: AssetImage(
                            'assets/images/search.png',
                          ),
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          // Action to be performed when the 'Apple' button is pressed
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: const BorderSide(
                              color: Color(0xFFE5E7EB),
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                        ),
                        child: const Image(
                          image: AssetImage(
                            'assets/images/apple.png',
                          ),
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Action to be performed when the 'Sign Up' link is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
                  );
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color(0xFF1DAB87),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      // Add your sign in logic here
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CountryPage(),
        ),
      );
    }
  }
}
