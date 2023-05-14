import 'package:flutter/material.dart';

import '../input_widgets/add_text_form_field.dart';


class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _key = TextEditingController();
  final _secret = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child:Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 80.0),
                Center(child: Image.asset("assets/images/login.jpg")),
                const SizedBox(height: 20.0),

                GetTextFormField(
                  controller: _key,
                  hintText: "API Key",
                  icon: Icons.key,
                ),
                // Container(
                //   margin: const EdgeInsets.only(top:20.0, left: 20.0, right:20.0, bottom: 5.0 ),
                //   child: TextFormField(
                //     obscureText: false,
                //     decoration: const InputDecoration(
                //       hintText: "API Key",
                //       prefixIcon: Icon(Icons.key),
                //     ),
                //   ),
                // ),
                GetTextFormField(
                  controller: _secret,
                  hintText: "API Secret",
                  icon: Icons.security
                ),
                // Container(
                //   margin: const EdgeInsets.only(top:20.0, left: 20.0, right:20.0, bottom: 5.0 ),
                //   child: TextFormField(
                //     obscureText: false,
                //     decoration: const InputDecoration(
                //       hintText: "API Secret",
                //       prefixIcon: Icon(Icons.security),

                //     ),
                //   ),
                // ),

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
          ),
        ),
      );
  }

  void buttonClick() {
    print("~~~~~~~~Button Clicked~~~~~~~~~");
  }
}