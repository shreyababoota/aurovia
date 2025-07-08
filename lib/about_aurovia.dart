import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AboutAurovia extends StatefulWidget {
  const AboutAurovia({super.key});

  @override
  State<AboutAurovia> createState() => _AboutAuroviaState();
}

class _AboutAuroviaState extends State<AboutAurovia> {
  String data = '';
  fetchFileData() async {
    String responseText = await rootBundle.loadString(
      'assets/textfiles/about_aurovia.txt',
    );
    setState(() {
      data = responseText;
    });
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'About Aurovia',
                style: TextStyle(
                  fontFamily: 'Heading',
                  fontSize: 30,
                  color: const Color.fromRGBO(46, 83, 3, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                data,
                style: TextStyle(
                  fontFamily: 'text',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
