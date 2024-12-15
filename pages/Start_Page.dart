import 'package:chat_app/constants.dart';
// import 'package:chat_app/help_me/show_snack_bar.dart';
// import 'package:chat_app/pages/Users_Page.dart';
import 'package:chat_app/pages/SignUp_page.dart';
// import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_page.dart';
// import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widgets/custom_button.dart';

// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class StartPage extends StatelessWidget {
  const StartPage({super.key});
  static String id = 'StartPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
         children: [
                Padding(
                  padding: const EdgeInsets.only(top:30 ,bottom:20 ),
                  child: Image.asset(kLogoPath, height: 200 ,width: 160, alignment: Alignment.center,),
                ),
                Text(
                  "Welcome to GPT Chat",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico' ),textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:35),
                  child: CustomButton(ButtonText:'Sign Up',onPressed: () =>Navigator.pushNamed(context,SignUpPage.id) ,hightOfBut: 70),
                ),

                 CustomButton(ButtonText: 'Login',hightOfBut: 70,onPressed: () =>Navigator.pushNamed(context,LoginPage.id),),

                //  CustomButton(ButtonText: 'users ',hightOfBut: 70,onPressed: () =>Navigator.pushNamed(context,UsersPage.id),),


         ]
      ),
    );
  }
}