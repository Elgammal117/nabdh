import 'package:flutter_bloc/flutter_bloc.dart';
import 'nurse_tracking_state.dart';

class NurseTrackingCubit extends Cubit<NurseTrackingState> {
  NurseTrackingCubit() : super(NurseTrackingInitial());
}
