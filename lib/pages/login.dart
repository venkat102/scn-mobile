import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({super.key});


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child:Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 80.0),
            Center(child: Image.asset("assets/images/login.jpg")),
            const SizedBox(height: 20.0),

            Container(
              margin: const EdgeInsets.only(top:20.0, left: 20.0, right:20.0, bottom: 5.0 ),
              child: TextFormField(
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: "API Key",
                  prefixIcon: Icon(Icons.key),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top:20.0, left: 20.0, right:20.0, bottom: 5.0 ),
              child: TextFormField(
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: "API Secret",
                  prefixIcon: Icon(Icons.security),

                ),
              ),
            ),

            const SizedBox(height: 30.0),
            Container(
              margin: const EdgeInsets.all(30.0),
              width: double.infinity,
              child: TextButton(onPressed: buttonClick,
                child: Text("Login", style: TextStyle(color: Colors.white),)),
              decoration:  BoxDecoration(
                color: Color(0xFF153b72),
                borderRadius: BorderRadius.circular(30.0)
              ),
              ),
          ],
        ),
      )
,
        ),
      );
  }

  void buttonClick() {
    print("~~~~~~~~Button Clicked~~~~~~~~~");
  }
}