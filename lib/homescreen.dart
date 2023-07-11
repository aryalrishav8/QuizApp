import 'package:flutter/material.dart';
import 'mainhome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController _pass1 = TextEditingController();

  String uname = '';
  String pass = '';

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Sign Up",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Create an account, its free.",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Username"),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            //labelText: 'Name',
                            hintText: 'Enter your username',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    width: 10.0, color: Colors.black)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "field cannot be empty";
                            } else {
                              uname = value;
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text("Email"),
                        const SizedBox(height: 4),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            //labelText: 'Email',
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text("Password"),
                        const SizedBox(height: 4),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            //labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "field cannot be empty";
                            } else {
                              pass = value;
                              return null;
                            }
                          },
                          controller: _pass1,
                        ),
                        const SizedBox(height: 20),
                        Text("Confirm Password"),
                        SizedBox(height: 4),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            //labelText: 'Password',
                            hintText: 'Re enter your password',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "field cannot be empty";
                            } else if (value != pass) {
                              return "Does not match with password";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          "Login successful, redirecting you to home page, $uname"),
                                    ));
                                    Future.delayed(Duration(seconds: 1), () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MyHome(name: uname),
                                          ));
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Something wrong"),
                                    ));
                                  }
                                },
                                child: Text("Sign up"))),
                        const SizedBox(height: 25),
                        Row(children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: const Text("Sign in"),
                          )
                        ]),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
