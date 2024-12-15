part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

// ignore: must_be_immutable
final class SignUpSuccess extends SignUpState {
    String errMessage;
  SignUpSuccess({required this.errMessage});
}
final class SignUpLodind extends SignUpState {} 

// ignore: must_be_immutable
final class SignUpFailure extends SignUpState {
  String errMessage;
  
  SignUpFailure({required this.errMessage});
}




