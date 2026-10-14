import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorials/core/data/wish_list.dart';
import 'package:bloc_tutorials/features/home/model/home_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<WishListItemRemoveEvent>(wishListItemRemoveEvent);
  }

  FutureOr<void> wishListInitialEvent(
    WishListInitialEvent event,
    Emitter<WishlistState> emit,
  ) {
    emit(WishListSuccessfulState(wishList: wishList));
  }

  FutureOr<void> wishListItemRemoveEvent(
    WishListItemRemoveEvent event,
    Emitter<WishlistState> emit,
  ) {
    wishList.remove(event.productModel);
    emit(WishListSuccessfulState(wishList: wishList));
  }
}
