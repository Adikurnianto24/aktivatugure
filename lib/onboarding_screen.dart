import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'home_screen.dart'; // Import the HomeScreen

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<OnboardingPage> _pages = const [
    OnboardingPage(
      title: "Explore",
      description: "Discover new places and experiences around you.",
      lottieAsset: "assets/lottie/lottie1.json",
    ),
    OnboardingPage(
      title: "Travel",
      description: "Plan your trips and book your rides easily.",
      lottieAsset: "assets/lottie/lottie1.json",
    ),
    OnboardingPage(
      title: "Enjoy",
      description: "Make the most of your journey and create memories.",
      lottieAsset: "assets/lottie/lottie1.json",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Ensure this is called
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  void dispose() {
    _pageController.dispose(); // Ensure this is called
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0047AB), // Warna biru tua
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildPage(_pages[index]);
                },
              ),
            ),
            _buildPageIndicator(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              page.lottieAsset,
              height: 300,
              width: 300,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 300,
                  width: 300,
                  color: Colors.grey,
                  child: const Center(child: Text('Animasi tidak tersedia')),
                );
              },
            ),
            const SizedBox(height: 30),
            Text(
              page.title,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 15),
            Text(
              page.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pages.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? Colors.white
                : Colors.white.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              // Handle skip logic
            },
            child: const Text(
              'LEWATI',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Button background color
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: TextButton(
              onPressed: () {
                if (_currentPage == _pages.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                _currentPage == _pages.length - 1 ? 'MULAI' : 'LANJUT',
                style: const TextStyle(color: Colors.blue), // Text color
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final String lottieAsset;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.lottieAsset,
  });
}
