import 'package:bloc_tutorials/features/cart/widget/cart_item_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc _cartBloc = CartBloc();
  @override
  void initState() {
    _cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: _cartBloc,
        listener: (context, state) {},
        listenWhen: ((previous, current) => current is CartActionState),
        buildWhen: (((previous, current) => current is! CartActionState)),
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartItemTileWidget(
                    productModel: successState.cartItems[index],
                    cartBloc: _cartBloc,
                  );
                },
              );
            default:
              return Center(child: Container(child: Text('No Item Listed')));
          }
        },
      ),
    );
  }
}
