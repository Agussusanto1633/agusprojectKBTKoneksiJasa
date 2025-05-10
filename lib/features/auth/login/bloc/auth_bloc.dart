import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthBloc() : super(AuthInitial()) {
    on<AuthSignInWithGoogle>((event, emit) async {
      // Emit loading state sebelum proses login
      emit(AuthLoading());

      try {
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          // Jika user membatalkan login
          emit(AuthError('User cancelled the login'));
          return;
        }
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

        emit(AuthSignedIn(userCredential.user!)); // Emit signed in state jika berhasil
      } catch (e) {
        emit(AuthError(e.toString())); // Emit error jika terjadi masalah
      }
    });

    on<AuthSignOut>((event, emit) async {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
      emit(AuthSignedOut());
    });
  }
}
