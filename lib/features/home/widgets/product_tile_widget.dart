import 'package:bloc_tutorials/features/home/bloc/home_bloc.dart';
import 'package:bloc_tutorials/features/home/model/home_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductModel _productModel;
  final HomeBloc _homeBloc;
  const ProductTileWidget({super.key, required this._productModel, required this._homeBloc});

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
                    _homeBloc.add(HomeProductWishListButtonClickedEvent(
                      productModel: _productModel
                    ));
                  },
                  icon: Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {
                    // _homeBloc.add(HomeCartNavigatorEvent());
                    _homeBloc.add(HomeProductCartButtonClickedEvent(
                      productModel: _productModel
                    ));
                  },
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
              ],)
            ],
          ),
        ],
      ),
    );
  }
}
