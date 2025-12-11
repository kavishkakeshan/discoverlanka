import 'package:flutter/material.dart';

// Reusable Custom Input Field Component
class CustomInputField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onVisibilityToggle;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomInputField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.isPassword = false,
    this.obscureText = false,
    this.onVisibilityToggle,
    this.controller,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 17, 155, 17),
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? obscureText : false,
        keyboardType: keyboardType,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          prefixIconColor: Colors.green,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: onVisibilityToggle,
                )
              : null,
          suffixIconColor: Colors.green,
          labelText: labelText,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          
        ),
      ),
    );
  }
}
