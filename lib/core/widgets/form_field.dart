import 'package:slash_store/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class SlashFormField extends StatefulWidget {
  const SlashFormField({
    super.key,
    required this.controller,
    required this.inputType,
    required this.fieldLabel,
    required this.icon,
    required this.validate,
    this.isEnabled = true,
    this.obSecure = false,
    this.suffixIcon,
    this.initialValue,
    this.maxLines,
    this.labelColor = Colors.black,
    this.iconColor = Colors.black,
    this.textFieldTextColor = Colors.black,
    this.onChanged,
    this.cursorColor = Colors.deepPurple,
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final String? fieldLabel;
  final Icon? icon;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final bool obSecure;
  final IconButton? suffixIcon;
  final int? maxLines;
  final bool isEnabled;
  final String? initialValue;
  final Color labelColor;
  final Color iconColor;
  final Color textFieldTextColor;
  final Color cursorColor;

  @override
  State<SlashFormField> createState() => _FormFiledState();
}

class _FormFiledState extends State<SlashFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      style: TextStyle(color: widget.textFieldTextColor),
      decoration: InputDecoration(
        labelText: widget.fieldLabel,
        labelStyle: TextStyle(color: widget.labelColor),
        prefixIcon: widget.icon,
        suffixIcon: widget.suffixIcon,
        iconColor: widget.iconColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: AppColor.searchColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: AppColor.searchColor)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: AppColor.searchColor)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
              color: AppColor.searchColor, style: BorderStyle.solid),
        ),
      ),
      maxLines: widget.maxLines,
      cursorColor: Colors.white,
      initialValue: widget.initialValue,
      enabled: widget.isEnabled,
      obscureText: widget.obSecure,
      onChanged: widget.onChanged,
      validator: widget.validate,
    );
  }
}
