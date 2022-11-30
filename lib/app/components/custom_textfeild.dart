import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
     this.icon,
    this.sufixIcon,
    this.isobscureText = false,
    this.hintText,
    this.onChanged,
    this.onSufixIconPressed,
    this.textInputType,
    this.validator,
    this.controller,
    this.textInputAction,
    this.onFieldSubmitted,
   required this.textCapitalization,
  }) : super(key: key);
  final IconData? icon;
  final IconData? sufixIcon;
  final bool isobscureText;
  final String? hintText;
  final TextInputType? textInputType;
  final void Function(String)? onChanged;
  final void Function()? onSufixIconPressed;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final TextCapitalization textCapitalization;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35),
      child: TextFormField(
        onChanged: onChanged,
        obscureText: isobscureText,
        keyboardType: textInputType,
        controller: controller,
        textInputAction: textInputAction,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        textCapitalization: textCapitalization,
        
        decoration: InputDecoration(
          
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12),
          prefixIcon: Icon(icon, size: 22),
          suffixIcon: IconButton(
            icon: Icon(
              sufixIcon,
              size: 18,
            ),
            onPressed: onSufixIconPressed,
          ),
          focusColor: Colors.red,
          iconColor: Colors.red,
        ),
      ),
    );
  }
}
