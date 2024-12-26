import 'package:flutter/material.dart';
import 'package:flutter_maps/current_address/google_maps_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FLUTTER X GOOGLE MAPS",
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: GoogleMapsScreen(),
    );
  }
}
