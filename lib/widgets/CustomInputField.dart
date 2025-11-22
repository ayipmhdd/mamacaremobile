import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;        // icon kiri
  final bool isPassword;       // apakah field password
  final double borderRadius;
  final Color borderColor;
  final Color iconColor;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.isPassword = false,
    this.borderRadius = 10,
    this.borderColor = const Color(0xFFFF3EA5),
    this.iconColor = const Color(0xFFFF3EA5),
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? obscure : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),

        // Icon kiri
        prefixIcon: widget.icon != null
            ? Icon(widget.icon, color: widget.iconColor)
            : null,

        // Icon password
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                  color: widget.iconColor,
                ),
                onPressed: () {
                  setState(() => obscure = !obscure);
                },
              )
            : null,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: widget.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: widget.borderColor, width: 1.5),
        ),
      ),
    );
  }
}
