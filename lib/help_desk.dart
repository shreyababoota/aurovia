import 'package:aurovia/about_aurovia.dart';
import 'package:aurovia/about_us_page.dart';
import 'package:aurovia/faqs.dart';
import 'package:flutter/material.dart';
import 'feedback.dart';

class HelpDesk extends StatelessWidget {
  const HelpDesk({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> helpOptions = [
      'About Aurovia',
      'About Us',
      'FAQs',
      'Feedback & Suggestions',
    ];
    List<dynamic> actions = [
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AboutAurovia()),
      ),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AboutUs()),
      ),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Faqs()),
      ),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FeedBack()),
      ),
    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  'Aurovia HelpDesk',
                  style: TextStyle(
                    fontFamily: 'Heading',
                    fontSize: 30,
                    color: const Color.fromRGBO(46, 83, 3, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: actions[index],
                    title: Text(
                      // ignore: unnecessary_string_interpolations
                      '${helpOptions[index]}',
                      style: TextStyle(
                        fontFamily: 'text',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(height: 8, thickness: 1);
                },
                itemCount: helpOptions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
