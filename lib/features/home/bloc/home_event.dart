// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class OnHomeSearchIconClickEvent extends HomeEvent {} //Event 1

class OnHomeFavoriteIconNavClickEvent extends HomeEvent {} //Event 2

class OnHomeCartIconNavClickEvent extends HomeEvent {} //Event 3

class OnProductCartItemClickEvent extends HomeEvent {
  final GroceryDataModel? groceryClickedProduct;
  final EletronicDataModel? eletronicClickedProduct;
  final FashionDataModel? fashionClickedProduct;
  final FurnitureDataModel? furnitureClickedProduct;
  final MenAccessoryDataModel? menClickedProduct;
  final WomenAccessoryDataModel? womenClickedProduct;
  int count;

  OnProductCartItemClickEvent({
    this.groceryClickedProduct,
    this.eletronicClickedProduct,
    this.fashionClickedProduct,
    this.furnitureClickedProduct,
    this.menClickedProduct,
    this.womenClickedProduct,
    this.count = 0,
  });
} //Event 4

class OnProductFavoriteItemClickEvent extends HomeEvent {
  final GroceryDataModel? groceryClickedProduct;
  final EletronicDataModel? eletronicClickedProduct;
  final FashionDataModel? fashionClickedProduct;
  final FurnitureDataModel? furnitureClickedProduct;
  final MenAccessoryDataModel? menClickedProduct;
  final WomenAccessoryDataModel? womenClickedProduct;
  int count;

  OnProductFavoriteItemClickEvent({
    this.groceryClickedProduct,
    this.eletronicClickedProduct,
    this.fashionClickedProduct,
    this.furnitureClickedProduct,
    this.menClickedProduct,
    this.womenClickedProduct,
    this.count = 0,
  });
}