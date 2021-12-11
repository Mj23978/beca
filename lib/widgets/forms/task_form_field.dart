import 'package:flutter/material.dart';

class TaskFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final void Function(String? value)? onSaved;
  final void Function(String value)? onSubmit;
  final String? Function(String? value)? validator;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  final bool autoFocus;
  final bool noBorder;
  final bool isLast;

  TaskFormField({
    required this.controller,
    required this.label,
    this.autoFocus = false,
    this.noBorder = false,
    this.isLast = false,
    this.onEditingComplete,
    this.focusNode,
    this.onSaved,
    this.validator,
    this.onSubmit,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextFormField(
        keyboardType: TextInputType.text,
        textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        autofocus: autoFocus,
        validator: validator,
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.amberAccent,
        onSaved: onSaved,
        onFieldSubmitted: onSubmit,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white10,
          filled: true,
          helperStyle: TextStyle(color: Colors.grey),
          labelStyle: TextStyle(color: Colors.grey),
          icon: Icon(
            Icons.label,
            color: Colors.grey[500],
          ),
          labelText: label,
          hintText: hint,
          border: UnderlineInputBorder(),
        ),
      ),
    );
  }
}
