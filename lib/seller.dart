import 'package:aurovia/seller_signup.dart';
import 'package:aurovia/existing_seller.dart';
import 'package:flutter/material.dart';

class SellerLoginSignUp extends StatelessWidget {
  const SellerLoginSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 500,

                child: Image.asset(
                  'assets/images/customer_homePageImage.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 192, 203, 126),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color.fromRGBO(46, 83, 3, 1),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExistingSellerLogin(),
                            ),
                          );
                        },
                        child: Text('Existing Seller Login'),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color.fromRGBO(46, 83, 3, 1),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SellerSignUpPage(),
                            ),
                          );
                        },
                        child: Text('New Seller SignUp', style: TextStyle()),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
