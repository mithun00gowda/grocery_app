import 'package:bloc_tutorials/features/cart/ui/cart_screen.dart';
import 'package:bloc_tutorials/features/home/widgets/product_tile_widget.dart';
import 'package:bloc_tutorials/features/wishlist/ui/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    _homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _homeBloc,
      listener: (context, state) {
        if (state is HomeNavigateToWishListPageState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => WishlistScreen()),
          );
        }
        if (state is HomeNavigateToCartPageState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CartScreen()),
          );
        }
        
        if(state is HomeProductItemWishListedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Added to WishList')));
        }

        if(state is HomeProductItemCartListedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Added to cart')));
        }
      },
      listenWhen: ((previous, current) => current is HomeActionState),
      buildWhen: ((previous, current) => current is! HomeActionState),
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text('Grocery App'),
                actions: [
                  IconButton(
                    onPressed: () {
                      _homeBloc.add(HomeWishListNavigatorEvent());
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      _homeBloc.add(HomeCartNavigatorEvent());
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    productModel: successState.products[index],
                    homeBloc: _homeBloc,
                  );
                },
              ),
            );

          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error In this Screen')));

          default:
            return SizedBox();
        }
      },
    );
  }
}
