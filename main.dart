import 'package:callisto/firebase_options.dart';
import 'package:callisto/landingscreen.dart';
import 'package:callisto/pages/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 112, 18, 43),
          primary: const Color.fromARGB(255, 112, 18, 43),
          secondary: const Color(0xff881736),
          surface: Colors.white,
          background: const Color(0xFF2B2E4A),
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.white,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2B2E4A),
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF2B2E4A),
          selectedItemColor: Color(0xff3D82EB),
          unselectedItemColor: Color(0xffA5A5A5),
        ),
        scaffoldBackgroundColor: const Color(0xFF2B2E4A),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 112, 18, 43),
          primary: const Color.fromARGB(255, 112, 18, 43),
          secondary: const Color(0xff881736),
          surface: const Color(0xFF1B1D2F),
          background: const Color(0xFF1B1D2F),
          error: const Color(0xffCF6679),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.black,
          onError: Colors.black,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1B1D2F),
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1B1D2F),
          selectedItemColor: Color(0xff3D82EB),
          unselectedItemColor: Color(0xffA5A5A5),
        ),
        scaffoldBackgroundColor: const Color(0xFF1B1D2F),
        useMaterial3: true,
      ),
      themeMode: themeNotifier.themeMode,
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}
