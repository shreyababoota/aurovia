import 'dart:ui';

import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    Card cardCreater({required String name, required String branch}) {
      return Card(
        elevation: 15,
        color: const Color.fromRGBO(46, 83, 3, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Heading',
                      fontWeight: FontWeight.w800,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    branch,
                    style: TextStyle(
                      fontFamily: 'text',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Harcourt Butler Technical University',
                    style: TextStyle(
                      fontFamily: 'text',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Batch 2027',
                    style: TextStyle(
                      fontFamily: 'text',
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Our Team',
                style: TextStyle(
                  fontFamily: 'Heading',
                  fontSize: 40,
                  color: const Color.fromRGBO(46, 83, 3, 1),
                  fontWeight: FontWeight.w800,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      width: 500,
                      height: 250,
                      child: cardCreater(
                        name: 'Harsh Agrawal',
                        branch: 'Information Technology',
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 500,
                      height: 250,
                      child: cardCreater(
                        name: 'Lakshya Baranwal',
                        branch: 'Information Technology',
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 500,
                      height: 250,
                      child: cardCreater(
                        name: 'Bhavya Bhargava',
                        branch: 'Information Technology',
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 500,
                      height: 250,
                      child: cardCreater(
                        name: 'Muskan Agrawal',
                        branch: 'Chemical Technology',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
