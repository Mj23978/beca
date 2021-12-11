import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class ProjectEmojiFormItem extends StatelessWidget {
  final String emoji;
  final int index;
  final int currentIndex;
  final void Function() onTap;
  final double emojiSize;
  final double badgePositionLeft;
  final double badgePositionTop;
  final Duration animationDuration;

  ProjectEmojiFormItem({
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Badge(
            animationType: BadgeAnimationType.scale,
            animationDuration: animationDuration,
            // badgeContent: Icon(Icons.check),
            badgeColor: Colors.transparent,
            elevation: 0,
            position:
                BadgePosition(top: -badgePositionTop, end: -badgePositionLeft),
            showBadge: currentIndex == index ? true : false,
            badgeContent: Icon(Icons.check),
            child: Text(
              // "${Emoji.byName("mobile phone")}",
              // "${EmojiParser().get("mobile phone").code}",
              // "${Emoji.byName(Emojis.aButton)}",
              "$emoji",
              // "",
              style: TextStyle(
                fontSize: emojiSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
