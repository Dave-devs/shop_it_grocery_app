// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeActionState extends HomeState{}

class HomeInitial extends HomeState {}

//Build States
class HomeLoadingState extends HomeState{}
class HomeSuccessState extends HomeState {
  final List<GroceryDataModel> groceryData;
  final List<EletronicDataModel> eletronicData;
  final List<FashionDataModel> fashionData;
  final List<FurnitureDataModel> furnitureData;
  final List<MenAccessoryData> menDataAccessory;
  final List<WomenAccessoryDataModel> womenDataAccessory;

  HomeSuccessState({
    required this.groceryData,
    required this.eletronicData,
    required this.fashionData,
    required this.furnitureData,
    required this.menDataAccessory,
    required this.womenDataAccessory,
  });
  

  HomeSuccessState copyWith({
    List<GroceryDataModel>? groceryData,
    List<EletronicDataModel>? eletronicData,
    List<FashionDataModel>? fashionData,
    List<FurnitureDataModel>? furnitureData,
    List<MenAccessoryData>? menDataAccessory,
    List<WomenAccessoryDataModel>? womenDataAccessory,
  }) {
    return HomeSuccessState(
      groceryData: groceryData ?? this.groceryData,
      eletronicData: eletronicData ?? this.eletronicData,
      fashionData: fashionData ?? this.fashionData,
      furnitureData: furnitureData ?? this.furnitureData,
      menDataAccessory: menDataAccessory ?? this.menDataAccessory,
      womenDataAccessory: womenDataAccessory ?? this.womenDataAccessory,
    );
  }
}

class HomeErrorState extends HomeState{}

class HomePersonIconCountState extends HomeState{}
class HomeCartIconCountState extends HomeState{}

//Action States
class HomeNavigateToCartPageClickState extends HomeActionState{}
class HomeNavigateToAccountPageClickState extends HomeActionState{}