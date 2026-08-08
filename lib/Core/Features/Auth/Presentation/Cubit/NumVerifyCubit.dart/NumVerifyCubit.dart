import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabdh/Core/Features/Auth/Data/Repo/AutRepo.dart';
import 'package:nabdh/Core/Features/Auth/Presentation/Cubit/NumVerifyCubit.dart/NumVerifyState.dart';

class NumVerifyCubit extends Cubit<NumVerifyCubitState> {
  NumVerifyCubit() : super(NumVerifyCubitInitial());
  static NumVerifyCubit get(context) => BlocProvider.of(context);
  // كان ممكن اعدل ال otpverifylogic بحيث لما اتدعيها في ال screen تاخد الرقم و كدا اقدر استخدمها في ال resend بس ال ai ليه رأي تاني
  Future<void> otpverifylogic({
    required String email,
    required String otp,
    required String type,
  }) async {
    emit(NumVerifyCubitLoading());
    final AuthRepo authRepo = AuthRepo();
    final result = await authRepo.emailotpverify(
      role: type,
      email: email,
      code: otp,
    );

    result.fold(
      (errorMessage) {
        if (!isClosed) {
          emit(NumVerifyCubitError(message: errorMessage));
        }
      },
      (otpverifyrespons) {
        if (!isClosed) {
          emit(
            NumVerifyCubitSuccess(
              message: 'تم التحقق من الرمز بنجاح',
              isNewUser: otpverifyrespons.isNewUser!,
              accessToken: otpverifyrespons.accessToken!,
            ),
          );
        }
      },
    );
  }
}
