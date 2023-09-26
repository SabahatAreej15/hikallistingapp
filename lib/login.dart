import 'package:flutter/material.dart';
import 'package:realestate/screens/home.dart';
import 'package:realestate/screens/register.dart';

import 'theme/theme.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Method of Controllers
  // printController() {
  //   print(_emailTextController.text + _passwordTextController.text);
  // }

// var for controller
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          dark ? CustomAppTheme().colorBlack : CustomAppTheme().creamLight,
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 0.6,
                // BACKGROUND IMAGE
                image:
                    AssetImage(dark ? "assets/dark.jpg" : "assets/white.jpg"),
                fit: BoxFit.cover),
          ),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // LOGO
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              dark
                                  ? 'assets/hikallogo.png'
                                  : 'assets/fullLogoRE.png',
                              width: 120,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // FIRST TEXT FIELD
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Email",
                                style: TextStyle(
                                    color: dark
                                        ? CustomAppTheme().colorWhite
                                        : CustomAppTheme().colorBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          TextFormField(
                            style: TextStyle(
                                color: dark
                                    ? CustomAppTheme().colorWhite
                                    : CustomAppTheme().colorBlack),
                            controller: _emailTextController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: CustomAppTheme().colorGrey)),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 17),
                              filled: true,
                              fillColor: dark
                                  ? CustomAppTheme().colorBlack.withOpacity(0.4)
                                  : CustomAppTheme()
                                      .colorWhite
                                      .withOpacity(0.7),
                              hintText: 'hikal@gmail.com',
                              hintStyle:
                                  TextStyle(color: CustomAppTheme().colorGrey),
                              prefixIcon: Icon(
                                Icons.mail,
                                size: 18,
                                color: CustomAppTheme().redBright,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter email';
                              } else if (!RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                  .hasMatch(value)) {
                                return 'Please enter valid email';
                              } else {
                                return null;
                              }
                            },
                          ),
                          // SECOND TEXTFIELD
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    color: dark
                                        ? CustomAppTheme().colorWhite
                                        : CustomAppTheme().colorBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          TextFormField(
                            style: TextStyle(
                                color: dark
                                    ? CustomAppTheme().colorWhite
                                    : CustomAppTheme().colorBlack),
                            controller: _passwordTextController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: CustomAppTheme().colorGrey)),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 17),
                              filled: true,
                              fillColor: dark
                                  ? CustomAppTheme().colorBlack.withOpacity(0.4)
                                  : CustomAppTheme()
                                      .colorWhite
                                      .withOpacity(0.7),
                              hintText: '*******',
                              hintStyle:
                                  TextStyle(color: CustomAppTheme().colorGrey),
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 18,
                                color: CustomAppTheme().redBright,
                              ),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'password is empty';
                              }

                              return null;
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: InkWell(
                              onTap: () {
                                if (formkey.currentState!.validate()) {
                                  //printController();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                  );
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: CustomAppTheme().redBright,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                alignment: Alignment.center,
                                height: 44,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.login_outlined,
                                      color: CustomAppTheme().colorWhite,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Login",
                                      style: TextStyle(
                                        color: CustomAppTheme().colorWhite,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()),
                                    );
                                  },
                                  child: Text(
                                    "I don't an account?",
                                    style: TextStyle(
                                        color: CustomAppTheme().redBright),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
