import 'login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(): super(LoginState.initial());

  void updateEmail(String value) {
    emit(state.copyWith(
      email: value,
      errorMessage: null, // clear old errors
    ));
  }

  void updatePassword(String value) {
    emit(state.copyWith(
      password: value,
      errorMessage: null,
    ));
  }

  Future<void> submitLogin() async {
    // 1. validation
    if (state.email.isEmpty || state.password.isEmpty){
      emit(state.copyWith(
        errorMessage: "Email and password cannot be empty",
      ));
      return;
    }

    if (!state.email.contains("@")){
      emit(state.copyWith(errorMessage: "Invalid email format"));
      return;
    }

    // 2. Start loading
    emit(state.copyWith(isLoading: true, errorMessage: null));

    // Simulated API delay
    await Future.delayed(Duration(seconds: 2));

    // 3. Fake login logic
    if (state.email == "test@gmail.com" && state.password == "password") {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: null,
      ));

      // TODO: success action
      // e.g., navigation
    } else {
      // 4. Wrong credentials
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Wrong email or password",
      ));
    }
  }
}