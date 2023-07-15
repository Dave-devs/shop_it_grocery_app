// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class OnHomeSearchIconClickEvent extends HomeEvent{} //Event 1

class OnHomeFavoriteIconNavClick extends HomeEvent {} //Event 2

class OnHomeCartIconNavClick extends HomeEvent {}  //Event 3

class OnProductCartItemClick extends HomeEvent{
  final GroceryDataModel groceryClickedProduct;
  final EletronicDataModel eletronicClickedProduct;
  final FashionDataModel fashionClickedProduct;
  final FurnitureDataModel furnitureClickedProduct;
  final MenAccessoryDataModel menClickedProduct;
  final WomenAccessoryDataModel womenClickedProduct;
  
  OnProductCartItemClick({
    required this.groceryClickedProduct,
    required this.eletronicClickedProduct,
    required this.fashionClickedProduct,
    required this.furnitureClickedProduct,
    required this.menClickedProduct,
    required this.womenClickedProduct,
  });
} //Event 4

class OnProductFavoriteItemClick extends HomeEvent {
  final GroceryDataModel groceryClickedProduct;
  final EletronicDataModel eletronicClickedProduct;
  final FashionDataModel fashionClickedProduct;
  final FurnitureDataModel furnitureClickedProduct;
  final MenAccessoryDataModel menClickedProduct;
  final WomenAccessoryDataModel womenClickedProduct;

  OnProductFavoriteItemClick({
    required this.groceryClickedProduct,
    required this.eletronicClickedProduct,
    required this.fashionClickedProduct,
    required this.furnitureClickedProduct,
    required this.menClickedProduct,
    required this.womenClickedProduct,
  });
} //Event 5

// class OnFavoriteAddItemIconClick extends HomeEvent {
  // final GroceryDataModel groceryClickedProduct;
  // final EletronicDataModel eletronicClickedProduct;
  // final FashionDataModel fashionClickedProduct;
  // final FurnitureDataModel furnitureClickedProduct;
  // final MenAccessoryDataModel menClickedProduct;
  // final WomenAccessoryDataModel womenClickedProduct;
  
  // OnFavoriteAddItemIconClick({
  //   required this.groceryClickedProduct,
  //   required this.eletronicClickedProduct,
  //   required this.fashionClickedProduct,
  //   required this.furnitureClickedProduct,
  //   required this.menClickedProduct,
  //   required this.womenClickedProduct,
  // });
// }