// import 'package:chat_app/pages/Users_Page.dart';
import 'package:chat_app/pages/SignUp_Page.dart';
import 'package:chat_app/pages/Start_Page.dart';
import 'package:chat_app/pages/Users_Page.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/cubits/SignUp_cubit/cubit/sign_up_cubit.dart';
// import 'package:chat_app/pages/cubits/chat_cubit/cubit/chat_cubit.dart';
import 'package:chat_app/pages/cubits/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';

// fire base library
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const chat());
}

class chat extends StatelessWidget {
  const chat({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider( 
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        //  BlocProvider(create: (context)=> ChatCubit())
      ],
      child: MaterialApp(
        routes: {
          LoginPage.id: (context) => LoginPage(),
          SignUpPage.id: (context) => SignUpPage(),
          ChatPage.id: (context) => ChatPage(),
          UsersPage.id: (context) => UsersPage(),
          StartPage.id: (context) => StartPage(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: StartPage.id,
      ),
    );
  }
}
