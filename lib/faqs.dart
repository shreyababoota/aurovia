import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Faqs extends StatefulWidget {
  const Faqs({super.key});

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  String data = '';
  importFaqs() async {
    String response = await rootBundle.loadString('assets/textfiles/faqs.txt');
    setState(() {
      data = response;
    });
  }

  @override
  void initState() {
    importFaqs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Frequently Asked Questions',
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
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
