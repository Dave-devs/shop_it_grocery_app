import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'number_login_event.dart';
part 'number_login_state.dart';

class NumberLoginBloc extends Bloc<NumberLoginEvent, NumberLoginState> {
  NumberLoginBloc() : super(NumberLoginInitial()) {
    on<NumberLoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
