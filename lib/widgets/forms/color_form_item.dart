import 'package:flutter/material.dart';

class ProjectColorFormItem extends StatelessWidget {
  final Color color;
  final int index;
  final int currentIndex;
  final double circleSize;
  final void Function() onTap;
  final bool isSelected;
  final double elevation;
  final bool isAction;
  final IconData? icon;
  final Color? iconColor;

  ProjectColorFormItem({
    required this.color,
    required this.index,
    required this.currentIndex,
    required this.circleSize,
    required this.onTap,
    this.isSelected = false,
    this.elevation = 4.0,
    this.isAction = false,
    this.iconColor,
    this.icon,
  }) : assert(isSelected ? icon == null && iconColor == null : true,
            "Dont Use Icons with Selected Field");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          elevation: elevation,
          shape: const CircleBorder(),
          child: Container(
            // padding: const EdgeInsets.all(10),
            width: circleSize,
            height: circleSize,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(circleSize),
            ),
            child: index != currentIndex
                ? isAction ? Icon(icon, color: iconColor) : null
                : Icon(Icons.check),
          ),
        ),
      ),
    );
  }
}
