import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class LoginCubit extends Cubit<RegisterState> {
  LoginCubit() : super(RegisterInitial());
}
