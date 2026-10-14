part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishListInitialEvent extends WishlistEvent {}

class WishListItemRemoveEvent extends WishlistEvent {
  final ProductModel productModel;

  WishListItemRemoveEvent({required this.productModel});
}
