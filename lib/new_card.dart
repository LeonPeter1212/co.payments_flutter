import 'package:flutter/material.dart';
import 'package:myapp/home1.dart';
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

class ColorSelectorWidget extends StatefulWidget {
  final Function(int) onColorChanged;

  const ColorSelectorWidget({required this.onColorChanged});

  @override
  _ColorSelectorWidgetState createState() => _ColorSelectorWidgetState();
}

int selectedColorIndex = 1; // Default selected color index

List<List<Color>> colorPairs = [
  [const Color(0xFF1D3A70), const Color(0xFFFFB9AA)],
  [const Color(0xFF1D3A70), const Color(0xFF1DAB87)],
  [const Color(0xFF1DAB87), const Color(0xFFFFB9AA)],
];

class _ColorSelectorWidgetState extends State<ColorSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 129,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int index = 0; index < colorPairs.length; index++)
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedColorIndex = index;
                });

                widget.onColorChanged(selectedColorIndex);
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      offset: Offset(1.95, 1.95),
                      blurRadius: 2.6,
                    ),
                  ],
                  color: colorPairs[index][0],
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 24,
                          height: 12,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(50)),
                            color: colorPairs[index][1],
                          ),
                        ),
                      ),
                    ),
                    if (index == selectedColorIndex)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(Icons.check,
                              color: Colors.white, size: 16),
                        ),
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
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
  void updateCardColor(int index) {
    setState(() {
      selectedColorIndex = index;
    });
  }

  // Function to show an alert message if save is pressed
  void _showSelectCountryAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Set the background color to white
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          title: const Text(
            'Great! your card is ready🙂',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1D3A70),
            ),
            textAlign: TextAlign.center,
          ),
          content: const Text(
            'Now you can shop, transmit and transfer conveniently',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF6B7280),
            ),
            textAlign: TextAlign.center,
          ),
          contentPadding: const EdgeInsets.fromLTRB(
            16,
            16,
            16,
            0,
          ), // Adjust content padding as needed
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ), // Adjust actions padding as needed
          actions: [
            SizedBox(
              width: double.infinity, // Make the button span the full width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeOnePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF1D3A70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(16),
                ),
                child: const Text(
                  'Ok, I’m ready!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                // Bottom widget
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
                            decoration: BoxDecoration(
                              color: colorPairs[selectedColorIndex][0],
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              image: const DecorationImage(
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
                                  '0000   0000   0000   0000',
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
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              decoration: BoxDecoration(
                                color: colorPairs[selectedColorIndex][1],
                                borderRadius: const BorderRadius.only(
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
                                          'Your Name',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '00/00',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, .6),
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
                // Top widget
                Positioned(
                  top: 64.5,
                  right: 0,
                  child: ColorSelectorWidget(
                    onColorChanged: updateCardColor,
                  ), // Integrated ColorSelectorWidget here
                ),
              ],
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
                                    ? const Color(0xFF1D3A70)
                                    : const Color(0xFF9CA3AF),
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
            onPressed: () {
              _showSelectCountryAlert();
            },
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
