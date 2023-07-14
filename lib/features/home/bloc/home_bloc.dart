import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_it_grocery_app/data/men_accessories_data.dart';
import 'package:shop_it_grocery_app/model/eletronic_data_model.dart';
import 'package:shop_it_grocery_app/model/fashion_data_model.dart';
import 'package:shop_it_grocery_app/model/furniture_data_model.dart';
import 'package:shop_it_grocery_app/model/women_accessory_model.dart';

import '../../../model/grocery_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
