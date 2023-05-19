import 'package:flutter/material.dart';
import 'package:sing_in_page/Screen/Model/login_model.dart';
import 'package:sing_in_page/Screen/utils/Shared_pref.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {

  dynamic? option;

  @override
  void initState() {
    super.initState();

  }

  Future<void> Outdata()
  async {
    SharedPref shr = SharedPref();
    option = await shr.Getdata();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 1),
      () async {
        Outdata();
        option==true
            ? Navigator.pushReplacementNamed(context, 'home')
            : Navigator.pushReplacementNamed(context, 'signin');
      },
    );
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff0059e5),
          body: Center(
              child: Image.network(
                  "https://img.freepik.com/free-vector/cyber-data-security-online-concept-illustration-internet-security-information-privacy-protection_1150-37328.jpg?w=740&t=st=1684137980~exp=1684138580~hmac=c8ed92a8c32e32b49dac905fa2d6968dd5fea270ae9c47545df21d604c20e096"))),
    );
  }
}
