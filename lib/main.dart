import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_flutter/main_screen.dart';
import 'package:wisata_flutter/provider/done_tourism_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoneTourismProvider(),
      child: MaterialApp(
        title: 'Contacts',
        theme: ThemeData(),
        home: const MainScreen(),
      ),
    );
  }
}

