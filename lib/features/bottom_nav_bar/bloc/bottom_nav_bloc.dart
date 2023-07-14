import 'package:bloc/bloc.dart';
part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState()) {


    on<BottomNavigatorEvent>(bottomNavigatorEvent);
  }

  void bottomNavigatorEvent(BottomNavigatorEvent event, Emitter<BottomNavState> emit) {
    emit(BottomNavState(pageIndex: state.pageIndex));
  }
}
