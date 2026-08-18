import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabdh/Core/Features/Auth/Data/Repo/AutRepo.dart';
import 'package:nabdh/Core/Features/Auth/Presentation/Cubit/LoginCubit/LoginState.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInital());
  static SigninCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();

  // ── OTP fields ──
  static const int otpLength = 6;
  static const int resendSeconds = 60;

  final List<TextEditingController> otpControllers = List.generate(
    otpLength,
    (_) => TextEditingController(),
  );
  final List<FocusNode> otpFocusNodes = List.generate(
    otpLength,
    (_) => FocusNode(),
  );

  int secondsLeft = resendSeconds;
  Timer? _timer;

  String get formattedTime {
    final minutes = (secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsLeft % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void startTimer() {
    _timer?.cancel();
    secondsLeft = resendSeconds;
    emit(OtpTimerTick(secondsLeft: secondsLeft));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft == 0) {
        timer.cancel();
      } else {
        secondsLeft--;
        if (!isClosed) emit(OtpTimerTick(secondsLeft: secondsLeft));
      }
    });
  }

  void onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < otpLength - 1) {
      otpFocusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      otpFocusNodes[index - 1].requestFocus();
    }
  }

  String get otpCode => otpControllers.map((c) => c.text).join();

  // ── Resend OTP ──
  Future<bool> resendOtp({required String email, required String type}) async {
    final AuthRepo authRepo = AuthRepo();
    final result = await authRepo.emailotpsend(role: type, email: email);

    return result.fold((_) => false, (_) => true);
  }

  // ── Verify OTP ──
  Future<void> otpverifylogic({
    required String email,
    required String otp,
    required String type,
  }) async {
    emit(OtpVerifyLoading());
    final AuthRepo authRepo = AuthRepo();
    final result = await authRepo.emailotpverify(
      role: type,
      email: email,
      code: otp,
    );

    result.fold(
      (errorMessage) {
        if (!isClosed) {
          emit(OtpVerifyError(message: errorMessage));
        }
      },
      (otpverifyrespons) {
        if (!isClosed) {
          emit(
            OtpVerifySuccess(
              message: 'تم التحقق من الرمز بنجاح',
              isNewUser: otpverifyrespons.isNewUser!,
              accessToken: otpverifyrespons.accessToken!,
            ),
          );
        }
      },
    );
  }

  // ── Sign‑in logic ──
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

  void disposeOtpResources() {
    _timer?.cancel();
    for (final c in otpControllers) {
      c.dispose();
    }
    for (final f in otpFocusNodes) {
      f.dispose();
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    emailController.dispose();
    return super.close();
  }
}
