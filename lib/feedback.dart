import 'package:flutter/material.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'We love to hear from you! Please reach out to us and we will get back to you in a bit',
              style: TextStyle(
                fontFamily: 'Heading',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Email:',
              style: TextStyle(
                height: 0.8,
                fontFamily: 'Heading',
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'teamaurovia@gmail.com',
              style: TextStyle(
                fontFamily: 'Heading',
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
