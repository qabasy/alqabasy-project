import 'package:app/dialogs/dialog.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const route = "/";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      final sizedBoxHeight = 3.0.h;
      return Scaffold(
          appBar: AppBar(
            title: const Text('AL-Qabasy Project'),
            elevation: 5,
            shadowColor: Colors.black,
            leading: const Icon(
              Icons.auto_awesome,
            ),
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 80.w,
                  height: 100.h,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                    Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.w900,
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
                                      },
                                    ),
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
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16.0 * 2),
                                    Align(
                                      child: ElevatedButton(
                                        autofocus: true,
                                        onPressed: () {
                                          if (_formKey.currentState?.validate() ?? false) {
                                            Navigator.pushNamed(context, "/home");
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
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
                                          DialogManager.showInfoDialog(context, "Forgot Password?", "Please Contact Your Admin.");
                                        },
                                        child: const Text('Forgot Password?'),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0 * 2),
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
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.all(16),
              //     child: Consumer<ThemeNotifier>(
              //       builder: (context, themeNotifier, child) {
              //         return Row(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: [
              //             // Text('Light'),
              //             Consumer<ThemeNotifier>(
              //               builder: (context, themeNotifier, child) {
              //                 return ElevatedButton(
              //                   style: ButtonStyle(),
              //                   onPressed: () {
              //                     themeNotifier.toggleTheme();
              //                   },
              //                   child: Padding(
              //                     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              //                     child: Icon((themeNotifier.isDarkTheme ? Icons.light_mode_sharp : Icons.dark_mode_rounded)),
              //                   ),
              //                 );
              //                 // return Switch(
              //                 //   value: themeNotifier.isDarkTheme,
              //                 //   onChanged: (value) {
              //                 //     themeNotifier.toggleTheme();
              //                 //   },
              //                 // );
              //               },
              //             ),
              //             // Text('Dark'),
              //           ],
              //         );
              //       },
              //     ),
              //   ),
              // ),
              // ),
              // ),
            ],
          ));
    });
  }
}
