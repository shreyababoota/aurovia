

import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> products = [
      {"rank": 1, "name": "Stainless Steel Tumbler", "HI": 84},
      {"rank": 2, "name": "Solar-Powered Lantern", "HI": 81},
      {"rank": 3, "name": "Reusable Coffee Cup", "HI": 77},
      {"rank": 4, "name": "Organic Cotton Tote", "HI": 75},
      {"rank": 5, "name": "Bamboo Toothbrush", "HI": 73},
      {"rank": 6, "name": "Composable TrashBag", "HI": 70},
      {"rank": 7, "name": "Stainless Steel Straw", "HI": 69},
      {"rank": 8, "name": "EcoFriendly dish sponges", "HI": 64},
      {"rank": 9, "name": "Energy-Efficient LED Bulbs", "HI": 60},
      {"rank": 10, "name": "Organic Cotton T-shirts", "HI": 58},
    ];
    return Padding(
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
                    'Eco LeaderBoard',
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
              Text(
                'Top Products By Harit Index',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  fontFamily: 'Subheading',
                ),
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
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
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
    );
  }
}
