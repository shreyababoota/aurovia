import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var brdr = OutlineInputBorder(borderRadius: BorderRadius.circular(25));
    var name = TextEditingController();
    var manuEmission = TextEditingController();
    var materialType = TextEditingController();
    var recyclability = TextEditingController();
    var logisticEmission = TextEditingController();
    var certification = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Add Product')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  border: brdr,
                  hintText: 'Product Name',
                ),
              ), // Name of product
              SizedBox(height: 10),
              Text(
                'Below details are mandatory for calculating Harit Index of the product. Normalize each parameter (0-100 scale)',
                style: TextStyle(fontSize: 15, fontFamily: 'Subheading'),
              ),
              SizedBox(height: 5),
              TextField(
                keyboardType: TextInputType.number,
                controller: manuEmission,
                decoration: InputDecoration(
                  border: brdr,
                  hintText: 'Manufacturing Emissions',
                ),
              ), // Manufacturing emissions
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                controller: materialType,
                decoration: InputDecoration(
                  border: brdr,
                  hintText: 'Material Type',
                ),
              ), // Material Type
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                controller: recyclability,
                decoration: InputDecoration(
                  border: brdr,
                  hintText: 'Recyclability',
                ),
              ), //Recyclability
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                controller: logisticEmission,
                decoration: InputDecoration(
                  border: brdr,
                  hintText: 'Logistic Emissions',
                ),
              ), // Logistics Emissions
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                controller: certification,
                decoration: InputDecoration(
                  border: brdr,
                  hintText: 'Certification',
                ),
              ), // Certifications
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  var n = name.text;
                  var me = manuEmission.text;
                  var mt = materialType.text;
                  var r = recyclability.text;
                  var le = logisticEmission.text;
                  var c = certification.text;

                  if (n.isEmpty ||
                      me.isEmpty ||
                      mt.isEmpty ||
                      r.isEmpty ||
                      le.isEmpty ||
                      c.isEmpty) {
                    var msg = SnackBar(
                      content: Text('Please fill all the fields'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(msg);
                  }

                  int a = int.parse(me);
                  int b = int.parse(mt);
                  int d = int.parse(r);
                  int e = int.parse(le);
                  int f = int.parse(c);

                  if (a < 0 ||
                      a > 100 ||
                      b < 0 ||
                      b > 100 ||
                      d < 0 ||
                      d > 100 ||
                      e < 0 ||
                      e > 100 ||
                      f < 0 ||
                      f > 100) {
                    var msg = SnackBar(
                      content: Text(
                        'All the fields should contain normalized value (0-100 scale)',
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(msg);
                  } else {
                    var msg = SnackBar(
                      content: Text('Product successfully added'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(msg);
                    Navigator.pop(context);
                  }
                  name.clear();
                  manuEmission.clear();
                  materialType.clear();
                  recyclability.clear();
                  logisticEmission.clear();
                  certification.clear();
                },
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
