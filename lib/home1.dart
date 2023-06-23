import 'package:flutter/material.dart';
import 'package:myapp/testView.dart';
import 'first.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country of Residence',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: HomeOnePage(),
    );
  }
}

Widget _buildClickableElement(String title, String imageUrl) {
  return GestureDetector(
    onTap: () {
      // Action to be performed when the element is tapped
      print('Tapped $title');
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imageUrl, width: 32, height: 32),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1D3A70),
          ),
        ),
      ],
    ),
  );
}

class Transaction {
  final String icon;
  final String title;
  final String description;
  final String amount;
  final String type;

  Transaction({
    required this.icon,
    required this.title,
    required this.description,
    required this.amount,
    required this.type,
  });
}

class TransactionsSection extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      icon: 'assets/images/icons/withdraw.png',
      title: 'Sports',
      description: 'Payment',
      amount: '- \$15.99',
      type: '-',
    ),
    Transaction(
      icon: 'assets/images/icons/deposit.png',
      title: 'Bank of America',
      description: 'Deposit',
      amount: '+ \$2,045.00',
      type: '+',
    ),
    Transaction(
      icon: 'assets/images/icons/transfer.png',
      title: 'To Brody Armando',
      description: 'Sent',
      amount: '- \$986.00',
      type: '-',
    ),
    Transaction(
      icon: 'assets/images/icons/deposit.png',
      title: 'Bank of Africa',
      description: 'Payment',
      amount: '+ \$3,500.99',
      type: '+',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: transactions
          .asMap()
          .entries
          .map(
            (entry) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF9FAFB),
                        ),
                        child: Image.asset(
                          entry.value.icon,
                          height: 24,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.value.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1D3A70),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            entry.value.description,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        entry.value.amount,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: entry.value.type == '+'
                              ? const Color(0xFF1DAB87)
                              : const Color(0xFF1D3A70),
                        ),
                      ),
                    ],
                  ),
                ),
                if (entry.key != transactions.length - 1)
                  const Divider(
                    color: Color(0xFFF3F4F6),
                  ),
              ],
            ),
          )
          .toList(),
    );
  }
}


int _currentIndex = 0;

class HomeOnePage extends StatefulWidget {
  @override
  _HomeOnePageState createState() => _HomeOnePageState();
}

class _HomeOnePageState extends State<HomeOnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: const Color(0xFF1DAB87),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back!',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Tommy Jason',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            // Action to be performed when the icon is pressed
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatApp(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: const BorderSide(
                                color: Color(0xFFE5E7EB),
                              ),
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/notification.png',
                            height: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1DAB87),
              ),
              padding: const EdgeInsets.fromLTRB(34, 16, 34, 0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 330),
                child: Container(
                  height: 125,
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
                              '****   ****   ****   1121',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(34, 0, 34, 0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 330),
                child: Container(
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D3A70),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(50, 50, 93, 0.25),
                                offset: Offset(0, 50),
                                blurRadius: 100,
                                spreadRadius: -20,
                              ),
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                offset: Offset(0, 30),
                                blurRadius: 60,
                                spreadRadius: -30,
                              ),
                            ],
                            color: Color(0xFF1DAB87),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\$15,365.00',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/images/mastercard_icon.png',
                                height: 24,
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFF9FAFB)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildClickableElement(
                          'Deposit',
                          'assets/images/icons/deposit.png',
                        ),
                        _buildClickableElement(
                          'Transfer',
                          'assets/images/icons/transfer.png',
                        ),
                        _buildClickableElement(
                          'Withdraw',
                          'assets/images/icons/withdraw.png',
                        ),
                        _buildClickableElement(
                          'More',
                          'assets/images/icons/more.png',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Today, Mar 20',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Row(
                            children: [
                              Text(
                                'All transactions',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1D3A70),
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Color(0xFF1D3A70),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  TransactionsSection()
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0
                  ? const Color(0xFF1D3A70)
                  : const Color(0xFF6B7280),
            ),
            label: 'Home',
            activeIcon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                'assets/images/icons/home_icon.png',
                color: const Color(0xFF1D3A70),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.credit_card,
              color: _currentIndex == 1
                  ? const Color(0xFF1D3A70)
                  : const Color(0xFF6B7280),
            ),
            label: 'My Card',
            activeIcon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                'assets/images/icons/card_icon.png',
                color: const Color(0xFF1D3A70),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF1DAB87),
                boxShadow: [
                  const BoxShadow(
                    color: Color.fromRGBO(10, 99, 117, 0.15),
                    offset: Offset(2, 8),
                    blurRadius: 20,
                  ),
                ],
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: _currentIndex == 3
                  ? const Color(0xFF1D3A70)
                  : const Color(0xFF6B7280),
            ),
            label: 'Activity',
            activeIcon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                'assets/images/icons/activity_icon.png',
                color: const Color(0xFF1D3A70),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _currentIndex == 4
                  ? const Color(0xFF1D3A70)
                  : const Color(0xFF6B7280),
            ),
            label: 'Profile',
            activeIcon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                'assets/images/icons/profile_icon.png',
                color: const Color(0xFF1D3A70),
              ),
            ),
          ),
        ],
        selectedItemColor:
            const Color(0xFF1D3A70), // Set the selected item text color
        unselectedItemColor:
            const Color(0xFF6B7280), // Set the unselected item text color
        selectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold), // Set the selected item text style
        unselectedLabelStyle:
            const TextStyle(fontSize: 14), // Set the unselected item text style
      ),
    );
  }
}
