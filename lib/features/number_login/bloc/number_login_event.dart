part of 'number_login_bloc.dart';

abstract class NumberLoginEvent {
  const NumberLoginEvent();
}

class OnNumberLoginEventClick extends NumberLoginEvent {
  final String number;
  
  const OnNumberLoginEventClick(this.number);
}
