import 'package:classroom_manager/features/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


// Students list and details page - 30
// Subject list and details page - 30
// Class room list and details page - 30

// Class room => Conference and class room - 30
// Class room => Assign and change subject - 30

// Registration

// List - 30
// Detail => Delete option - 1 hour
// Create => Subject and Student selection - 1 hour