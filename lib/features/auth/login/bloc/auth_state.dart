import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSignedIn extends AuthState {
  final User user;
  AuthSignedIn(this.user);
}

class AuthSignedOut extends AuthState {}


class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}

class AuthLoading extends AuthState {}

