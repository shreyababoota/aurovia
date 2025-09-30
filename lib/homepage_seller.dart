import 'package:aurovia/add_product.dart';
import 'package:aurovia/my_products.dart';
import 'package:flutter/material.dart';

class SellerHomePage extends StatelessWidget {
  const SellerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, leading: Icon(Icons.menu)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/sus_dev.jpg', fit: BoxFit.fill),
            ),
            Container(
              width: double.infinity,
              color: Color.fromARGB(255, 79, 94, 3),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
            
                      width: double.infinity,
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Daily Tip: ',
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'text',
                                fontWeight: FontWeight.w900,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '   "Turn off the tap while brushing -saves 12L of water daily" ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 79, 94, 3),
                                fontFamily: 'text',
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyProducts()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color.fromARGB(255, 79, 94, 3),
                      ),
                      child: Text('My Products'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddProduct()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color.fromARGB(255, 79, 94, 3),
                      ),
                      child: Text('Add Products'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
