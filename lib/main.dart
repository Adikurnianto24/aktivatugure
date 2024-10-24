import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import '/onboarding_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://oxehpmkoadobvjuazynf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im94ZWhwbWtvYWRvYnZqdWF6eW5mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk3NDUwMTQsImV4cCI6MjA0NTMyMTAxNH0.ub0KkH3tQolR0YobkGDevGy2XE5ekAI-w2FTFuPm0i4',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aktiva Tugure',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthWrapper(),
        '/onboarding': (context) => OnboardingScreen(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement actual login check logic here
    bool isLoggedIn = checkLoginStatus();

    return isLoggedIn ? OnboardingScreen() : LoginScreen();
  }

  bool checkLoginStatus() {
    return false;
  }
}
