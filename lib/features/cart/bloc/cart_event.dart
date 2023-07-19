// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveItemEvent extends CartEvent {
  final GroceryDataModel? groceryDataModel;
  final EletronicDataModel? eletronicDataModel;
  final FashionDataModel? fashionDataModel;
  final FurnitureDataModel? furnitureDataModel;
  final MenAccessoryDataModel? menAccessoryDataModel;
  final WomenAccessoryDataModel? womenAccessoryDataModel;
  CartRemoveItemEvent({
    this.groceryDataModel,
    this.eletronicDataModel,
    this.fashionDataModel,
    this.furnitureDataModel,
    this.menAccessoryDataModel,
    this.womenAccessoryDataModel,
  });

}
