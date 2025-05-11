import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadUserProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          emit(ProfileLoaded(user));
        } else {
          emit(ProfileError("User not logged in"));
        }
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });
  }
}
