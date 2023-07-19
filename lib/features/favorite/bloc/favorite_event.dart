// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class FavoriteInitialEvent extends FavoriteEvent {}

class FavoriteRemoveItemEvent extends FavoriteEvent {
  final GroceryDataModel? groceryDataModel;
  final EletronicDataModel? eletronicDataModel;
  final FashionDataModel? fashionDataModel;
  final FurnitureDataModel? furnitureDataModel;
  final MenAccessoryDataModel? menAccessoryDataModel;
  final WomenAccessoryDataModel? womenAccessoryDataModel;  
  
  FavoriteRemoveItemEvent({
    this.groceryDataModel,
    this.eletronicDataModel,
    this.fashionDataModel,
    this.furnitureDataModel,
    this.menAccessoryDataModel,
    this.womenAccessoryDataModel,
  });
}
