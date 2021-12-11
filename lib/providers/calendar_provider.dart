// import 'package:dartx/dartx.dart';
// import 'package:flutter/material.dart';

// import '../widgets/calendar/arg_type.dart';
// import '../widgets/calendar/enums.dart';
// import '../widgets/calendar/helpers/calendar_view_helper.dart';
// import '../widgets/calendar/helpers/datetime_helper.dart';
// import '../widgets/calendar/helpers/sf.dart';
// import '../widgets/calendar/models.dart';
// import '../widgets/calendar/styles.dart';

// class CalendarProviderInput {
//   final CalendarView currentView;
//   final SfCalendarThemeData _calendarTheme;
//   final List<DateTime> _visibleDates;
//   final DateTime _minDate;
//   final DateTime _maxDate;
//   final DateTime _selectedDate;
//   final BoxConstraints constriants;
//   final double textScaleFactor;
//   final bool isRTL;
//   final SfLocalizations localizations;
//   final bool isMobilePlatform;
//   final ViewHeaderStyle viewHeaderStyle;
//   final TimeSlotViewSettings timeSlotViewSettings;
//   final MonthViewSettings monthViewSettings;
//   final WeekNumberStyle weekNumberStyle;
//   final Color? cellBorderColor;
//   final String locale;
//   final CalendarAppointmentBuilder? appointmentBuilder;
//   final double cellEndPadding;
//   final TextStyle appointmentTextStyle;
//   final Decoration? selectionDecoration;
//   final List<DateTime>? blackoutDates;
//   final CalendarDataSource? dataSource;

//   CalendarProviderInput({
//     required this.constriants,
//     required this.localizations,
//     DateTime? minDate,
//     DateTime? maxDate,
//     DateTime? selectedDate,
//     List<DateTime>? visibleDates,
//     SfCalendarThemeData? calendarTheme,
//     this.textScaleFactor = 1,
//     this.isRTL = false,
//     this.currentView = CalendarView.day,
//     this.isMobilePlatform = true,
//     this.cellBorderColor = Colors.blue,
//     this.locale = "en_Us",
//     this.monthViewSettings = const MonthViewSettings(),
//     this.timeSlotViewSettings = const TimeSlotViewSettings(),
//     this.viewHeaderStyle = const ViewHeaderStyle(),
//     this.weekNumberStyle = const WeekNumberStyle(),
//     this.appointmentTextStyle = const TextStyle(),
//     this.cellEndPadding = 8,
//     this.appointmentBuilder,
//     this.selectionDecoration,
//     this.blackoutDates,
//     this.dataSource,
//   })  : this._calendarTheme = calendarTheme ??
//             SfCalendarThemeData(selectionBorderColor: Colors.amberAccent),
//         this._minDate = minDate ?? DateTime.now() - 365.days,
//         this._maxDate = maxDate ?? DateTime.now() + 365.days,
//         this._selectedDate = selectedDate ?? DateTime.now(),
//         this._visibleDates = visibleDates ??
//             getVisibleDates(
//               DateTime.now(),
//               [],
//               DateTime.monday,
//               DateTimeHelper.getViewDatesCount(currentView, 5),
//             ).cast();
// }

// class CalendarProvider extends ChangeNotifier {
//   CalendarProviderInput input;
//   late CalendarView currentView;
//   late SfCalendarThemeData calendarTheme;
//   late List<DateTime> visibleDates;
//   late DateTime minDate;
//   late DateTime maxDate;
//   late DateTime selectedDate;
//   late BoxConstraints constriants;
//   late double textScaleFactor;
//   late bool isRTL;
//   late SfLocalizations localizations;
//   late bool isMobilePlatform;
//   late ViewHeaderStyle viewHeaderStyle;
//   late TimeSlotViewSettings timeSlotViewSettings;
//   late MonthViewSettings monthViewSettings;
//   late WeekNumberStyle weekNumberStyle;
//   late Color? cellBorderColor;
//   late String locale;
//   late double cellEndPadding;
//   late CalendarAppointmentBuilder? appointmentBuilder;
//   late TextStyle appointmentTextStyle;
//   late Decoration? selectionDecoration;
//   late List<DateTime>? blackoutDates;
//   late CalendarDataSource? dataSource;
  

//   CalendarProvider(this.input) {
//     currentView = input.currentView;
//     visibleDates = input._visibleDates;
//     calendarTheme = input._calendarTheme;
//     minDate = input._minDate;
//     maxDate = input._maxDate;
//     selectedDate = input._selectedDate;
//     constriants = input.constriants;
//     textScaleFactor = input.textScaleFactor;
//     isRTL = input.isRTL;
//     localizations = input.localizations;
//     isMobilePlatform = input.isMobilePlatform;
//     viewHeaderStyle = input.viewHeaderStyle;
//     timeSlotViewSettings = input.timeSlotViewSettings;
//     monthViewSettings = input.monthViewSettings;
//     weekNumberStyle = input.weekNumberStyle;
//     cellBorderColor = input.cellBorderColor;
//     locale = input.locale;
//     cellEndPadding = input.cellEndPadding;
//     appointmentBuilder = input.appointmentBuilder;
//     appointmentTextStyle = input.appointmentTextStyle;
//     selectionDecoration = input.selectionDecoration;
//     blackoutDates = input.blackoutDates;
//     dataSource = input.dataSource;
//   }

