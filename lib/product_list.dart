import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final allProducts = FirebaseFirestore.instance.collection('products');

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
          StreamBuilder(
            stream: allProducts.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text(
                    'Nothing to show',
                    style: TextStyle(
                      fontFamily: 'heading',
                      color: const Color.fromRGBO(46, 83, 3, 1),
                      fontSize: 20,
                    ),
                  ),
                );
              }
              var products = snapshot.data!.docs;
              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    var data = products[index].data();
                    String name = data['name'] ?? 'Unnamed';
                    String by = data['by'] ?? 'Unknown Seller';
                    String HI = data['HI'] ?? 'N/A';
                    return ListTile(
                      leading: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      title: Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          fontFamily: 'text',
                        ),
                      ),
                      subtitle: Text(
                        'By:- $by',
                        style: TextStyle(
                          fontFamily: 'Heading',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: const Color.fromRGBO(46, 83, 3, 1),
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
                            HI,
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
              );
            },
          ),
        ],
      ),
    );
  }
}
