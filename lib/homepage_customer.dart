import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, leading: Icon(Icons.menu)),
      body:  SafeArea(
        child: SingleChildScrollView(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 10),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text(
                                'Your Sustainability Score: ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Heading',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'You helped save 2.3kg CO₂ this week',
                                style: TextStyle(
                                  fontFamily: 'text',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
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
