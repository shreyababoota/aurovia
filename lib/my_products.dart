import 'package:flutter/material.dart';

class MyProducts extends StatelessWidget {
  const MyProducts({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> products = [
      {"rank": 1, "name": "Stainless Steel Tumbler", "HI": 84},
      {"rank": 2, "name": "Solar-Powered Lantern", "HI": 81},
      {"rank": 3, "name": "Reusable Coffee Cup", "HI": 77},
      {"rank": 4, "name": "Organic Cotton Tote", "HI": 75},
      {"rank": 5, "name": "Bamboo Toothbrush", "HI": 73},
    ];
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Products',
                      style: TextStyle(
                        color: Color.fromRGBO(46, 83, 3, 1),
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        height: 1,
                        fontFamily: 'Heading',
                      ),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rank',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    fontFamily: 'Heading',
                  ),
                ),
                Text(
                  'Product Name',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    fontFamily: 'Heading',
                  ),
                ),
                Text(
                  'Harit Index',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    fontFamily: 'Heading',
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      '${products[index]["rank"]}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    title: Text(
                      products[index]["name"],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: 'text',
                      ),
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(46, 83, 3, 1),
                      ),
                      height: 30,
                      width: 40,

                      child: Center(
                        child: Text(
                          '${products[index]["HI"]}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(height: 20, thickness: 4);
                },
                itemCount: products.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
