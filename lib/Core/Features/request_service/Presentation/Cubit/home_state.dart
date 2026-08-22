abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeUserDataLoaded extends HomeState {
  final String userName;
  HomeUserDataLoaded({required this.userName});
}

class HomeServicesVisibilityChanged extends HomeState {
  final bool showAll;
  HomeServicesVisibilityChanged({required this.showAll});
}

class HomeServiceSelected extends HomeState {
  final int selectedIndex;
  HomeServiceSelected({required this.selectedIndex});
}

class HomeRequestTypeChanged extends HomeState {
  final String requestType;
  HomeRequestTypeChanged({required this.requestType});
}
