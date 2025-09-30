import 'package:aurovia/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF4CAF50),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
          titleTextStyle: TextStyle(
            fontSize: 30,
            fontFamily: 'Heading',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 7,
            side: BorderSide(color: const Color.fromRGBO(46, 83, 3, 1)),
            backgroundColor: const Color.fromRGBO(46, 83, 3, 1),
            foregroundColor: Colors.white,
            textStyle: TextStyle(
              fontFamily: 'Heading',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
