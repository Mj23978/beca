import '../../widgets/custom/resizable_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers.dart';
import 'demo.dart';

class HomeView extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(homeProvider.notifier);
    return LayoutBuilder(builder: (context, cs) {
      return Scaffold(
        // backgroundColor: Color(0xffE4B6A6),
        body: ResizableWidget(
              dragArea: 25,
              ballColor: Color(0xffFCF7F5).withOpacity(0.85),
              borderColor: Color(0xffFCF7F5),
              // centerWidget: Container(
              //   width: 15,
              //   height: 30,
              //   decoration: BoxDecoration(
              //     color: Colors.black,
              //     shape: BoxShape.rectangle,
              //   ),
              // ),
              // ballWidget: Container(
              //   width: 15,
              //   height: 15,
              //   decoration: BoxDecoration(
              //     color: Colors.black,
              //     shape: BoxShape.circle,
              //   ),
              // ),
              child: Container(
                color: Colors.amberAccent,
                child: Text(
                    '''I've just did simple prototype to show main idea.
          1. Draw size handlers with container;
          2. Use GestureDetector to get new variables of sizes
          3. Refresh the main container size.'''),
              ),
            ),
          // return TimetableExample();
      );
    });
  }
}
