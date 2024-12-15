import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> LoginUser({required String email , required String password}) async {
  emit(LoginLoading());
      try {
        
  await FirebaseAuth.instance.signInWithEmailAndPassword(email:email, password: password);
  emit(LoginSuccess(errMessage:'Login Successfully'));

} on FirebaseAuthException catch (e){
  emit(LoginFailure(errMessage:'Faild with error code : ${e.code}'));
}
  }
}
