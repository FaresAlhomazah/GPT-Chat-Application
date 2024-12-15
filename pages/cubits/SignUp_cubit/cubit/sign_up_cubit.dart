import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

    Future<void> SignUpUser({required email,required password}) async {
      emit(SignUpLodind());
     try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email:email, password: password);
        
        emit(SignUpSuccess(errMessage:'Login Successfully'));

     }  on FirebaseAuthException catch (e){
  emit(SignUpFailure(errMessage:'Faild with error code : ${e.code}'));
}     
  }
}


