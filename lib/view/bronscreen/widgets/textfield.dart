import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final title;
  final keyboardtype;
  const MyTextField({super.key, this.title, this.keyboardtype});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 52,
        child: TextField(
          keyboardType: keyboardtype,
          // obscureText: widget.showtext,
          // controller: widget.cont,
          // focusNode: _focusNode,
          style: const TextStyle(
            color: Color(0xFF14132A),
            fontSize: 16,
            // fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
            height: 1.10,
            letterSpacing: 0.75,
          ),
          decoration: InputDecoration(
              labelText: title,
              focusColor: Colors.black,
              contentPadding:
                  const EdgeInsets.only(left: 16, top: 16, bottom: 16),
              hintStyle: const TextStyle(
                color: Color(0xFFA8ABB6),
                fontSize: 17,
                // fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                height: 1.20,
                letterSpacing: 0.17,
              ),
              filled: true,
              fillColor: const Color.fromRGBO(246, 246, 249, 1),
              border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12)))),
        ),
      ),
    );
  }
}
