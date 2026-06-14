import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:licence/screens/WelcomeScreen.dart';

void main() {
  runApp(
      ProviderScope(
        child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Licence',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF2563eb),
          primary: Color(0xFF2563eb),
          secondary: Color(0xFF10b981 ),
          surface: Color(0xFFf8fafc)
        ).copyWith(
          onSurface: Color(0xFF1e293b), // 👈 couleur du texte principal
        ),
        // Couleur de fond
        scaffoldBackgroundColor: const Color(0xFFf8fafc),
        textTheme: GoogleFonts.manropeTextTheme().copyWith(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),
          headlineMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600
          ),
          headlineSmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
          ),
          bodyLarge: TextStyle(
            fontSize: 16
          ),
          bodyMedium: TextStyle(
            fontSize: 14
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500
          ),
          labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
          labelMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
          labelSmall: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold
          )
        )
      ),
      home: WelcomeScreen(),
    );
  }
}
