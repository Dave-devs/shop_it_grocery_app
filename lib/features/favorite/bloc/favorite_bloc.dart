import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_it_grocery_app/data/cart_items.dart';
import '../../../model/eletronic_data_model.dart';
import '../../../model/fashion_data_model.dart';
import '../../../model/furniture_data_model.dart';
import '../../../model/grocery_data_model.dart';
import '../../../model/men_accessory_model.dart';
import '../../../model/women_accessory_model.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FavoriteInitialEvent>(favoriteInitialEvent);
    on<FavoriteRemoveItemEvent>(favoriteRemoveItemEvent);
  }

  FutureOr<void> favoriteInitialEvent(
      FavoriteInitialEvent event, Emitter<FavoriteState> emit) {
    emit(FavoriteSuccessState(groceryItem: groceryItems));
    emit(FavoriteSuccessState(eletronicItem: eletronicsItems));
    emit(FavoriteSuccessState(furnitureItem: furnitureItems));
    emit(FavoriteSuccessState(fashionItem: fashionItems));
    emit(FavoriteSuccessState(menAccessoryItem: menAccessoryItems));
    emit(FavoriteSuccessState(womenAccessoryItem: womenAccessoryItems));
  }

  FutureOr<void> favoriteRemoveItemEvent(
      FavoriteRemoveItemEvent event, Emitter<FavoriteState> emit) {
    groceryItems.remove(event.groceryDataModel);
    eletronicsItems.remove(event.eletronicDataModel);
    furnitureItems.remove(event.furnitureDataModel);
    fashionItems.remove(event.fashionDataModel);
    menAccessoryItems.remove(event.menAccessoryDataModel);
    womenAccessoryItems.remove(event.womenAccessoryDataModel);

    emit(FavoriteSuccessState(groceryItem: groceryItems));
    emit(FavoriteSuccessState(eletronicItem: eletronicsItems));
    emit(FavoriteSuccessState(furnitureItem: furnitureItems));
    emit(FavoriteSuccessState(fashionItem: fashionItems));
    emit(FavoriteSuccessState(menAccessoryItem: menAccessoryItems));
    emit(FavoriteSuccessState(womenAccessoryItem: womenAccessoryItems));
  }
}
