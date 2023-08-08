// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_it_grocery_app/common/utils/otp_dialog.dart';
import 'package:shop_it_grocery_app/features/number_login/bloc/number_login_bloc.dart';

class phoneNumberController {
  final BuildContext context;
  
  const phoneNumberController({required this.context});

  Future<dynamic> handlePhoneLogin() async {
    
    final state = context.read<NumberLoginBloc>().state;

    String phoneNumberAddress = state.phoneNumber;
    final TextEditingController phoneNumberController = TextEditingController();

    try{

      if(phoneNumberAddress.isEmpty) {
        print('Phone Number is emepty');
      }

      // verificationCompleted: (PhoneAuthCredential credential) async {
      //       await credential.signInWithCredential(credential);
      //     },

      try{

        final FirebaseAuth credential = FirebaseAuth.instance;

        await credential.verifyPhoneNumber(
          phoneNumber: phoneNumberAddress,
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async { //Works only on android
            await credential.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (e) {
            print(e.message); //snack bar
          }, 
          codeSent: (String verificationId, int? forceResendingToken) async {
            showOTPDialog(
              context: context, 
              onPressed: () async {
                PhoneAuthCredential phoneAuthCredential = PhoneAuthCredential.phoneAuthCredential(
                  verificationId: verificationId,
                  smsCode: phoneNumberController.text.trim()
                  
                );
              }, 
              phoneNumberController: phoneNumberController
            );
          },
          codeAutoRetrievalTimeout: (String number) async {
            await credential.
          }
        );

        await credential.signInWithCredential(phoneNumberAddress);
        Navigator.of(context).pop();

        

      } on FirebaseAuthException catch(e) {
        if(e.code == 'user_not_found') {
          
        }
      }

    } catch(e) {
      print(e.toString());
    }
  }

}
