import 'package:flutter/material.dart';
import 'package:zoom_campus/auth/signup.dart';
import 'package:zoom_campus/bottomNavigation/bottomNavigation.dart';
import 'package:zoom_campus/widgets/input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool rememberme = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 350,
                      child: Image.asset('assets/images/logo.png')),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  const Text(
                    'Zoom to campus Swiftly',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 20),
                      margin: const EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height / 1.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Login Account',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(
                            height: 40,
                            child: Input(
                                hintText: 'Email', icon: Icons.email_outlined),
                          ),
                          const SizedBox(height: 16),
                          const SizedBox(
                            height: 40,
                            child: Input(
                              hintText: 'password',
                              icon: Icons.lock,
                              isObscure: true,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SwitchListTile.adaptive(
                            contentPadding: const EdgeInsets.all(0),
                            value: rememberme,
                            onChanged: (bool value) {
                              setState(() {
                                rememberme = value;
                              });
                            },
                            title: const Text('Remember Me',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(31)),
                            height: 40,
                            color: Colors.green,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BottomNavigation()));
                            },
                            child: const Text(
                              'LOG IN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          const Divider(),
                          const Spacer(),
                          Row(
                            children: [
                              const Text(
                                'Don\'t have an account? ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUp()));
                                },
                                child: const Text(
                                  'SignUp',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
