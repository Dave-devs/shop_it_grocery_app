import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_it_grocery_app/common/utils/otp_dialog.dart';
import 'package:shop_it_grocery_app/features/number_login/bloc/number_login_bloc.dart';

class PhoneNumberController {
  final BuildContext context;

  const PhoneNumberController({required this.context});

  Future<dynamic> handlePhoneLogin() async {

    final state = context.read<NumberLoginBloc>().state;

    String phoneNumberAddress = state.phoneNumber;
    final TextEditingController phoneNumberController = TextEditingController();

    try{

      if(phoneNumberAddress.isEmpty) {
        if (kDebugMode) {
          print('Phone Number is emepty');
        }
      }


      try{

        final FirebaseAuth auth = FirebaseAuth.instance;

        await auth.verifyPhoneNumber(
          phoneNumber: phoneNumberAddress,
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async { //Works only on android
            await auth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (e) {
            if (kDebugMode) {
              print(e.message);
            } //snack bar
          },
          codeSent: (String verificationId, int? forceResendingToken) async {
            showOTPDialog(
              context: context,
              onPressed: () async {
                 PhoneAuthProvider.credential(
                  verificationId: verificationId,
                  smsCode: phoneNumberController.text.trim()
                );
              },
              phoneNumberController: phoneNumberController
            );


          },
          codeAutoRetrievalTimeout: (String number) async {

          }
        );

        await auth.signInWithCredential(phoneNumberAddress as AuthCredential);

        Navigator.of(context).pop();



      } on FirebaseAuthException catch(e) {
        if(e.code == 'user_not_found') {
        }
      }

    } catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

}
