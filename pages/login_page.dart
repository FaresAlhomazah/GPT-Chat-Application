import 'package:chat_app/constants.dart';
import 'package:chat_app/help_me/show_snack_bar.dart';
import 'package:chat_app/pages/SignUp_page.dart';
import 'package:chat_app/pages/Users_Page.dart';
import 'package:chat_app/pages/cubits/login_cubit/login_cubit.dart';
// import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widgets/custom_button.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// import 'package:firebase_core/firebase_core.dart';



// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  static String id = 'LoginPage';
  String? email, password;
  bool isLoding = false;

  @override 
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context, state) {
        if(state is LoginLoading)
        {
          isLoding=true;
        }
        
        else if(state is LoginSuccess)
        {
          ShowSnackBar(context,state.errMessage,const Color.fromARGB(255, 101, 252, 106));
          Navigator.pushNamed(context,UsersPage.id ,arguments: {
                                '_email': email,
                              },);
                              isLoding=false;
        }
        else if(state is LoginFailure){
          ShowSnackBar(context,state.errMessage,Colors.red);
          isLoding=false;
        }
      },
      builder:(context,state)=> ModalProgressHUD(
        inAsyncCall: isLoding,
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          // backgroundColor: Color.fromRGBO(8, 114, 194, 1),
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Image.asset(
                    kLogoPath,
                    height: 180,
                    width: 120,
                    alignment: Alignment.center,
                  ),
                  Text(
                    kChatName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico'),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(15, 60, 0, 15),
                      alignment: Alignment.topLeft,
                      child: Text("Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left)),
                  CustomTextFormField(
                    hintText: 'Email',
                    FieldIcon: Icon(Icons.email),
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                  CustomTextFormField(
                    hintText: 'PassWord',
                    FieldIcon: Icon(Icons.lock_outline),
                    onChanged: (data) {
                      password = data;
                    },
                    obsecureText: true,
                  ),
                  CustomButton(
                      ButtonText: 'Login',
                      onPressed: () async {
                        isLoding = true;
                        if (formKey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context).LoginUser(email: email!, password: password!);
                      }}),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "don't hava an account ?  ",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SignUpPage.id);
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 3, 230, 255),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )
      
    );
  }

  Future<void> LoginUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
