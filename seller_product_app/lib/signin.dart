import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({ Key? key }) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text('Log-In'),
            ),
            Container(
              child: Text('ID'),
            ),
            Container(
              child: TextField(),
            ),
            Container(
              child: Text('PW'),
            ),
            Container(
              child: TextField(),
            ),
            Container(
              child: ElevatedButton(
                child: Text('Login'),
                onPressed: (){}),
            )
          ]
        ),
      ),
    );
  }
}