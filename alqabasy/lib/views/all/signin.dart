  import 'package:flutter/foundation.dart';
  import 'package:flutter/material.dart';
  // import 'package:responsive_sizer/responsive_sizer.dart';
  import 'package:sizer/sizer.dart';

  class SignInView extends StatefulWidget {
    const SignInView({super.key});
    static const route = "/";

    @override
    _SignInViewState createState() => _SignInViewState();
  }

  class _SignInViewState extends State<SignInView> {
    final sizedBoxHeight = 2.h, borderRadius = 16;
    final _formKey = GlobalKey<FormState>();
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
      if (kDebugMode) {
        print("Sizer(width=${SizerUtil.width}, height=${SizerUtil.height}, other=${SizerUtil.boxConstraints})");
      }
      return Sizer(builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('AL-Qabasy Project'),
            elevation: 5,
            shadowColor: Colors.black,
            leading: const Icon(
              Icons.auto_awesome,
            ),
          ),
          body: Align(
            alignment: Alignment.center,
            child: SizedBox(
              // height: 100.h,
              // width: 100.w,
              // height: 100.h,

              child: Form(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Center(
                    child: SizedBox(
                      child: Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(35),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0),
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
                                          // Navigator.push(context, "/home");
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
            ),
          ),
        );
      });
    }
  }
