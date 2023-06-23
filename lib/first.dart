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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
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
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FirstPage()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1DAB87),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
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

  List<Map<String, dynamic>> slidePages = [
    {
      'image': 'assets/images/slide1.png',
      'title': RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1D3A70),
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
      ),
      'description':
          'Your finance work starts here. We are here to help you track and deal with speeding up your transactions.',
    },
    {
      'image': 'assets/images/slide2.png',
      'title': const Text(
        'The fastest transaction process only here',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1D3A70),
        ),
        textAlign: TextAlign.center,
      ),
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                fontSize: 16,
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
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page.toDouble();
                  });
                },
                itemCount: slidePages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          slidePages[index]['image'] as String,
                          height: 300,
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1D3A70),
                            ),
                            textAlign: TextAlign.center,
                            child: slidePages[index]['title'] as Widget,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          slidePages[index]['description'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            DotsIndicator(
              dotsCount: slidePages.length,
              position: _currentPage,
              decorator: DotsDecorator(
                size: const Size.square(8.0),
                activeSize: const Size(34.0, 8.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                activeColor: const Color(0xFF1D3A70),
                color: const Color(0xFFE5E7EB),
                spacing: const EdgeInsets.symmetric(horizontal: 6.0),
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
            if (_currentPage < slidePages.length - 1) {
              // If not on the last slide, go to the next slide
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            } else {
              // If on the last slide, navigate to the SignInPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInPage(),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1D3A70),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
          ),
          child: Text(
            _currentPage < slidePages.length - 1 ? 'Next' : 'Get Started',
            style: const TextStyle(
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
