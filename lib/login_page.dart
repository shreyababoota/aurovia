import 'seller.dart';
import 'package:flutter/material.dart';
import 'customer_login_signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aurovia',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(249, 12, 70, 27),
                    fontFamily: 'Heading',
                    height: 1.0,
                  ),
                ),
                Text(
                  'A path towards a better, cleaner environment',
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromRGBO(139, 195, 74, 1),
                    fontFamily: 'Subheading',
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginSignUp()),
                );
              },
              child: Text('Consumer Login/SignUP'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SellerLoginSignUp()),
                );
              },
              child: Text('Seller Login/SingUP'),
            ),
          ],
        ),
      ),
    );
  }
}
