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
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveItemEvent>(cartRemoveItemEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(
      groceryItem:  groceryItems,
      eletronicItem: eletronicsItems,
      furnitureItem: furnitureItems,
      fashionItem: fashionItems,
      menAccessoryItem: menAccessoryItems,
      womenAccessoryItem: womenAccessoryItems
    ));
  }

  FutureOr<void> cartRemoveItemEvent(CartRemoveItemEvent event, Emitter<CartState> emit) {
    groceryItems.remove(event.groceryDataModel);
    eletronicsItems.remove(event.eletronicDataModel);
    furnitureItems.remove(event.furnitureDataModel);
    fashionItems.remove(event.fashionDataModel);
    menAccessoryItems.remove(event.menAccessoryDataModel);
    womenAccessoryItems.remove(event.womenAccessoryDataModel);

    emit(CartSuccessState(
      groceryItem: groceryItems,
      eletronicItem: eletronicsItems,
      fashionItem: fashionItems,
      furnitureItem: furnitureItems,
      menAccessoryItem: menAccessoryItems,
      womenAccessoryItem: womenAccessoryItems
    ));
    
  }
}
