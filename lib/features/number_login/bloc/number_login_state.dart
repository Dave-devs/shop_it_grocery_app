// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'number_login_bloc.dart';

class NumberLoginState {
  final String phoneNumber;

  const NumberLoginState({this.phoneNumber = ''});

  

  NumberLoginState copyWith({
  String? phoneNumber,
  }) {
    return NumberLoginState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
