import 'package:beca/views/home_view/demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uix/flutter_uix.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers.dart';
// import '../../widgets/calendar/callbacks.dart';
// import '../../widgets/calendar/config.dart';
// import '../../widgets/calendar/event/basic.dart';
// import '../../widgets/calendar/layouts/multi_date.dart';
// import '../../widgets/calendar/theme.dart';

class HomjeView extends ConsumerWidget {
  Widget pageTemplate({
    required Widget Function(BoxConstraints) child,
  }) {
    return LayoutBuilder(builder: (context, cs) {
      return Scaffold(
        // backgroundColor: Color(0xffE4B6A6),
        body: child(cs),
      );
    });
  }

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(homeProvider.notifier);
    // var calPInput = CalendarProviderInput(
    //   constriants: BoxConstraints(),
    //   localizations: SfLocalizations.of(context),
    //   calendarTheme: SfCalendarThemeData(
    //     todayHighlightColor: Colors.brown,
    //     selectionBorderColor: Colors.cyanAccent,
    //   ),
    //   currentView: CalendarView.day,
    //   // isRTL: true,
    // );
    // final calP = watch(calendarProvider(calPInput));
    // var dayPInput = CalendarDayProviderInput(
    //   parentProvider: calP,
    //   horizontalLinesCount: 24,
    //   timeIntervalHeight: 30,
    //   timeLabelWidth: 50,
    //   timeSlotViewSettings: TimeSlotViewSettings(),
    //   calendarCellNotifier: ValueNotifier<Offset>(Offset(0, 0)),
    //   specialRegion: [],
    // );
    // var headPInput = CalendarHeaderProviderInput(
    //     parentProvider: calP,
    //     timeLabelWidth: 10,
    //     viewHeaderHeight: 5,
    //     viewHeaderNotifier: ValueNotifier<Offset>(Offset(0, 0)),
    //     showWeekNumber: true,
    //     todayHighlightColor: Colors.blue,
    //     todayTextStyle: TextStyle(color: Colors.white));
    // var allDayPInput = AllDayAppointmentProviderInput(
    //   parentProvider: calP,
    //   allDayHoverPosition: ValueNotifier(Offset(0, 0)),
    //   allDayPainterHeight: 50,
    //   timeLabelWidth: 40,
    //   repaintNotifier:
    //       ValueNotifier(SelectionDetails(AppointmentView(), DateTime.now())),
    //   updateCalendarState: (s) {},
    // );
    // final allDayP = watch(allDayAppointmentProvider(allDayPInput));
    // final dayP = watch(calendarDayProvider(dayPInput));
    // final headP = watch(calendarHeaderProvider(headPInput));
    return pageTemplate(
      child: (cs) {
        return LayoutBuilder(builder: (context, cs) {
          //   return ResizableWidget(
          //     dragArea: 25,
          //     ballColor: Color(0xffFCF7F5).withOpacity(0.85),
          //     borderColor: Color(0xffFCF7F5),
          //     // centerWidget: Container(
          //     //   width: 15,
          //     //   height: 30,
          //     //   decoration: BoxDecoration(
          //     //     color: Colors.black,
          //     //     shape: BoxShape.rectangle,
          //     //   ),
          //     // ),
          //     // ballWidget: Container(
          //     //   width: 15,
          //     //   height: 15,
          //     //   decoration: BoxDecoration(
          //     //     color: Colors.black,
          //     //     shape: BoxShape.circle,
          //     //   ),
          //     // ),
          //     child: Container(
          //       color: Colors.amberAccent,
          //       child: Text(
          //           '''I've just did simple prototype to show main idea.
          // 1. Draw size handlers with container;
          // 2. Use GestureDetector to get new variables of sizes
          // 3. Refresh the main container size.'''),
          //     ),
          //   );
          return TimetableExample();
          // return TimetableConfig<BasicEvent>(
          //   // Required:
          //   // dateController: _dateController,
          //   // timeController: _timeController,
          //   eventBuilder: (context, event) => BasicEventWidget(event),
          //   child: MultiDateTimetable<BasicEvent>(),
          //   // Optional:
          //   // eventProvider: (date) {},
          //   allDayEventBuilder: (context, event, info) =>
          //       BasicAllDayEventWidget(event, info: info),
          //   callbacks: TimetableCallbacks(
          //       // onWeekTap, onDateTap, onDateBackgroundTap, onDateTimeBackgroundTap
          //       ),
          //   theme: TimetableThemeData(
          //     context,
          //     // startOfWeek: DateTime.monday,
          //     // See the "Theming" section below for more options.
          //   ),
          // );
        });
      },
    );
  }
}
