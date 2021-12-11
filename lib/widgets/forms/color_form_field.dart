import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../utils/helpers.dart';
import '../dialogs/color_picker_dialog.dart';
import 'color_form_item.dart';

class ProjectColorFormField extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;
  final double circleSize;

  final List<Color> _colors = [
    Colors.amberAccent,
    Colors.blueAccent,
    Colors.redAccent,
    Colors.cyan
  ];

  ProjectColorFormField({
    required this.onTap,
    required this.currentIndex,
    this.circleSize = 45,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: "color_picker",
      initialValue: Colors.amberAccent,   
      validator: FormBuilderValidators.required(context),
        builder: (FormFieldState state) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 35,
                ),
                for (final colorMap in _colors.asMap().entries)
                  ProjectColorFormItem(
                    color: colorMap.value,
                    index: colorMap.key,
                    currentIndex: currentIndex,
                    circleSize: circleSize,
                    onTap: () {
                      final index = colorMap.key;
                      onTap(index);
                    },
                  ),
                ProjectColorFormItem(
                  color: Colors.white,
                  circleSize: circleSize,
                  index: 10,
                  currentIndex: currentIndex,
                  onTap: () {
                    baseFlash(context, (controller) => ColorPickerDialog());
                  },
                  isAction: true,
                  icon: Icons.add,
                  iconColor: Colors.blueAccent,
                ),
              ],
            ),
          );
        },
    );
  }
}
