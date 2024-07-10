import 'package:fitfind/screens/auth/email_password_form.dart';
import 'package:flutter/material.dart';
import "../../widgets/custom_button.dart";
import "../../navigators/navigator.dart";

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool showLogo = true;
  bool showForm = false;
  bool isLoginForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash-bg.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.0),
                  Colors.white.withOpacity(0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    top: !showLogo ? MediaQuery.of(context).size.height : 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 500,
                          height: 150,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 50),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomButton(
                                        label: 'Register',
                                        labelColor: Colors.lime,
                                        backgroundColor: Colors.black,
                                        borderRadius: 24,
                                        onPressed: () {
                                          setState(() {
                                            showLogo = false;
                                          });
                                          Future.delayed(
                                              const Duration(milliseconds: 300),
                                              () {
                                            setState(() {
                                              showForm = true;
                                              isLoginForm = false;
                                            });
                                          });
                                        }),
                                    const SizedBox(width: 20),
                                    CustomButton(
                                        label: 'Login',
                                        labelColor: Colors.black,
                                        backgroundColor: Colors.lime,
                                        borderRadius: 24,
                                        onPressed: () {
                                          setState(() {
                                            showLogo = false;
                                          });
                                          Future.delayed(
                                              const Duration(milliseconds: 300),
                                              () {
                                            setState(() {
                                              showForm = true;
                                              isLoginForm = true;
                                            });
                                          });
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    top: showForm ? 0 : MediaQuery.of(context).size.height,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          EmailPasswordForm(
                            onPressBack: () {
                              setState(() {
                                showForm = false;
                              });
                              Future.delayed(const Duration(milliseconds: 300),
                                  () {
                                setState(() {
                                  showLogo = true;
                                });
                              });
                            },
                            submitButtonText:
                                isLoginForm ? "Login" : "Register",
                            onSubmit: (email, password) => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NavigatorBar()),
                              )
                            },
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
