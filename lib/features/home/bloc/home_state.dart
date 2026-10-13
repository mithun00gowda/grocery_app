part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductModel> products;
  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListPageState extends HomeActionState {}

class HomeNavigateToCartPageState extends HomeActionState {}

class HomeProductItemWishListedActionState extends HomeActionState{}

class HomeProductItemCartListedActionState extends HomeActionState{}

