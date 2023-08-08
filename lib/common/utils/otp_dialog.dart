import 'package:flutter/material.dart';
import 'package:shop_it_grocery_app/common/widgets/reusable_text.dart';

void showOTPDialog({
  required BuildContext context,
  required TextEditingController phoneNumberController,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
        title: const ReusableText(text: 'Enter OTP'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: phoneNumberController,
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: onPressed, 
            child: const ReusableText(text: 'Done')
          )
        ],
      )
  );
}