abstract class SigninState {}

class SigninInital extends SigninState {}

class SelectedType extends SigninState {}

class Loading extends SigninState {}

// ── OTP‑related states ──

class OtpTimerTick extends SigninState {
  OtpTimerTick({required this.secondsLeft});
  final int secondsLeft;
}

class OtpVerifyLoading extends SigninState {}

class OtpVerifySuccess extends SigninState {
  OtpVerifySuccess({
    required this.message,
    required this.isNewUser,
    required this.accessToken,
  });

  final String message;
  final bool isNewUser;
  final String accessToken;
}

class OtpVerifyError extends SigninState {
  OtpVerifyError({required this.message});
  final String message;
}
