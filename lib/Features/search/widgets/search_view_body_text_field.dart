import 'package:flutter/material.dart';

class SearchViewBodyTextField extends StatelessWidget {
  final IconData? suffixIcon;
  final int maxLines;
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final bool? enabled;
  const SearchViewBodyTextField({
    super.key,
    this.maxLines = 1,
    this.enabled,
    this.hintText,
    this.controller,
    this.onChanged,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 4,
      ),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          enabled: enabled!,
          suffixIcon: Icon(
            suffixIcon,
            color: Colors.grey,
            size: 24,
          ),
          hintText: hintText,
          focusedBorder: buildBorder(),
          enabledBorder: buildBorder(),
          disabledBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
