import 'package:bloc_tutorials/features/home/model/home_data_model.dart';
import 'package:bloc_tutorials/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

class WishListTileWidget extends StatelessWidget {
  final ProductModel _productModel;
  final WishlistBloc _wishlistBloc;
  const WishListTileWidget({super.key, required this._productModel, required this._wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(_productModel.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            _productModel.name,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(_productModel.description),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ "+_productModel.price.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(

                children: [
                  IconButton(
                    onPressed: () {
                      // _homeBloc.add(HomeWishListNavigatorEvent());
                      _wishlistBloc.add(WishListItemRemoveEvent(productModel: _productModel));
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                ],)
            ],
          ),
        ],
      ),
    );
  }
}
