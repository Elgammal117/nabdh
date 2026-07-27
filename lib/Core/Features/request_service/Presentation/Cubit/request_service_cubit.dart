import 'package:flutter_bloc/flutter_bloc.dart';
import 'request_service_state.dart';

class RequestServiceCubit extends Cubit<RequestServiceState> {
  RequestServiceCubit() : super(RequestServiceInitial());
}
