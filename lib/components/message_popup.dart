import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {
  final String message;

  const MessageDialog({Key? key,required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      child: Container(
        padding:
        const EdgeInsets.only(left: 32, right: 32, bottom: 20, top: 53),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 33),
          ],
        ),
      ),
    );
  }
}
