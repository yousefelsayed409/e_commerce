// // ignore_for_file: public_member_api_docs, sort_constructors_first
// part of 'layout_cubit.dart';

// @immutable
// abstract class LayoutState {}

// class LayoutInitial extends LayoutState {}
// class changebottomNavState extends LayoutState {}

// class GetUserToSuccessState extends LayoutState {}

// class GeyUserLoadingState extends LayoutState {}

// class FailureGetUserState extends LayoutState {
//   String errorMseeage;
//   FailureGetUserState({
//     required this.errorMseeage,
//   });
// }

//  class GetBannerSuccessState extends LayoutState {}
// class GetBannerLoadingState extends LayoutState {}
// class FailureGetBannerState extends LayoutState {}

// class FailureGetCategoryState extends LayoutState {}
// class GetCategorySuccessState extends LayoutState {}
// class GetCategortLoadingState extends LayoutState {}

// class GetProducttLoadingState extends LayoutState {}
// class GetProductSuccessState extends LayoutState {}
// class FailureGetProductState extends LayoutState {}

// class FilterProductSuccessState extends LayoutState {}

abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}

class ChangeBottomNavIndexState extends LayoutStates {}

class GetUserDataSuccessState extends LayoutStates {}

class GetUserDataLoadingState extends LayoutStates {}

class FailedToGetUserDataState extends LayoutStates {
  String error;
  FailedToGetUserDataState({required this.error});
}

class GetFavoritesSuccessState extends LayoutStates {}

class FailedToGetFavoritesState extends LayoutStates {}

class AddOrRemoveItemFromFavoritesSuccessState extends LayoutStates {}

class FailedToAddOrRemoveItemFromFavoritesState extends LayoutStates {}

class AddOrRemoveItemFromCartsSuccessState extends LayoutStates {}

class FailedAddOrRemoveItemFromCartsState extends LayoutStates {}

class GetBannersLoadingState extends LayoutStates {}

class GetBannersSuccessState extends LayoutStates {}

class FailedToGetBannersState extends LayoutStates {}

class GetCategoriesSuccessState extends LayoutStates {}

class FailedToGetCategoriesState extends LayoutStates {}

class GetProductsSuccessState extends LayoutStates {}

class FailedToGetProductsState extends LayoutStates {}

class FilterProductsSuccessState extends LayoutStates {}

class GetCartsSuccessState extends LayoutStates {}

class FailedToGetCartsState extends LayoutStates {}

class GetToTalPricesSuccessState extends LayoutStates {}

class ChangePasswordLoadingState extends LayoutStates {}

class ChangePasswordSuccessState extends LayoutStates {}

class ChangePasswordWithFailureState extends LayoutStates {
  String error;

  ChangePasswordWithFailureState(this.error);
}

class UpdateUserDataLoadingState extends LayoutStates {}

class UpdateUserDataSuccessState extends LayoutStates {}

class UpdateUserDataWithFailureState extends LayoutStates {
  String error;

  UpdateUserDataWithFailureState(this.error);
}
