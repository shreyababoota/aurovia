import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SellerSignUpPage extends StatelessWidget {
  const SellerSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var username = TextEditingController();
    var password = TextEditingController();
    var password2 = TextEditingController();
    var mail = TextEditingController();

    Future<void> createUser() async {
      try {
        showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          },
        );

        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: mail.text.trim(),
          password: password.text.trim(),
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
              'uid': FirebaseAuth.instance.currentUser!.uid,
              'email': mail.text.trim(),
              'username': username.text.trim(),
              'role': 'seller',
            });

        Navigator.pop(context);

        var msg = SnackBar(
          content: Text(
            'Username succesfully added to the DataBase you may login now',
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(msg);
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        var msg = SnackBar(content: Text(e.message.toString()));
        ScaffoldMessenger.of(context).showSnackBar(msg);
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('New Seller SignUP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: username,
                decoration: InputDecoration(
                  hintText: 'username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: mail,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
              SizedBox(height: 10),
              TextField(
                controller: password2,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Re-enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  var p = password.text;
                  var p2 = password2.text;

                  if (p != p2) {
                    var msg = SnackBar(content: Text('Passwords do not match'));
                    ScaffoldMessenger.of(context).showSnackBar(msg);
                  } else {
                    await createUser();
                    password2.clear();
                    password.clear();
                    mail.clear();
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
