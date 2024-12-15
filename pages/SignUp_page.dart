import 'package:chat_app/constants.dart';
import 'package:chat_app/help_me/show_snack_bar.dart';
import 'package:chat_app/pages/Users_Page.dart';
import 'package:chat_app/pages/cubits/SignUp_cubit/cubit/sign_up_cubit.dart';
//import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';

// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 
'package:flutter/material.dart';
import 'package:chat_app/widgets/custom_button.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  static String id = 'SignUpPage';

  String? email, password, user;
  CollectionReference users =
      FirebaseFirestore.instance.collection(kUsersCollections);
      
//GlobalKey <FormState> formKey =GlobalKey() ;
  final formKey = GlobalKey<FormState>();

  bool isLoding = false;
  bool isSign = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
          if(state is SignUpLodind)
        {
          isLoding=true;
        }
        else if(state is SignUpSuccess) 
        {
          ShowSnackBar(context,state.errMessage,const Color.fromARGB(255, 101, 252, 106));
          Navigator.pushNamed(context,UsersPage.id ,arguments: {
                                '_email': email,
                              },);         
                                users.add({
                                kUserName: user,
                                kEmail: email,
                                kPassWord: password
                              });                       
                              isLoding=false;
                              isSign=true;
                              
        }
        else if(state is SignUpFailure){
          ShowSnackBar(context,state.errMessage,Colors.red);
          isLoding=false;
        }
      },
      builder: (context, state) =>
         ModalProgressHUD(
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
                        child: Text("Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left)),

                    CustomTextFormField(
                      hintText: 'User Name',
                      FieldIcon: Icon(Icons.person_2_sharp),
                      onChanged: (data) {
                        user = data;
                      },
                    ),
                    CustomTextFormField(
                      hintText: 'Email',
                      FieldIcon: Icon(Icons.email),
                      onChanged: (data) {
                        email = data;
                      },
                    ),
                    CustomTextFormField(
                      hintText: 'PassWord',
                      FieldIcon: Icon(Icons.lock_outlined),
                      onChanged: (data) {
                        password = data;
                      },
                      obsecureText: true,
                    ),

                    // CustomButton(ButtonText: 'users ',hightOfBut: 70,onPressed: () =>Navigator.pushNamed(context,UsersPage.id),),

                    CustomButton(
                        ButtonText: 'Sign up',
                        onPressed: () async {
                          isLoding = true;
                          if (formKey.currentState!.validate()) {

                              BlocProvider.of<SignUpCubit>(context).SignUpUser(email: email!, password: password!);
                              
                              if(isSign){
                              //  users.add({
                              //   kUserName: user,
                              //   kEmail: email,
                              //   kPassWord: password
                              // });
                              }
                        }}),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "already hava an account ?   ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context, LoginPage.id);
                            },
                            child: Text(
                              "Login",
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
        ),
 
    );
  }

  // Future<void> SignUpUser() async {
  //   await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email!, password: password!);
  // }

  // void SaveForm() {
  //   final isValid = formKey.currentState!.validate();
  //   if (!isValid) {
  //     return null;
  //   }
  //   formKey.currentState!.save();
  // }
}
