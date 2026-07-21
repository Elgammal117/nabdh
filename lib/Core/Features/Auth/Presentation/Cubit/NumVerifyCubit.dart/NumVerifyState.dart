abstract class NumVerifyCubitState {}

class NumVerifyCubitInitial extends NumVerifyCubitState {}

class NumVerifyCubitLoading extends NumVerifyCubitState {}

class NumVerifyCubitSuccess extends NumVerifyCubitState {
  NumVerifyCubitSuccess({required this.message});

  final String message;
}

class NumVerifyCubitError extends NumVerifyCubitState {
  NumVerifyCubitError({required this.message});

  final String message;
}
