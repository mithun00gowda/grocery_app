import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorials/core/data/cart_list.dart';
import 'package:bloc_tutorials/core/data/grocery_list.dart';
import 'package:bloc_tutorials/core/data/wish_list.dart';
import 'package:bloc_tutorials/features/home/model/home_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonClickedEvent>(
      homeProductWishListButtonClickedEvent,
    );
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeCartNavigatorEvent>(homeCartNavigatorEvent);
    on<HomeWishListNavigatorEvent>(homeWishListNavigatorEvent);
  }
  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        products: GroceryList.groceryList
            .map(
              (e) => ProductModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['image'],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
    HomeProductWishListButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print('wishlist button clicked event');
    wishList.add(event.productModel);
    emit(HomeProductItemWishListedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print('cartlist button clicked event');
    cartList.add(event.productModel);
    emit(HomeProductItemCartListedActionState());
  }

  FutureOr<void> homeCartNavigatorEvent(
    HomeCartNavigatorEvent event,
    Emitter<HomeState> emit,
  ) {
    print('Cart Navigator is clicked');
    emit(HomeNavigateToCartPageState());
  }

  FutureOr<void> homeWishListNavigatorEvent(
    HomeWishListNavigatorEvent event,
    Emitter<HomeState> emit,
  ) {
    print('WishList Navigator Clicked');
    emit(HomeNavigateToWishListPageState());
  }
}
