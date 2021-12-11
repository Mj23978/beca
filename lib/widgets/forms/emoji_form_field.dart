import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'color_form_item.dart';

class ProjectEmojiFormField extends StatelessWidget {
  final String emoji;
  final int index;
  final int currentIndex;
  final Function onTap;
  final double emojiSize;
  final double badgePositionLeft;
  final double badgePositionTop;
  final Duration animationDuration;

  ProjectEmojiFormField({
    required this.emoji,
    required this.onTap,
    required this.index,
    required this.currentIndex,
    this.animationDuration = const Duration(microseconds: 100),
    this.badgePositionLeft = -20,
    this.badgePositionTop = -20,
    this.emojiSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: "emoji_picker",
      builder: (state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 35,
              ),
              // emojiPicker(
              //   emoji: Emojis.abacus,
              //   index: 0,
              //   currentIndex: model.emojiPickerIndex,
              //   onIconChoose: () {
              //     model.changeEmojiIndex(0);
              //   },
              // ),
              // emojiPicker(
              //   emoji: Emojis.redHeart,
              //   index: 1,
              //   currentIndex: model.emojiPickerIndex,
              //   onIconChoose: () {
              //     model.changeEmojiIndex(1);
              //   },
              // ),
              ProjectColorFormItem(
                color: Colors.white,
                circleSize: 45,
                index: 10,
                currentIndex: 0,
                onTap: () {},
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
