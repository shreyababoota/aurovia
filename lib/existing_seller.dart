import 'package:aurovia/seller_home.dart';
import 'package:flutter/material.dart';

class ExistingSellerLogin extends StatelessWidget {
  const ExistingSellerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    var username = TextEditingController();
    var password = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Existing Seller Login'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: username,
                decoration: InputDecoration(
                  hintText: 'Company Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  var u = username.text;
                  var p = password.text;
                  if (u.isEmpty || p.isEmpty) {
                    var msg = SnackBar(
                      content: Text('Please fill all the fields'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(msg);
                  } else {
                    var msg = SnackBar(content: Text('Succesfully Logged In'));
                    ScaffoldMessenger.of(context).showSnackBar(msg);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SellerHome()),
                    );
                  }
                  username.clear();
                  password.clear();
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
