part of 'login_cubit.dart';


sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginSuccess extends LoginState {
  
  String errMessage;
  LoginSuccess({required this.errMessage});
} 
final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  String errMessage;
  LoginFailure({required this.errMessage});
}
 
