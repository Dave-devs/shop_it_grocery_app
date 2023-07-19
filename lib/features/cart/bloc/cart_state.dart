part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartActionState extends CartState {}

class CartSuccessState extends CartState {
  final List<GroceryDataModel>? groceryItem;
  final List<EletronicDataModel>? eletronicItem;
  final List<FashionDataModel>? fashionItem;
  final List<FurnitureDataModel>? furnitureItem;
  final List<MenAccessoryDataModel>? menAccessoryItem;
  final List<WomenAccessoryDataModel>? womenAccessoryItem;

  CartSuccessState({
    this.groceryItem,
    this.eletronicItem,
    this.fashionItem,
    this.furnitureItem,
    this.menAccessoryItem,
    this.womenAccessoryItem,
  });
}
