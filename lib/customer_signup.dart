import 'package:flutter/material.dart';

class CustomerSignUpPage extends StatelessWidget {
  const CustomerSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var username = TextEditingController();
    var password = TextEditingController();
    var password2 = TextEditingController();
    var mail = TextEditingController();
    var num = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('New Customer SignUP'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: username,
                decoration: InputDecoration(
                  hintText: 'UserName',
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
              TextField(
                controller: num,
                decoration: InputDecoration(
                  hintText: 'Phone number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  var u = username.text;
                  var p = password.text;
                  var p2 = password2.text;
                  var e = mail.text;
                  var n = num.text;
                  if (u.isEmpty ||
                      p.isEmpty ||
                      p2.isEmpty ||
                      e.isEmpty ||
                      n.isEmpty) {
                    var msg = SnackBar(
                      content: Text('Please fill all the fields'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(msg);
                  } else if (p != p2) {
                    var msg = SnackBar(content: Text('Passwords do not match'));
                    ScaffoldMessenger.of(context).showSnackBar(msg);
                  } else {
                    var msg = SnackBar(
                      content: Text(
                        'Username succesfully added to the DataBase you may login now',
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(msg);
                    Navigator.pop(context);
                  }

                  username.clear();
                  password2.clear();
                  password.clear();
                  mail.clear();
                  num.clear();
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
