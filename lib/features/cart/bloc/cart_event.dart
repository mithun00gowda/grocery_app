part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromListEvent extends CartEvent {
  final ProductModel productModel;

  CartRemoveFromListEvent({required this.productModel});
}
