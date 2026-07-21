import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabdh/Core/Features/Auth/Data/Repo/AutRepo.dart';
import 'package:nabdh/Core/Features/Auth/Presentation/Cubit/NumVerifyCubit.dart/NumVerifyState.dart';

class NumVerifyCubit extends Cubit<NumVerifyCubitState> {
  NumVerifyCubit() : super(NumVerifyCubitInitial());
  static NumVerifyCubit get(context) => BlocProvider.of(context);
  // كان ممكن اعدل ال otpverifylogic بحيث لما اتدعيها في ال screen تاخد الرقم و كدا اقدر استخدمها في ال resend بس ال ai ليه رأي تاني
  otpverifylogic({
    required String phoneNumber,
    required String otp,
    required String type,
    Map<String, dynamic>? deviceinfo,
  }) async {
    emit(NumVerifyCubitLoading());
    final AuthRepo authRepo = AuthRepo();
    final result = await authRepo.numberotpverify(
      role: type,
      phoneNumber: phoneNumber,
      code: otp,
      deviceinfo: deviceinfo,
    );

    result.fold(
      (errorMessage) {
        if (!isClosed) {
          emit(NumVerifyCubitError(message: errorMessage));
        }
      },
      (_) {
        if (!isClosed) {
          emit(NumVerifyCubitSuccess(message: 'تم التحقق من الرمز بنجاح'));
        }
      },
    );
  }
}