//   d(Duration d) {
//     maxDate = maxDate + d;
//     print(maxDate);
//   }
// }

// class CalendarDayProviderInput {
//   final CalendarProvider parentProvider;
//   final double horizontalLinesCount;
//   final double timeIntervalHeight;
//   final double timeLabelWidth;
//   final Color cellBorderColor;
//   final TimeSlotViewSettings timeSlotViewSettings;
//   final ValueNotifier<Offset?> calendarCellNotifier;
//   final List<CalendarTimeRegion>? specialRegion;

//   CalendarDayProviderInput({
//     required this.parentProvider,
//     required this.horizontalLinesCount,
//     required this.timeIntervalHeight,
//     required this.timeLabelWidth,
//     required this.timeSlotViewSettings,
//     required this.calendarCellNotifier,
//     required this.specialRegion,
//     this.cellBorderColor = Colors.blue,
//   });
// }

// class CalendarDayProvider extends ChangeNotifier {
//   CalendarDayProviderInput input;

//   late CalendarProvider parentProvider;
//   late double horizontalLinesCount;
//   late double timeIntervalHeight;
//   late double timeLabelWidth;
//   late Color? cellBorderColor;
//   late TimeSlotViewSettings timeSlotViewSettings;
//   late ValueNotifier<Offset?> calendarCellNotifier;
//   late List<CalendarTimeRegion>? specialRegion;

//   CalendarDayProvider(this.input) {
//     parentProvider = input.parentProvider;
//     horizontalLinesCount = input.horizontalLinesCount;
//     timeIntervalHeight = input.timeIntervalHeight;
//     timeLabelWidth = input.timeLabelWidth;
//     timeSlotViewSettings = input.timeSlotViewSettings;
//     calendarCellNotifier = input.calendarCellNotifier;
//     specialRegion = input.specialRegion;
//     cellBorderColor = input.cellBorderColor;
//   }
// }

// class AllDayAppointmentProviderInput {
//   final CalendarProvider parentProvider;
//   final List<CalendarAppointment>? visibleAppointments;
//   final ValueNotifier<SelectionDetails?> repaintNotifier;
//   final UpdateCalendarState updateCalendarState;
//   final double timeLabelWidth;
//   final double allDayPainterHeight;
//   final ValueNotifier<Offset?> allDayHoverPosition;
//   final bool isExpandable;
//   final bool isExpanding;

//   AllDayAppointmentProviderInput({
//     required this.parentProvider,
//     required this.allDayHoverPosition,
//     required this.allDayPainterHeight,
//     required this.timeLabelWidth,
//     required this.repaintNotifier,
//     required this.updateCalendarState,
//     this.isExpandable = false,
//     this.isExpanding = false,
//     this.visibleAppointments = const <CalendarAppointment>[],
//   });
// }

// class AllDayAppointmentProvider extends ChangeNotifier {
//   AllDayAppointmentProviderInput input;

//   late CalendarProvider parentProvider;
//   late List<CalendarAppointment>? visibleAppointments;
//   late ValueNotifier<SelectionDetails?> repaintNotifier;
//   late UpdateCalendarState updateCalendarState;
//   late double timeLabelWidth;
//   late double allDayPainterHeight;
//   late ValueNotifier<Offset?> allDayHoverPosition;
//   late bool isExpandable;
//   late bool isExpanding;

//   AllDayAppointmentProvider(this.input) {
//     timeLabelWidth = input.timeLabelWidth;
//     parentProvider = input.parentProvider;
//     visibleAppointments = input.visibleAppointments;
//     repaintNotifier = input.repaintNotifier;
//     updateCalendarState = input.updateCalendarState;
//     timeLabelWidth = input.timeLabelWidth;
//     allDayPainterHeight = input.allDayPainterHeight;
//     allDayHoverPosition = input.allDayHoverPosition;
//     isExpandable = input.isExpandable;
//     isExpanding = input.isExpanding;
//   }
// }

// class CalendarHeaderProviderInput {
//   final CalendarProvider parentProvider;
//   final bool showWeekNumber;
//   final ValueNotifier<Offset?> viewHeaderNotifier;
//   final double viewHeaderHeight;
//   final double timeLabelWidth;
//   final TextStyle? todayTextStyle;
//   final Color? todayHighlightColor;

//   CalendarHeaderProviderInput({
//     required this.parentProvider,
//     required this.viewHeaderNotifier,
//     required this.viewHeaderHeight,
//     required this.timeLabelWidth,
//     this.showWeekNumber = false,
//     this.todayTextStyle,
//     this.todayHighlightColor,
//   });
// }

// class CalendarHeaderProvider extends ChangeNotifier {
//   CalendarHeaderProviderInput input;

//   late CalendarProvider parentProvider;
//   late bool showWeekNumber;
//   late ValueNotifier<Offset?> viewHeaderNotifier;
//   late double viewHeaderHeight;
//   late double timeLabelWidth;
//   late TextStyle? todayTextStyle;
//   late Color? todayHighlightColor;

//   CalendarHeaderProvider(this.input) {
//     timeLabelWidth = input.timeLabelWidth;
//     parentProvider = input.parentProvider;
//     showWeekNumber = input.showWeekNumber;
//     viewHeaderHeight = input.viewHeaderHeight;
//     viewHeaderNotifier = input.viewHeaderNotifier;
//     todayHighlightColor = input.todayHighlightColor;
//     todayTextStyle = input.todayTextStyle;
//   }
// }
