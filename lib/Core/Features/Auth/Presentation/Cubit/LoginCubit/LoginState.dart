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

class Error extends SigninState {
  Error({required this.message});
  final String message;
}

// ── Signup‑related states ──

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupPhotoChanged extends SignupState {
  SignupPhotoChanged({required this.photoPath});
  final String photoPath;
}

class SignupGenderChanged extends SignupState {
  SignupGenderChanged({required this.gender});
  final String gender;
}

class SignupDateChanged extends SignupState {
  SignupDateChanged({required this.date});
  final DateTime date;
}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupError extends SignupState {
  SignupError({required this.message});
  final String message;
}
