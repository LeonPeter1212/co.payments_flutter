import 'package:flutter/material.dart';
import 'create_password.dart';
import 'first.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final _formKey = GlobalKey<FormState>();
  List<int> enteredDigits = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextButton(
            onPressed: () {
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Verify it’s you',
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
                      text: 'We send a code to ( ',
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    TextSpan(
                      text: 'T*****@mail.com ',
                      style: TextStyle(
                        color: Color(0xFF1D3A70),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '). Enter it here to verify your identity',
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Verification code successfully sent!'),
                      ),
                    );
                  },
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(
                      color: Color(0xFF1DAB87),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: VerificationCodeInputField(
                      enteredDigits: enteredDigits,
                      onChanged: (digit) {
                        setState(() {
                          if (digit != null) {
                            enteredDigits.add(digit);
                          } else if (enteredDigits.isNotEmpty) {
                            enteredDigits.removeLast();
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _verificationCodeChecker,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D3A70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text(
                    'Confirm',
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
              )
            ],
          ),
        ),
      ),
    );
  }

  void _verificationCodeChecker() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreatePasswordPage(),
      ),
    );
  }
}

class VerificationCodeInputField extends StatelessWidget {
  final List<int> enteredDigits;
  final ValueChanged<int?> onChanged;

  const VerificationCodeInputField({
    required this.enteredDigits,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        5,
        (index) {
          final isCurrentField = enteredDigits.length == index;
          final isFilledField = enteredDigits.length > index;

          return Expanded(
            child: Container(
              width: 40, // Adjust the width as desired
              height: 70,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: const Color(
                    0xFFF9FAFB), // Change to the desired background color
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isCurrentField ? Colors.black : Colors.transparent,
                  width: isCurrentField ? 2 : 0,
                ),
              ),
              child: Center(
                child: Text(
                  isFilledField ? enteredDigits[index].toString() : '',
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
      width: 80, // Adjust the width as desired
      height: 80, // Adjust the height as desired
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
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
