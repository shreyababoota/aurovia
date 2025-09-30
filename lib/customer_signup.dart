import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerSignUpPage extends StatelessWidget {
  const CustomerSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var password = TextEditingController();
    var password2 = TextEditingController();
    var mail = TextEditingController();

    Future<void> createUser() async {
      final navigator = Navigator.of(context);
      final messanger = ScaffoldMessenger.of(context);

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
              'role': 'customer',
              'email': mail.text.trim(),
            });

        navigator.pop();
        var msg = SnackBar(
          content: Text(
            'Username succesfully added to the DataBase you may login now',
          ),
        );
        messanger.showSnackBar(msg);
        navigator.pop();
      } on FirebaseAuthException catch (e) {
        navigator.pop();
        var msg = SnackBar(content: Text(e.message.toString()));
        messanger.showSnackBar(msg);
      } catch (e) {
        navigator.pop();
        messanger.showSnackBar(
          SnackBar(content: Text('An error occurred: ${e.toString()}')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('New Customer SignUP'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  }

                  password2.clear();
                  password.clear();
                  mail.clear();
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontFamily: 'Heading',
                    fontWeight: FontWeight.bold,
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
