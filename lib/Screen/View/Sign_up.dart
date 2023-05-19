import 'package:flutter/material.dart';
import 'package:sing_in_page/Screen/Model/login_model.dart';
import 'package:sing_in_page/Screen/utils/Shared_pref.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController txtmail = TextEditingController();
  TextEditingController txtpw = TextEditingController();

  var txtkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: txtkey,
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    color: Colors.red,
                    child: Container(
                      height: 550,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(180),
                            bottomRight: Radius.circular(180)),
                        image: DecorationImage(
                          image: AssetImage("assets/images/bg.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 160,
                              width: 160,
                              child: Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.fill,
                          )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: txtmail,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Email';
                                }
                              },
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.black)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.black)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.black)),
                                label: Text("Email"),
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.orange[900],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: txtpw,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter password';
                                }
                                // if (value!.length > 8) {
                                //   return "Enter Attlist 8 digit";
                                // }
                              },
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.black)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.black)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.black)),
                                label: Text("Password"),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.orange[900],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 13,
                                      width: 13,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 2)),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Remember Me",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Text(
                                  "Forget Password ?",
                                  style: TextStyle(color: Color(0xff8E3E3E)),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 30,),
                          InkWell(
                            onTap: () async {
                              if (txtkey.currentState!.validate()) {
                                String? email = txtmail.text;
                                String? password = txtpw.text;

                                SharedPref shr = SharedPref();

                                shr.Setdata(email: '$email', password: '$password',login: true);

                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sucessfully Sign up"),behavior: SnackBarBehavior.floating,));

                                Navigator.pushReplacementNamed(context, "/");
                              }
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 30, right: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(colors: [
                                    Colors.grey,
                                    Colors.red,
                                  ])),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0,0.7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/google.png"))),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/face.png"))),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/images/apple.png"),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do you have account?",style: TextStyle(color: Colors.black,fontSize: 15),),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "signin");
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(color: Colors.grey,fontSize: 15),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
