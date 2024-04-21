
import 'package:flutter/material.dart';

import 'Home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),

      }
  ));
}


