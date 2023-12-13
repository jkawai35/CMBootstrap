import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'todo_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 50,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text('Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 10),
                  child: TextField(
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 50, bottom: 50, left: 10, right: 10),
                    child: ElevatedButton(
                      child: Text('Login'),
                      onPressed: () {
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text, password: passwordController.text).then((value) {
                              print("Successful login!");
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ToDo(title: "Grocery Page",)),
                              );
                        }).catchError((error) {
                          print("Failed to login");
                          print(error.toString());
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 50, bottom: 40, left: 50, right: 50),
                    child: ElevatedButton(
                      child: Text('Signup'),
                      onPressed: () {
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: emailController.text, password: passwordController.text).then((value){
                              print("Signed up user");
                        }).catchError((error) {
                          print("Failed to sign up user");
                          print(error.toString());
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}