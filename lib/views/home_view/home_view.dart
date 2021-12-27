import 'dart:math';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dartx/dartx.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../core/providers.dart';
import '../../widgets/calendar_timeline/calendar_timeline.dart';

class HomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.watch(homeProvider.notifier);
    return LayoutBuilder(builder: (context, cs) {
      return Scaffold(
        //   body:
        // body: ResizingCalendar(),
        body: CalendarControllerProvider(
          controller: EventController(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CalendarTimeline(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now() - 180.weeks,
                  lastDate: DateTime.now() + 180.weeks,
                  onDateSelected: (date) => print(date),
                  leftMargin: 10,
                  monthColor: Colors.blueGrey,
                  dayColor: Colors.teal[200],
                  dotsColor: Colors.white,
                  activeBackgroundDayColor: Color(0xFF333A47),
                  activeDayColor: Colors.orange.shade300,
                  locale: 'en_ISO',
                ),
              ),
              SliverFillRemaining(
                child: DayView(
                  showLiveTimeLineInAllDays: true,
                  showVerticalLine: true,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

// class ResizingCalendar extends StatefulWidget {
//   const ResizingCalendar({Key? key}) : super(key: key);

//   @override
//   _ResizingCalendarState createState() => _ResizingCalendarState();
// }

// class _ResizingCalendarState extends State<ResizingCalendar> {
//   _ResizingCalendarState();

//   _DataSource _events = _DataSource(<Appointment>[]);
//   late CalendarView _currentView;

//   final List<CalendarView> _allowedViews = <CalendarView>[
//     CalendarView.day,
//     CalendarView.week,
//     CalendarView.workWeek,
//     CalendarView.month,
//   ];

//   final GlobalKey _globalKey = GlobalKey();
//   final ScrollController _controller = ScrollController();
//   final CalendarController _calendarController = CalendarController();

//   @override
//   void initState() {
//     _currentView = CalendarView.month;
//     _calendarController.view = _currentView;
//     _events = _DataSource(getAppointmentDetails());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Widget calendar = Theme(
//         data: ThemeData(),
//         key: _globalKey,
//         child:
//             _getResizingCalendar(_calendarController, _events, _onViewChanged));

//     final double screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Row(children: <Widget>[
//         Expanded(
//           child: _calendarController.view == CalendarView.month &&
//                   screenHeight < 800
//               ? Scrollbar(
//                   isAlwaysShown: true,
//                   controller: _controller,
//                   child: ListView(
//                     controller: _controller,
//                     children: <Widget>[
//                       Container(
//                         color: Colors.blueGrey,
//                         height: 600,
//                         child: calendar,
//                       )
//                     ],
//                   ))
//               : Container(color: Colors.white, child: calendar),
//         )
//       ]),
//     );
//   }

//   void _onViewChanged(ViewChangedDetails viewChangedDetails) {
//     if (_currentView != CalendarView.month &&
//         _calendarController.view != CalendarView.month) {
//       _currentView = _calendarController.view!;
//       return;
//     }

//     _currentView = _calendarController.view!;
//     SchedulerBinding.instance?.addPostFrameCallback((Duration timeStamp) {
//       setState(() {
//         // Update the scroll view when view changes.
//       });
//     });
//   }

//   /// Creates the required appointment details as a list.
//   List<Appointment> getAppointmentDetails() {
//     final List<String> subjectCollection = <String>[];
//     subjectCollection.add('General Meeting');
//     subjectCollection.add('Plan Execution');
//     subjectCollection.add('Project Plan');
//     subjectCollection.add('Consulting');
//     subjectCollection.add('Support');
//     subjectCollection.add('Development Meeting');
//     subjectCollection.add('Scrum');
//     subjectCollection.add('Project Completion');
//     subjectCollection.add('Release updates');
//     subjectCollection.add('Performance Check');

//     final List<Color> colorCollection = <Color>[];
//     colorCollection.add(const Color(0xFF0F8644));
//     colorCollection.add(const Color(0xFF8B1FA9));
//     colorCollection.add(const Color(0xFFD20100));
//     colorCollection.add(const Color(0xFFFC571D));
//     colorCollection.add(const Color(0xFF36B37B));
//     colorCollection.add(const Color(0xFF01A1EF));
//     colorCollection.add(const Color(0xFF3D4FB5));
//     colorCollection.add(const Color(0xFFE47C73));
//     colorCollection.add(const Color(0xFF636363));
//     colorCollection.add(const Color(0xFF0A8043));

//     final List<Appointment> appointments = <Appointment>[];
//     final Random random = Random();
//     DateTime today = DateTime.now();
//     final DateTime rangeStartDate =
//         today.add(const Duration(days: -(365 ~/ 2)));
//     final DateTime rangeEndDate = today.add(const Duration(days: 365));
//     for (DateTime i = rangeStartDate;
//         i.isBefore(rangeEndDate);
//         i = i.add(const Duration(days: 1))) {
//       final DateTime date = i;
//       final int count = random.nextInt(2);
//       for (int j = 0; j < count; j++) {
//         final DateTime startDate = DateTime(
//             date.year, date.month, date.day, 8 + random.nextInt(8), 0, 0);
//         appointments.add(Appointment(
//           subject: subjectCollection[random.nextInt(7)],
//           startTime: startDate,
//           endTime: startDate.add(Duration(hours: 1 + random.nextInt(3))),
//           color: colorCollection[random.nextInt(9)],
//         ));
//       }
//     }

//     today = DateTime(today.year, today.month, today.day, 9);
//     // added recurrence appointment
//     appointments.add(Appointment(
//         subject: 'Development status',
//         startTime: today,
//         endTime: today.add(const Duration(hours: 2)),
//         color: colorCollection[random.nextInt(9)],
//         recurrenceRule: 'FREQ=WEEKLY;BYDAY=FR;INTERVAL=1'));
//     return appointments;
//   }

//   /// Returns the calendar widget based on the properties passed.
//   SfCalendar _getResizingCalendar(
//       [CalendarController? calendarController,
//       CalendarDataSource? calendarDataSource,
//       ViewChangedCallback? viewChangedCallback]) {
//     return SfCalendar(
//       controller: calendarController,
//       dataSource: calendarDataSource,
//       allowedViews: _allowedViews,
//       showNavigationArrow: false,
//       onViewChanged: viewChangedCallback,
//       allowAppointmentResize: true,
//       allowDragAndDrop: true,
//       showDatePickerButton: true,
//       monthViewSettings: const MonthViewSettings(
//         appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
//       ),
//     );
//   }
// }

// class _DataSource extends CalendarDataSource {
//   _DataSource(List<Appointment> source) {
//     appointments = source;
//   }
// }
