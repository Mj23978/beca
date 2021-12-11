import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ColorPickerDialog extends StatefulWidget {
  final BoxConstraints? constraints;
  final Color? backgroundColor;

  ColorPickerDialog({
    this.backgroundColor,
    this.constraints,
  });

  @override
  _ColorPickerDialogState createState() => _ColorPickerDialogState();
}

class _ColorPickerDialogState extends State<ColorPickerDialog> {
  late Color screenPickerColor;

  @override
  void initState() {
    super.initState();
    screenPickerColor = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: widget.constraints ??
            BoxConstraints.expand(
                width: double.infinity, height: double.infinity),
        child: Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              backgroundColor: widget.backgroundColor ??
                  Theme.of(context).dialogBackgroundColor,
              titlePadding: EdgeInsets.all(0.0),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ColorPicker(
                    // Use the screenPickerColor as start color.
                    color: screenPickerColor,
                    // Update the screenPickerColor using the callback.
                    onColorChanged: (Color color) =>
                        setState(() => screenPickerColor = color),
                    width: 44,
                    height: 44,
                    borderRadius: 22,
                    heading: Text(
                      'Select color',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    subheading: Text(
                      'Select color shade',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
