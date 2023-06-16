import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'signin.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading time with a delay
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false; // Update the isLoading flag to false
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: const Color(0xFF1DAB87),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Adjusted crossAxisAlignment
            children: [
              Image.asset(
                '../assets/images/logo.png',
                width: 200,
                height: 100,
              ),
              const SizedBox(height: 6),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Co',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text: '.Payment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const FirstPage(); // Transition to the home page
    }
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final PageController _pageController = PageController();
  double _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              // Action to be performed when the 'Skip' button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInPage(),
                ),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page.toDouble();
                  });
                },
                children: [
                  Container(
                    // First Slide
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          '../assets/images/slide1.png',
                          width: 300,
                          height: 400,
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Finance app ',
                                  style: TextStyle(
                                    color: Color(0xFF1D3A70),
                                  ),
                                ),
                                TextSpan(
                                  text: 'the safest and most ',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'trusted',
                                  style: TextStyle(
                                    color: Color(0xFF1D3A70),
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Your finance work starts here. Our here to help you track and deal with speeding up your transactions.',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Color(0xFF6B7280), fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // Second Slide
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          '../assets/images/slide2.png',
                          width: 300,
                          height: 400,
                        ),
                        const SizedBox(height: 16),
                        const Center(
                          child: Text(
                            'The fastest transaction process only here',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1D3A70),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Color(0xFF6B7280), fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DotsIndicator(
              dotsCount: 2,
              position: _currentPage,
              decorator: DotsDecorator(
                size: const Size.square(6.0),
                activeSize: const Size(34.0, 6.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                activeColor: const Color(0xFF1D3A70),
                color: const Color(0xFFE5E7EB),
                spacing: const EdgeInsets.symmetric(horizontal: 6.0),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Action to be performed when the 'Get Started' button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1D3A70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(24),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
