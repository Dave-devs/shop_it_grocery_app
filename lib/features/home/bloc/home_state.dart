// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

//Build States
class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<GroceryDataModel> groceryData;
  final List<EletronicDataModel> eletronicData;
  final List<FashionDataModel> fashionData;
  final List<FurnitureDataModel> furnitureData;
  final List<MenAccessoryDataModel> menDataAccessory;
  final List<WomenAccessoryDataModel> womenDataAccessory;

  HomeSuccessState({
    required this.groceryData,
    required this.eletronicData,
    required this.fashionData,
    required this.furnitureData,
    required this.menDataAccessory,
    required this.womenDataAccessory,
  });
}

class HomeErrorState extends HomeState {}

//Action States
class SearchBarNavigateClickState extends HomeActionState {}

class OnHomeFavoriteNavigateClickState extends HomeActionState {}

class OnHomeCartNavigateClickState extends HomeActionState {}

class CartTileItemAddedState extends HomeActionState {}

class FavoriteTileItemAddedState extends HomeActionState {}

class TopFavoriteCountState extends HomeActionState {
  final int favoriteCount;

  TopFavoriteCountState({this.favoriteCount = 0});
}

class TopCartCountState extends HomeActionState {
  final int cartCount;

  TopCartCountState({this.cartCount = 0});
}
