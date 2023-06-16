import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom-to-Top Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController; // Fix: Added 'late' keyword
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
      if (_isDrawerOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom-to-Top Drawer Demo'),
      ),
      body: Stack(
        children: [
          // Your main content goes here
          const Center(
            child: Text(
              'Press the button to open the drawer!',
              style: TextStyle(fontSize: 18.0),
            ),
          ),

          // Custom drawer
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: _isDrawerOpen ? 0 : -300, // Adjust the value as needed
            left: 0,
            right: 0,
            height: 300, // Adjust the height as needed
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1), // Sliding from bottom
                end: Offset.zero,
              ).animate(_animationController),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    // Drawer content goes here
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('Home'),
                      onTap: () {
                        // Handle drawer item tap
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                      onTap: () {
                        // Handle drawer item tap
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleDrawer,
        child: Icon(_isDrawerOpen ? Icons.close : Icons.menu),
      ),
    );
  }
}
