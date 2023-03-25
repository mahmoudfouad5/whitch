abstract class AppStates {}

class AppInitialState extends AppStates {}


class GetCategoriesDataLoadingState extends AppStates {}
class GetDataCategoriesSuccessState extends AppStates {}
class GetDataCategoriesErrorState extends AppStates {
  final String? error;

  GetDataCategoriesErrorState(this.error);
}

class GetSeriesDataLoadingState extends AppStates {}
class GetDataSeriesSuccessState extends AppStates {}
class GetDataSeriesErrorState extends AppStates {
  final String? error;

  GetDataSeriesErrorState(this.error);
}


class GetSelectedSeriesDataLoadingState extends AppStates {}
class GetDataSelectedSeriesSuccessState extends AppStates {}
class GetDataSelectedSeriesErrorState extends AppStates {
  final String? error;

  GetDataSelectedSeriesErrorState(this.error);
}




