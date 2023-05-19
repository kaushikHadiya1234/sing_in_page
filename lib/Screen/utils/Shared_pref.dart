
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sing_in_page/Screen/Model/login_model.dart';

class SharedPref
{
   Future<void> Setdata({required String email, required String password,bool? login})
   async {
     SharedPreferences shr = await SharedPreferences.getInstance();
     shr.setString("email",email);
     shr.setString("password",password);
     shr.setBool('login', login!);
   }

   Future<loginModel> Getdata()
   async {
     SharedPreferences shr = await SharedPreferences.getInstance();
     String? email=shr.getString("email");
     String? password=shr.getString("password");
     bool? login=shr.getBool("login");
     loginModel l=loginModel(mail: email,option: login,pw: password);
     return l;
   }
}