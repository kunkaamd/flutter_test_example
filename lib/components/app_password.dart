import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_round_1/components/underline_input_custom.dart';
import 'package:test_round_1/constants/constants.dart';

class AppFieldPassword extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;

  const AppFieldPassword({Key? key, this.controller, this.hintText})
      : super(key: key);

  @override
  State<AppFieldPassword> createState() => _AppFieldPasswordState();
}

class _AppFieldPasswordState extends State<AppFieldPassword> {
  bool obscureText = true;
  PasswordStrong? _strong;

  onChange(String text) {
    setState(() {
      _strong = text.strongPassword();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: onChange,
      obscureText: obscureText,
      cursorColor: Theme.of(context).primaryColor,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        counterText: _strong.toText(),
        counterStyle: TextStyle(
          fontSize: 12,
          color: _strong.color(),
        ),
        isDense: true,
        labelText: widget.hintText,
        labelStyle:
            TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.5)),
        focusedBorder: UnderlineInputBorderCustom(
          draw: drawUnderline,
        ),
        border: UnderlineInputBorderCustom(
          draw: drawUnderline,
        ),
        enabledBorder: UnderlineInputBorderCustom(
          draw: drawUnderline,
        ),
        suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    obscureText ^= true;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SvgPicture.asset("assets/icons/icon_eye.svg"),
                ),
              ),
            ]),
      ),
    );
  }
  
  drawUnderline(Canvas canvas,Rect rect) {
    final borderSide = BorderSide(color: Colors.white.withOpacity(0.42));
    if (_strong == PasswordStrong.week) {
      canvas.drawLine(rect.bottomLeft, Offset(rect.right / 4, rect.bottom),
          borderSide.copyWith(color: _strong.color()).toPaint());
      canvas.drawLine(Offset(rect.right / 4, rect.bottom), rect.bottomRight,
          borderSide.toPaint());
    } else if (_strong == PasswordStrong.fair) {
      canvas.drawLine(rect.bottomLeft, Offset(rect.right / 2, rect.bottom),
          borderSide.copyWith(color: _strong.color()).toPaint());
      canvas.drawLine(Offset(rect.right / 2, rect.bottom), rect.bottomRight,
          borderSide.toPaint());
    } else if (_strong == PasswordStrong.good) {
      canvas.drawLine(rect.bottomLeft, Offset(rect.right * 3 / 4, rect.bottom),
          borderSide.copyWith(color: _strong.color()).toPaint());
      canvas.drawLine(Offset(rect.right * 3 / 4, rect.bottom), rect.bottomRight,
          borderSide.toPaint());
    } else {
      canvas.drawLine(rect.bottomLeft, rect.bottomRight, borderSide.copyWith(color: _strong.color()).toPaint());
    }
  }
}
