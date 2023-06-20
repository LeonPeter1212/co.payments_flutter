import 'package:flutter/material.dart';
import 'reason.dart';

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
      home: CountryPage(),
    );
  }
}

class Country {
  final String name;
  final String flagUrl;

  Country({required this.name, required this.flagUrl});
}

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final _formKey = GlobalKey<FormState>();

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

  // Function to show an alert message if no country has been selected
  void _showSelectCountryAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Country Selection'),
          content: const Text(
              'Please select your country of residence before proceeding.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
                  builder: (context) => ReasonPage(),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Country of Residence',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D3A70),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please select all the countries that you’re a tax resident in',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: _showCountryDrawer,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Row(
                  children: [
                    if (selectedCountry.isNotEmpty)
                      Image.asset(
                        countries
                            .firstWhere(
                                (country) => country.name == selectedCountry)
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
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF1D3A70),
                          fontWeight: FontWeight.w500,
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
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (selectedCountry.isEmpty) {
                _showSelectCountryAlert();
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReasonPage(),
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
      ),
    );
  }
}
