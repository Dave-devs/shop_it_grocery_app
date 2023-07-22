// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteActionState extends FavoriteState {}

class FavoriteSuccessState extends FavoriteState {
  final List<GroceryDataModel> groceryItem;
  final List<EletronicDataModel> eletronicItem;
  final List<FashionDataModel> fashionItem;
  final List<FurnitureDataModel> furnitureItem;
  final List<MenAccessoryDataModel> menAccessoryItem;
  final List<WomenAccessoryDataModel> womenAccessoryItem;
  FavoriteSuccessState({
    required this.groceryItem,
    required this.eletronicItem,
    required this.fashionItem,
    required this.furnitureItem,
    required this.menAccessoryItem,
    required this.womenAccessoryItem,
  });
}
