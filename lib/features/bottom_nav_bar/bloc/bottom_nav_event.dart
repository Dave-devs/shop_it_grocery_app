part of 'bottom_nav_bloc.dart';

abstract class BottomNavEvent {
  const BottomNavEvent();
}

class BottomNavigatorEvent extends BottomNavEvent {
  final int pageIndex;
  const BottomNavigatorEvent(this.pageIndex) : super();
}
