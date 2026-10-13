part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {
  final ProductModel productModel;

  HomeProductWishListButtonClickedEvent({required this.productModel});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductModel productModel;

  HomeProductCartButtonClickedEvent({required this.productModel});
}

class HomeWishListNavigatorEvent extends HomeEvent {}

class HomeCartNavigatorEvent extends HomeEvent {}
