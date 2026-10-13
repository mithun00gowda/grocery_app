import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorials/core/data/cart_list.dart';
import 'package:bloc_tutorials/features/home/model/home_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromListEvent>(cartRemoveFromListEvent);
  }

  FutureOr<void> cartInitialEvent(
    CartInitialEvent event,
    Emitter<CartState> emit,
  ) {
    emit(CartSuccessState(cartItems: cartList));
  }

  FutureOr<void> cartRemoveFromListEvent(
    CartRemoveFromListEvent event,
    Emitter<CartState> emit,
  ) {
    cartList.remove(event.productModel);
    emit(CartSuccessState(cartItems: cartList));
  }
}
