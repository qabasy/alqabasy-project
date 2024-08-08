// ignore_for_file: prefer_const_constructors

import 'package:alqabasy_project/models/database.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const route = "/";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final sizedBoxHeight = 2.h, borderRadius = 16;
  final DatabaseService _databaseService = DatabaseService();
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _databaseService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('AL-Qabasy Project'),
          elevation: 5,
          shadowColor: Colors.black,
          leading: Icon(
            Icons.auto_awesome,
          ),
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Center(
              child: SizedBox(
                width: (deviceType == DeviceType.windows ? 50.w : 100.w),
                height: 100.h,
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            // textDirection: TextDecoration(),

                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            // textBaseline: TextBaseline.alphabetic,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        // backgroundColor: Colors.red,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                              SizedBox(height: sizedBoxHeight * 2),
                              TextFormField(
                                  controller: _usernameController,
                                  decoration: InputDecoration(
                                    labelText: 'Username',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    prefixIcon: const Icon(Icons.person),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your username';
                                    }
                                    return null;
                                  }),
                              // SizedBox(height: sizedBoxHeight),
                              SizedBox(height: sizedBoxHeight),
                              TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  prefixIcon: const Icon(Icons.lock),
                                ),
                                obscureText: true,
                              ),
                              const SizedBox(height: 16.0),
                              Align(
                                // widthFactor: 10,
                                child: ElevatedButton(
                                  autofocus: true,
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/home");
                                    // }
                                    // });

                                    // Navigator.pushNamed(context, "/home");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    // visualDensity: VisualDensity(vertical: .1),
                                    elevation: 8,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 35,
                                    ),

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),

                              SizedBox(height: sizedBoxHeight),
                              Align(
                                alignment: Alignment.center,
                                child: TextButton(
                                  onPressed: () {
                                    // TODO: Implement forgot password logic
                                  },
                                  style: TextButton.styleFrom(
                                      // primary: Colors.blue,
                                      ),
                                  child: const Text('Forgot Password?'),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
