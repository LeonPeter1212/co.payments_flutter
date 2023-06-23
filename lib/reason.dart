import 'package:flutter/material.dart';
import 'pincode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main reason for using Smartpay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: ReasonPage(),
    );
  }
}

class ReasonPage extends StatefulWidget {
  @override
  _ReasonPageState createState() => _ReasonPageState();
}

class _ReasonPageState extends State<ReasonPage> {
  final List<Map<String, dynamic>> options = <Map<String, dynamic>>[
    {
      'text': 'Spend or save daily',
      'icon': Icons.change_circle_outlined,
    },
    {
      'text': 'Fast my transactions',
      'icon': Icons.flash_on_outlined,
    },
    {
      'text': 'Payments to friends',
      'icon': Icons.group_outlined,
    },
    {
      'text': 'Online payments',
      'icon': Icons.payment,
    },
    {
      'text': 'Spend while travelling',
      'icon': Icons.toll,
    },
    {
      'text': 'Your financial assets',
      'icon': Icons.shopping_cart_checkout_outlined,
    },
  ];

  List<bool> selectedOptions = List.filled(6, false);

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Main reason for using Smartpay',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D3A70),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We need to know this for regulatory reasons. And also we’re curious!',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: List.generate(options.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOptions[index] = !selectedOptions[index];
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: selectedOptions[index]
                              ? const Color(0xFF1DAB87)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFE5E7EB),
                            width: 1,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Transform.scale(
                                scale: 1.4,
                                child: Icon(
                                  options[index]['icon'],
                                  color: selectedOptions[index]
                                      ? Colors.white
                                      : const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                options[index]['text'],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: selectedOptions[index]
                                      ? Colors.white
                                      : const Color(0xFF1D3A70),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
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
            'Continue',
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
        builder: (context) => PinCodePage(),
      ),
    );
  }
}
