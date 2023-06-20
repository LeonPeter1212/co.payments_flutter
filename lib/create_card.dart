import 'package:flutter/material.dart';
import 'package:myapp/choose_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Started',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const CreateCardPage(),
    );
  }
}

class CreateCardPage extends StatefulWidget {
  const CreateCardPage({Key? key}) : super(key: key);

  @override
  State<CreateCardPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<CreateCardPage> {
  final PageController _pageController = PageController();
  double _currentPage = 0;

  List<Map<String, String>> slidePages = [
    {
      'image': 'assets/images/slide1.png',
      'title': 'Finance app the safest and most trusted',
      'description':
          'Your finance work starts here. We are here to help you track and deal with speeding up your transactions.',
    },
    {
      'image': 'assets/images/slide2.png',
      'title': 'The fastest transaction process only here',
      'description':
          'Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/home.png',
              width: 300,
              height: 450,
            ),
            const SizedBox(height: 16),
            const Text(
              'Create your Smartpay Card',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D3A70),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8),
            const Text(
              'The customizable, no hidden fee, instant discount debit or credit card',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChooseCardPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1D3A70),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
          ),
          child: const Text(
            'Get Free Card',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
