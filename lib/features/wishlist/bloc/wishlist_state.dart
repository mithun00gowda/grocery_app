part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

sealed class WishlistActionState extends WishlistState{}

final class WishlistInitial extends WishlistState {

}

class WishListSuccessfulState extends WishlistState{
  final List<ProductModel> wishList;

  WishListSuccessfulState({required this.wishList});

}

class WishListRemoveItemState extends WishlistState{
  final ProductModel productModel;
  WishListRemoveItemState({required this.productModel});
}