import 'package:flutter/material.dart';
import 'new_card.dart';
import 'first.dart';

class ChooseCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose Card Page',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // First card
              GestureDetector(
                onTap: () {
                  // Navigation logic goes here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewCardPage()),
                  );
                },
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 330,
                    minWidth: 300,
                  ),
                  child: Container(
                    height: 190,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D3A70),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/mastercard_icon.png',
                                  height: 26,
                                ),
                                const SizedBox(height: 34),
                                const Text(
                                  '****  ****  ****  1121',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Text(
                                  '13/24',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, .6),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 26),
                                const Text(
                                  'Tommy Jason',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/background_image.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Second card
              GestureDetector(
                onTap: () {
                  // Navigation logic goes here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewCardPage()),
                  );
                },
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 330),
                  child: Container(
                    height: 190,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D3A70),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                          decoration: const BoxDecoration(
                            color: Color(0xFF1D3A70),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/sec1bg.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/chip.png',
                                    height: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Image.asset(
                                    'assets/images/NFC.png',
                                    height: 24,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 34),
                              const Text(
                                '2564   8546   8421   1121',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: const BoxDecoration(
                              color: Color(0xFF1DAB87),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Tommy Jason',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '13/24',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, .6),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/mastercard_icon.png',
                                  height: 26,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Third card
              GestureDetector(
                onTap: () {
                  // Navigation logic goes here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewCardPage()),
                  );
                },
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 330),
                  child: Container(
                    height: 190,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1DAB87),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/mastercard_icon.png',
                              height: 26,
                            ),
                            const Spacer(),
                            Image.asset(
                              'assets/images/chip.png',
                              height: 24,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          '2564   8546   8421   1121',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 17),
                        const Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Card Holder',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, .6),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Tommy Jason',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Expires',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, .6),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '13/24',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
