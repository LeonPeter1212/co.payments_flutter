import 'package:flutter/material.dart';
import 'biometric.dart';

class PinCodePage extends StatefulWidget {
  @override
  _PinCodePageState createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  final _formKey = GlobalKey<FormState>();
  List<int> enteredDigits = [];

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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Set your PIN code',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D3A70),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'We use state-of-the-art security measures to protect your information at all times',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF6B7280),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        5,
                        (index) {
                          final isFilledField = enteredDigits.length > index;

                          return Expanded(
                            child: Container(
                              width: 40,
                              height: 70,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF9FAFB),
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.green,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  isFilledField ? '*' : '',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1D3A70),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _pincodeCodeChecker,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D3A70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text(
                    'Create PIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    children: [
                      for (int i = 1; i <= 3; i++)
                        Expanded(
                          child: NumberButton(
                            number: i,
                            onPressed: () {
                              setState(() {
                                enteredDigits.add(i);
                              });
                            },
                          ),
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      for (int i = 4; i <= 6; i++)
                        Expanded(
                          child: NumberButton(
                            number: i,
                            onPressed: () {
                              setState(() {
                                enteredDigits.add(i);
                              });
                            },
                          ),
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      for (int i = 7; i <= 9; i++)
                        Expanded(
                          child: NumberButton(
                            number: i,
                            onPressed: () {
                              setState(() {
                                enteredDigits.add(i);
                              });
                            },
                          ),
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NumberButton(
                          text: '*',
                          onPressed: () {
                            setState(() {
                              enteredDigits.add(0);
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: NumberButton(
                          number: 0,
                          onPressed: () {
                            setState(() {
                              enteredDigits.add(0);
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: NumberButton(
                          icon: Icons.backspace,
                          onPressed: () {
                            setState(() {
                              if (enteredDigits.isNotEmpty) {
                                enteredDigits.removeLast();
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pincodeCodeChecker() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BiometricAccessPage(),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final int? number;
  final String? text;
  final IconData? icon;
  final VoidCallback onPressed;

  const NumberButton({
    this.number,
    this.text,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          backgroundColor: Colors.white,
        ),
        child: Center(
          child: number != null
              ? Text(
                  number.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                    color: Color(0xFF1D3A70),
                  ),
                )
              : text != null
                  ? Text(
                      text!,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Color(0xFF1D3A70),
                      ),
                    )
                  : const Icon(
                      Icons.backspace,
                      size: 20,
                    ),
        ),
      ),
    );
  }
}
