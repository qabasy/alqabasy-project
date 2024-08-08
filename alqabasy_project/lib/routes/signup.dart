import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignupPage extends StatelessWidget {
  final sizedBoxHeight = 2.h, borderRadius = 16;
  static const route = "/signup";
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Signup Form'),
        ),
        // backgroundColor: Colors.red,
        body: Center(
          child: Container(
            width: (deviceType == DeviceType.windows ? 50.w : 90.w),
            height: 100.h,
            // height: 100.h,
            alignment: Alignment.center,

            decoration: const BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Card(
                    shadowColor: Colors.lightGreenAccent,
                    borderOnForeground: true,
                    elevation: 10,
                    // surfaceTintColor: Colors.red,
                    // margin: EdgeInsets.all(0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            heightFactor: 2,
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  decoration: TextDecoration.combine([TextDecoration.overline, TextDecoration.lineThrough, TextDecoration.underline]),
                                  // backgroundColor: Colors.red,
                                  color: Colors.amber,
                                  fontSize: 10.sp),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              prefixIcon: const Icon(Icons.person),
                            ),
                          ),
                          SizedBox(height: sizedBoxHeight),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              prefixIcon: const Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: sizedBoxHeight),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              prefixIcon: const Icon(Icons.lock),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: sizedBoxHeight),
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Implement signup logic
                            },
                            style: ElevatedButton.styleFrom(
                              // visualDensity: VisualDensity(horizontal: 1),
                              // maximumSize: Size(50.w, 100),
                              // padding:
                              // const EdgeInsets.symmetric(vertical: 16.0),
                              backgroundColor: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text(
                              'Sign Up',
                              textWidthBasis: TextWidthBasis.parent,
                            ),
                          ),

                          // SizedBox(height: sizedBoxHeight),
                          // SizedBox(height: sizedBoxHeight),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account?'),
                              const SizedBox(width: 4.0),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/signing");
                                },
                                style: TextButton.styleFrom(
                                    //   primary: Colors.blue,
                                    ),
                                child: const Text('Sign In'),
                              ),
                            ],
                          ),
                        ],
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
