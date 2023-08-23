import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<LoginScreen> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKey,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    final data = value ?? "";
                    if (data.isEmpty) {
                      return "Please Enter pasword";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Please Enter password",
                    labelText: "password",
                    border: OutlineInputBorder(),
                    // helperText: "type any values"
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    final data = value ?? "";
                    if (data.isEmpty) {
                      return "Please Enter Email";
                    } else {
                      return null;
                    }
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                    // suffixIcon: Icon(Icons.visibility),
                    hintText: "Please Enter Name",
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    //   helperText: "type any values"
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    final isValidate = _formKey.currentState!.validate();
                    if (isValidate) {
                      print("form is validate");
                      // Navigator.pushNamed(context, "/Todo+ListView");
                      sigInTheUser();
                    } else {
                      print("form not validate");
                    }

                    print("login action");
                  },
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Sign In the user",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }

  void sigInTheUser() async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
          
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      } else if (e.code == "wrong-password") {
        print("wrong password provided for that user");
      }
      print(e.code);
    }
  }
}
/*

Authentication



sign up -> email and password
sign in -> email and password;


 */
