import 'package:flutter/material.dart';
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
      home: NewCardPage(),
    );
  }
}

class Country {
  final String name;
  final String flagUrl;

  Country({required this.name, required this.flagUrl});
}

class NewCardPage extends StatefulWidget {
  @override
  _NewCardPageState createState() => _NewCardPageState();
}

class _NewCardPageState extends State<NewCardPage> {
  // Variables for country selection
  String selectedCountry = '';
  List<Country> countries = [
    Country(name: 'United Kingdom', flagUrl: 'assets/images/flags/GB.png'),
    Country(name: 'Singapore', flagUrl: 'assets/images/flags/SG.png'),
    Country(name: 'United States', flagUrl: 'assets/images/flags/US.png'),
    Country(name: 'China', flagUrl: 'assets/images/flags/CN.png'),
    Country(name: 'Netherlands', flagUrl: 'assets/images/flags/NL.png'),
    Country(name: 'Indonesia', flagUrl: 'assets/images/flags/ID.png'),
  ];

  // Function to toggle country selection
  void _toggleCountrySelection(String country) {
    setState(() {
      selectedCountry = country;
    });
  }

  // Function to check if a country is selected
  bool _isCountrySelected(String country) {
    return selectedCountry == country;
  }

  // Function to show the country selection drawer
  void _showCountryDrawer() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        String filter = '';

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.75,
              padding: const EdgeInsets.only(top: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFF9FAFB),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Color(0xFF1D3A70),
                              ),
                              hintText: 'Search',
                              hintStyle: const TextStyle(
                                color: Color(0xFF6B7280),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                filter = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              color: Color(0xFF1D3A70),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: countries.length,
                      itemBuilder: (BuildContext context, int index) {
                        final country = countries[index];
                        final isSelected = _isCountrySelected(country.name);

                        if (filter.isNotEmpty &&
                            !country.name
                                .toLowerCase()
                                .contains(filter.toLowerCase())) {
                          return const SizedBox.shrink();
                        }

                        return ListTile(
                          leading: Image.asset(country.flagUrl),
                          title: Row(
                            children: [
                              Text(
                                country.name.substring(0, 2).toUpperCase(),
                                style: const TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                country.name,
                                style: const TextStyle(
                                  color: Color(0xFF1D3A70),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          trailing: isSelected ? const Icon(Icons.check) : null,
                          onTap: () {
                            _toggleCountrySelection(country.name);
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Card',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF3F4F6),
              ),
              padding: const EdgeInsets.all(34),
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
                            Image.asset(
                              'assets/images/chip.png',
                              height: 24,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Card Details',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1D3A70)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Card number',
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
                      suffixIcon: Image.asset(
                        'assets/images/mastercard.png',
                        height: 26,
                      ),
                    ),
                    style: const TextStyle(
                      color: Color(0xFF1D3A70),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your card number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Expiry date',
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
                            if (value == null || value.isEmpty) {
                              return 'Please enter expiry date';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'CVV',
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
                            if (value == null || value.isEmpty) {
                              return 'Please enter CVV';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Card holder',
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
                      if (value == null || value.isEmpty) {
                        return 'Please enter card holder name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      _showCountryDrawer();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFF1F1F1), // Border color
                          width: 1, // Border width
                        ),
                      ),
                      padding: selectedCountry.isNotEmpty
                          ? const EdgeInsets.all(16)
                          : const EdgeInsets.fromLTRB(0, 16, 16, 16),
                      child: Row(
                        children: [
                          if (selectedCountry.isNotEmpty)
                            Image.asset(
                              countries
                                  .firstWhere((country) =>
                                      country.name == selectedCountry)
                                  .flagUrl,
                              width: 24,
                              height: 18,
                            ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              selectedCountry.isNotEmpty
                                  ? selectedCountry
                                  : 'Select country',
                              style: TextStyle(
                                fontSize: 18,
                                color: selectedCountry.isNotEmpty
                                    ? Color(0xFF1D3A70)
                                    : Color(0xFF9CA3AF),
                                fontWeight: selectedCountry.isNotEmpty
                                    ? FontWeight.w500
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF6B7280),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D3A70),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
            ),
            child: const Text(
              'Save',
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
}
