abstract class NumVerifyCubitState {}

class NumVerifyCubitInitial extends NumVerifyCubitState {}

class NumVerifyCubitLoading extends NumVerifyCubitState {}

class NumVerifyCubitSuccess extends NumVerifyCubitState {
  NumVerifyCubitSuccess({
    required this.message,
    required this.isNewUser,
    required this.accessToken,
  });

  final String message;
  final bool isNewUser;
  final String accessToken;
}

class NumVerifyCubitError extends NumVerifyCubitState {
  NumVerifyCubitError({required this.message});

  final String message;
}
