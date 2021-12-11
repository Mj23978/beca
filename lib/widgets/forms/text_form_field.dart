import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TransactiontTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final String name;
  final void Function(String? value)? onSaved;
  final void Function(String value)? onSubmit;
  final List<Function(String value)> taskValidators;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  final bool autoFocus;
  final Icon? icon;
  final bool isLast;

  TransactiontTextFormField({
    required this.controller,
    required this.label,
    required this.name,
    this.focusNode,
    this.taskValidators = const [],
    this.autoFocus = false,
    this.onEditingComplete,
    this.onSaved,
    this.onSubmit,
    this.icon,
    this.isLast = false,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormBuilderTextField(
        keyboardType: TextInputType.text,
        textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        name: name,
        autofocus: autoFocus,
        validator: (value) {},
        onSaved: onSaved,
        onSubmitted: onSubmit,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: icon,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueAccent,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
