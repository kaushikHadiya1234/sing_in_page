import 'package:flutter/material.dart';
import 'package:sing_in_page/Screen/Model/login_model.dart';
import 'package:sing_in_page/Screen/utils/Shared_pref.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Welcome back, Login\nfor Continue",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Container(
                      height: 200,
                      width: 300,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.fill,
                      )),
                ),
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
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey)),
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
                      if (value!.length >= 8) {
                        return "Enter Attlist 8 digit";
                      }
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey)),
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
                                    color: Colors.grey.shade300, width: 2)),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Remember Me",
                            style: TextStyle(color: Colors.grey),
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
                SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    if (txtkey.currentState!.validate()) {

                      String? email=txtmail.text;
                      String? pw=txtpw.text;

                      SharedPref shr = SharedPref();
                      loginModel l=await shr.Getdata();
                      if(l.mail==email && l.pw==pw)
                        {
                          Navigator.pushReplacementNamed(context, "home");
                        }
                      else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incorrect email & password"),behavior: SnackBarBehavior.floating,));
                        }

                    }
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Colors.grey,
                          Colors.red,
                        ])),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(alignment: Alignment.center,child: Text("Don't have account ? ")),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "signup");
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey)
                      ),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
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
