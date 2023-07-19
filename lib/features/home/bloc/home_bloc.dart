import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:shop_it_grocery_app/data/eletronics_data.dart';
import 'package:shop_it_grocery_app/data/fashion_data.dart';
import 'package:shop_it_grocery_app/data/favorite_item.dart';
import 'package:shop_it_grocery_app/data/furniture_data.dart';
import 'package:shop_it_grocery_app/data/groceries_data.dart';
import 'package:shop_it_grocery_app/data/men_accessories_data.dart';
import 'package:shop_it_grocery_app/data/women_accessories_data%20copy.dart';
import 'package:shop_it_grocery_app/model/eletronic_data_model.dart';
import 'package:shop_it_grocery_app/model/fashion_data_model.dart';
import 'package:shop_it_grocery_app/model/furniture_data_model.dart';
import 'package:shop_it_grocery_app/model/men_accessory_model.dart';
import 'package:shop_it_grocery_app/model/women_accessory_model.dart';
import '../../../data/cart_items.dart';
import '../../../model/grocery_data_model.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<OnHomeSearchIconClickEvent>(onHomeSearchIconClickEvent);
    on<OnHomeFavoriteIconNavClickEvent>(onHomeFavoriteIconNavClick);
    on<OnHomeCartIconNavClickEvent>(onHomeCartIconNavClick);
    on<OnProductCartItemClickEvent>(onProductCartItemClick);
    on<OnProductFavoriteItemClickEvent>(onProductFavoriteItemClick);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(HomeSuccessState(
        groceryData: GroceryData.groceryData
            .map((e) => GroceryDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList(),
        eletronicData: EletronicsData.eletronicsData
            .map((e) => EletronicDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList(),
        fashionData: FashionData.fashionData
            .map((e) => FashionDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList(),
        furnitureData: FurnitureData.furnitureData
            .map((e) => FurnitureDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList(),
        menDataAccessory: MenAccessoryData.menAccessoryData
            .map((e) => MenAccessoryDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList(),
        womenDataAccessory: WomenAccessoryData.womenAccessoryData
            .map((e) => WomenAccessoryDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> onHomeSearchIconClickEvent(
      OnHomeSearchIconClickEvent event, Emitter<HomeState> emit) {
    emit(SearchBarNavigateClickState());
  }

  FutureOr<void> onHomeFavoriteIconNavClick(
      OnHomeFavoriteIconNavClickEvent event, Emitter<HomeState> emit) {
    emit(OnHomeFavoriteNavigateClickState());
  }

  FutureOr<void> onHomeCartIconNavClick(
      OnHomeCartIconNavClickEvent event, Emitter<HomeState> emit) {
    emit(OnHomeCartNavigateClickState());
  }

  FutureOr<void> onProductCartItemClick(
      OnProductCartItemClickEvent event, Emitter<HomeState> emit) {
    groceryItems.add(event.groceryClickedProduct!);
    eletronicsItems.add(event.eletronicClickedProduct!);
    fashionItems.add(event.fashionClickedProduct!);
    furnitureItems.add(event.furnitureClickedProduct!);
    menAccessoryItems.add(event.menClickedProduct!);
    womenAccessoryItems.add(event.womenClickedProduct!);
    emit(ProductTileCartIconClickState());
    emit(ProductTileCartIconClickState(cartCount: event.count++));
  }

  FutureOr<void> onProductFavoriteItemClick(
      OnProductFavoriteItemClickEvent event, Emitter<HomeState> emit) {
    favoriteGroceryItems.add(event.groceryClickedProduct!);
    favoriteEletronicsItems.add(event.eletronicClickedProduct!);
    favoriteFashionItems.add(event.fashionClickedProduct!);
    favoriteFurnitureItems.add(event.furnitureClickedProduct!);
    favoriteMenItems.add(event.menClickedProduct!);
    favoriteWomenItems.add(event.womenClickedProduct!);
    emit(ProductTileFavoriteIconClickState());
    emit(ProductTileFavoriteIconClickState(favoriteCount: event.count++));
  }
}
