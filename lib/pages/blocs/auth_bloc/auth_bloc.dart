import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      if (event is LoginEvent) {
        Future<void> loginUser({
          required String email,
          required String password,
        }) async {
          emit(LoginLoading());
          try {
            UserCredential user = await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: email, password: password);
            emit(LoginSuccess());
          } on FirebaseAuthException catch (ex) {
            if (ex.code == 'user-not-found') {
              emit(LoginFailure(errMessage: "No user found for that email"));
            } else if (ex.code == 'wrong-password') {
              emit(
                LoginFailure(
                  errMessage: "Wrong password provided for that user.",
                ),
              );
            }
          } catch (e) {
            emit(LoginFailure(errMessage: "Something Went Wrong"));
          }
        }
      } else if (event is RegisterEvent) {
        Future<void> registerMethod({
          required String email,
          required String password,
        }) async {
          emit(RegisterLoading());
          try {
            UserCredential user = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );
            emit(RegisterSuccess());
          } on FirebaseAuthException catch (ex) {
            if (ex.code == 'weak-password') {
              emit(RegisterFauilre(errMessage: "weak-password"));
            } else if (ex.code == 'email-already-in-use') {
              emit(RegisterFauilre(errMessage: "email-already-in-use"));
            }
          } catch (e) {
            emit(RegisterFauilre(errMessage: "Something Went Wrong"));
          }
        }
      }
    });
  }
}
