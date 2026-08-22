import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabdh/Core/Features/Auth/Presentation/Cubit/LoginCubit/LoginCubit.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final String accessToken;

  HomeCubit({this.accessToken = ""}) : super(HomeInitial());

  static HomeCubit get(BuildContext context) => BlocProvider.of<HomeCubit>(context);

  // ── State variables ──
  String userName = '...';
  bool isLoading = true;

  bool showAllServices = false;
  int? selectedServiceIndex;
  String selectedRequestType = 'الان';

  final TextEditingController notesController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final GlobalKey formKey = GlobalKey();

  final List<Map<String, dynamic>> services = [
    {
      'title': 'تمريض منزلي',
      'asset': 'assets/تمريض منزلي.svg',
    },
    {
      'title': 'حقن و محاليل',
      'asset': 'assets/حقن و محاليل.svg',
    },
    {
      'title': 'تغيير الضمادات',
      'asset': 'assets/تغير ضماضات.svg',
    },
    {
      'title': 'رعاية كبار السن',
      'asset': 'assets/رعايه كبار السن.svg',
    },
    {
      'title': 'رعاية ما بعد العمليات',
      'asset': 'assets/رعايه ما بعد العمليه.svg',
    },
    {
      'title': 'متابعة الحالات المزمنة',
      'asset': 'assets/متابعه الحالات المزمنه.svg',
    },
  ];

  Future<void> loadUserData() async {
    if (SigninCubit.cachedUser != null) {
      userName = (SigninCubit.cachedUser?.fullName ?? 'مستخدم').split(' ').first;
      isLoading = false;
      if (!isClosed) emit(HomeUserDataLoaded(userName: userName));
      return;
    }

    final cubit = SigninCubit();
    final user = await cubit.getuser(accessToken: accessToken);

    if (user != null) {
      userName = (user.fullName ?? 'مستخدم').split(' ').first;
      isLoading = false;
      if (!isClosed) emit(HomeUserDataLoaded(userName: userName));
    }
  }

  void toggleServicesVisibility() {
    showAllServices = !showAllServices;
    emit(HomeServicesVisibilityChanged(showAll: showAllServices));
  }

  void selectService(int index) {
    selectedServiceIndex = index;
    emit(HomeServiceSelected(selectedIndex: index));

    // Scroll to the form
    Future.delayed(const Duration(milliseconds: 100), () {
      if (formKey.currentContext != null) {
        Scrollable.ensureVisible(
          formKey.currentContext!,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void setRequestType(String type) {
    selectedRequestType = type;
    emit(HomeRequestTypeChanged(requestType: type));
  }

  @override
  Future<void> close() {
    notesController.dispose();
    scrollController.dispose();
    return super.close();
  }
}
