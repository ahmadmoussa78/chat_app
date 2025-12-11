import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class LoginCubit extends Cubit<RegisterState> {
  LoginCubit() : super(RegisterInitial());

  Future<void> registerMethod({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
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
