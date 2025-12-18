import 'simple_map.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';  // Import Google Fonts

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaxiApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SimpleMapPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}