import 'package:aurovia/seller_home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExistingSellerLogin extends StatelessWidget {
  const ExistingSellerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    var username = TextEditingController();
    var password = TextEditingController();

    Future<void> loginUser() async {
      try {
        showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          },
        );

        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username.text.trim(),
          password: password.text.trim(),
        );

        Navigator.pop(context);

        var msg = SnackBar(content: Text('Succesfully Logged In'));
        ScaffoldMessenger.of(context).showSnackBar(msg);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SellerHome()),
        );
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        var msg = SnackBar(content: Text(e.message.toString()));
        ScaffoldMessenger.of(context).showSnackBar(msg);
      }
    }

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
                  hintText: 'Email',
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
                onPressed: () async {
                  await loginUser();
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
