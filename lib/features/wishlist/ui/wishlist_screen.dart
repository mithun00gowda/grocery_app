import 'package:bloc_tutorials/features/wishlist/widgets/wishlist_tile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wishlist_bloc.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistBloc _wishlistBloc = WishlistBloc();

@override
  void initState() {
    _wishlistBloc.add(WishListInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WishList')),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: _wishlistBloc,
        listenWhen: ((previous, current) => current is WishlistActionState),
        buildWhen: ((previous, current) => current is! WishlistActionState),
        listener: (context, state) {},
        builder: (context, state) {
          print(state.runtimeType);
          switch(state.runtimeType){
            case WishlistInitial:
              return Center(child: Text('List is Empty'),);
            case const (WishListSuccessfulState):
              final successState = state as WishListSuccessfulState;
              return ListView.builder(
                itemCount: successState.wishList.length,
                itemBuilder: (context, index) {
                  print(successState.wishList.length);
                   if(successState.wishList.isNotEmpty){
                     return WishListTileWidget(
                       productModel: successState.wishList[index],
                       wishlistBloc: _wishlistBloc,
                     );
                   }
                   return Center(child: Text('List is Empty'),);

                },
              );
              default:
                return Center(child: Text('List is Empty'),);
          }
        },
      ),
    );
  }
}
