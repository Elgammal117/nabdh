import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabdh/Core/Features/Auth/Data/Repo/AutRepo.dart';
import 'package:nabdh/Core/Features/Auth/Presentation/Cubit/LoginCubit/LoginState.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInital());
  static SigninCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();

  Future<bool> resendOtp({required String email, required String type}) async {
    final AuthRepo authRepo = AuthRepo();
    final result = await authRepo.emailotpsend(role: type, email: email);

    return result.fold((_) => false, (_) => true);
  }

  Future<bool> signinlogic() async {
    print("2");
    emit(Loading());
    try {
      return await resendOtp(email: emailController.text, type: type);
    } finally {
      if (!isClosed) {
        emit(SigninInital());
      }
    }
  }

  String type = 'PATIENT';

  void setType(String newType) {
    type = newType;
    emit(SelectedType()); // Emit a new state to trigger UI update
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
