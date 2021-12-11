import 'dart:math';

import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supercharged/supercharged.dart';

import '../../widgets/calendar/timetable.dart';

class TimetableExample extends StatefulWidget {
  @override
  _TimetableExampleState createState() => _TimetableExampleState();
}

class _TimetableExampleState extends State<TimetableExample>
    with TickerProviderStateMixin {
  var _visibleDateRange = PredefinedVisibleDateRange.week;
  void _updateVisibleDateRange(PredefinedVisibleDateRange newValue) {
    setState(() {
      _visibleDateRange = newValue;
      _dateController.visibleRange = newValue.visibleDateRange;
    });
  }

  bool get _isRecurringLayout =>
      _visibleDateRange == PredefinedVisibleDateRange.fixed;

  late final _dateController = DateController(
    // All parameters are optional.
    // initialDate: DateTimeTimetable.today(),
    visibleRange: _visibleDateRange.visibleDateRange,
  );

  final _timeController = TimeController(
    // All parameters are optional.
    // initialRange: TimeRange(8.hours, 20.hours),
    maxRange: TimeRange(0.hours, 24.hours),
  );

  final _draggedEvents = <BasicEvent>[];

  @override
  void dispose() {
    _timeController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TimetableConfig<BasicEvent>(
      // Required:
      dateController: _dateController,
      timeController: _timeController,
      eventBuilder: (context, event) => _buildPartDayEvent(event),
      child: Column(children: [
        _buildAppBar(),
        Expanded(
          child: _isRecurringLayout
              ? RecurringMultiDateTimetable<BasicEvent>()
              : MultiDateTimetable<BasicEvent>(),
        ),
      ]),
      // Optional:
      eventProvider: eventProviderFromFixedList(positioningDemoEvents),
      allDayEventBuilder: (context, event, info) => BasicAllDayEventWidget(
        event,
        info: info,
        onTap: () => _showSnackBar('All-day event $event tapped'),
      ),
      timeOverlayProvider: mergeTimeOverlayProviders([
        positioningDemoOverlayProvider,
        (context, date) => _draggedEvents
            .map((it) =>
                it.toTimeOverlay(date: date, widget: BasicEventWidget(it)))
            .whereNotNull()
            .toList(),
      ]),
      callbacks: TimetableCallbacks(
        onWeekTap: (week) {
          _showSnackBar('Tapped on week $week.');
          _updateVisibleDateRange(PredefinedVisibleDateRange.week);
          _dateController.animateTo(
            week.getDayOfWeek(DateTime.monday),
            vsync: this,
          );
        },
        onDateTap: (date) {
          _showSnackBar('Tapped on date $date.');
          _dateController.animateTo(date, vsync: this);
        },
        onDateBackgroundTap: (date) =>
            _showSnackBar('Tapped on date background at $date.'),
        onDateTimeBackgroundTap: (dateTime) =>
            _showSnackBar('Tapped on date-time background at $dateTime.'),
      ),
      theme: TimetableThemeData(
        context,
        // startOfWeek: DateTime.monday,
        // dateDividersStyle: DateDividersStyle(
        //   context,
        //   color: Colors.blue.withOpacity(.3),
        //   width: 2,
        // ),
        // nowIndicatorStyle: NowIndicatorStyle(
        //   context,
        //   lineColor: Colors.green,
        //   shape: TriangleNowIndicatorShape(color: Colors.green),
        // ),
        // timeIndicatorStyleProvider: (time) => TimeIndicatorStyle(
        //   context,
        //   time,
        //   alwaysUse24HourFormat: false,
        // ),
      ),
    );
  }

  Widget _buildPartDayEvent(BasicEvent event) {
    final roundedTo = 15.minutes;

    return PartDayDraggableEvent(
      onDragStart: () => setState(() {
        _draggedEvents.add(event.copyWith(showOnTop: true));
      }),
      onDragUpdate: (dateTime) => setState(() {
        dateTime = dateTime.roundTimeToMultipleOf(roundedTo);
        final index = _draggedEvents.indexWhere((it) => it.id == event.id);
        final oldEvent = _draggedEvents[index];
        _draggedEvents[index] = oldEvent.copyWith(
          start: dateTime,
          end: dateTime + oldEvent.duration,
        );
      }),
      onDragEnd: (dateTime) {
        dateTime = (dateTime ?? event.start).roundTimeToMultipleOf(roundedTo);
        setState(() => _draggedEvents.removeWhere((it) => it.id == event.id));
        _showSnackBar('Dragged event to $dateTime.');
      },
      onDragCanceled: (isMoved) => _showSnackBar('Your finger moved: $isMoved'),
      child: BasicEventWidget(
        event,
        onTap: () => _showSnackBar('Part-day event $event tapped'),
      ),
    );
  }

  Widget _buildAppBar() {
    final colorScheme = context.theme.colorScheme;
    Widget child = AppBar(
      elevation: 0,
      titleTextStyle: TextStyle(color: colorScheme.onSurface),
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.transparent,
      title: _isRecurringLayout
          ? null
          : MonthIndicator.forController(_dateController),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.today),
          onPressed: () {
            _dateController.animateToToday(vsync: this);
            _timeController.animateToShowFullDay(vsync: this);
          },
          tooltip: 'Go to today',
        ),
        SizedBox(width: 8),
        DropdownButton<PredefinedVisibleDateRange>(
          onChanged: (visibleRange) => _updateVisibleDateRange(visibleRange!),
          value: _visibleDateRange,
          items: [
            for (final visibleRange in PredefinedVisibleDateRange.values)
              DropdownMenuItem(
                value: visibleRange,
                child: Text(visibleRange.title),
              ),
          ],
        ),
        SizedBox(width: 16),
      ],
    );

    if (!_isRecurringLayout) {
      child = Column(children: [
        child,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Builder(builder: (context) {
            return DefaultTimetableCallbacks(
              callbacks: DefaultTimetableCallbacks.of(context)!.copyWith(
                onDateTap: (date) {
                  _showSnackBar('Tapped on date $date.');
                  _updateVisibleDateRange(PredefinedVisibleDateRange.day);
                  _dateController.animateTo(date, vsync: this);
                },
              ),
              child: CompactMonthTimetable(),
            );
          }),
        ),
      ]);
    }

    return Material(color: colorScheme.surface, elevation: 4, child: child);
  }

  void _showSnackBar(String content) =>
      context.scaffoldMessenger.showSnackBar(SnackBar(content: Text(content)));
}

enum PredefinedVisibleDateRange { day, threeDays, workWeek, week, fixed }

extension on PredefinedVisibleDateRange {
  VisibleDateRange get visibleDateRange {
    switch (this) {
      case PredefinedVisibleDateRange.day:
        return VisibleDateRange.days(1);
      case PredefinedVisibleDateRange.threeDays:
        return VisibleDateRange.days(3);
      case PredefinedVisibleDateRange.workWeek:
        return VisibleDateRange.weekAligned(5);
      case PredefinedVisibleDateRange.week:
        return VisibleDateRange.week();
      case PredefinedVisibleDateRange.fixed:
        return VisibleDateRange.fixed(
          DateTimeTimetable.today(),
          DateTime.daysPerWeek,
        );
    }
  }

  String get title {
    switch (this) {
      case PredefinedVisibleDateRange.day:
        return 'Day';
      case PredefinedVisibleDateRange.threeDays:
        return '3 Days';
      case PredefinedVisibleDateRange.workWeek:
        return 'Work Week';
      case PredefinedVisibleDateRange.week:
        return 'Week';
      case PredefinedVisibleDateRange.fixed:
        return '7 Days (fixed)';
    }
  }
}
final positioningDemoEvents = <BasicEvent>[
  _DemoEvent(0, 0, Duration(hours: 10), Duration(hours: 11)),
  _DemoEvent(0, 1, Duration(hours: 11), Duration(hours: 12)),
  _DemoEvent(0, 2, Duration(hours: 12), Duration(hours: 13)),
  _DemoEvent(1, 0, Duration(hours: 10), Duration(hours: 12)),
  _DemoEvent(1, 1, Duration(hours: 10), Duration(hours: 12)),
  _DemoEvent(1, 2, Duration(hours: 14), Duration(hours: 16)),
  _DemoEvent(1, 3, Duration(hours: 14, minutes: 15), Duration(hours: 16)),
  _DemoEvent(2, 0, Duration(hours: 10), Duration(hours: 20)),
  _DemoEvent(2, 1, Duration(hours: 10), Duration(hours: 12)),
  _DemoEvent(2, 2, Duration(hours: 13), Duration(hours: 15)),
  _DemoEvent(3, 0, Duration(hours: 10), Duration(hours: 20)),
  _DemoEvent(3, 1, Duration(hours: 12), Duration(hours: 14)),
  _DemoEvent(3, 2, Duration(hours: 12), Duration(hours: 15)),
  _DemoEvent(4, 0, Duration(hours: 10), Duration(hours: 13)),
  _DemoEvent(4, 1, Duration(hours: 10, minutes: 15), Duration(hours: 13)),
  _DemoEvent(4, 2, Duration(hours: 10, minutes: 30), Duration(hours: 13)),
  _DemoEvent(4, 3, Duration(hours: 10, minutes: 45), Duration(hours: 13)),
  _DemoEvent(4, 4, Duration(hours: 11), Duration(hours: 13)),
  _DemoEvent(
    5,
    0,
    Duration(hours: 10, minutes: 30),
    Duration(hours: 13, minutes: 30),
  ),
  _DemoEvent(
    5,
    1,
    Duration(hours: 10, minutes: 30),
    Duration(hours: 13, minutes: 30),
  ),
  _DemoEvent(
    5,
    2,
    Duration(hours: 10, minutes: 30),
    Duration(hours: 12, minutes: 30),
  ),
  _DemoEvent(5, 3, Duration(hours: 8, minutes: 30), Duration(hours: 18)),
  _DemoEvent(5, 4, Duration(hours: 15, minutes: 30), Duration(hours: 16)),
  _DemoEvent(5, 5, Duration(hours: 11), Duration(hours: 12)),
  _DemoEvent(5, 6, Duration(hours: 1), Duration(hours: 2)),
  _DemoEvent(
    6,
    0,
    Duration(hours: 9, minutes: 30),
    Duration(hours: 15, minutes: 30),
  ),
  _DemoEvent(6, 1, Duration(hours: 11), Duration(hours: 13)),
  _DemoEvent(
    6,
    2,
    Duration(hours: 9, minutes: 30),
    Duration(hours: 11, minutes: 30),
  ),
  _DemoEvent(
    6,
    3,
    Duration(hours: 9, minutes: 30),
    Duration(hours: 10, minutes: 30),
  ),
  _DemoEvent(6, 4, Duration(hours: 10), Duration(hours: 11)),
  _DemoEvent(6, 5, Duration(hours: 10), Duration(hours: 11)),
  _DemoEvent(
    6,
    6,
    Duration(hours: 9, minutes: 30),
    Duration(hours: 10, minutes: 30),
  ),
  _DemoEvent(
    6,
    7,
    Duration(hours: 9, minutes: 30),
    Duration(hours: 10, minutes: 30),
  ),
  _DemoEvent(
    6,
    8,
    Duration(hours: 9, minutes: 30),
    Duration(hours: 10, minutes: 30),
  ),
  _DemoEvent(
    6,
    9,
    Duration(hours: 10, minutes: 30),
    Duration(hours: 12, minutes: 30),
  ),
  _DemoEvent(6, 10, Duration(hours: 12), Duration(hours: 13)),
  _DemoEvent(6, 11, Duration(hours: 12), Duration(hours: 13)),
  _DemoEvent(6, 12, Duration(hours: 12), Duration(hours: 13)),
  _DemoEvent(6, 13, Duration(hours: 12), Duration(hours: 13)),
  _DemoEvent(6, 14, Duration(hours: 6, minutes: 30), Duration(hours: 8)),
  _DemoEvent(
    7,
    0,
    Duration(hours: 2, minutes: 30),
    Duration(hours: 4, minutes: 30),
  ),
  _DemoEvent(
    7,
    1,
    Duration(hours: 2, minutes: 30),
    Duration(hours: 3, minutes: 30),
  ),
  _DemoEvent(7, 2, Duration(hours: 3), Duration(hours: 4)),
  _DemoEvent(8, 0, Duration(hours: 20), Duration(hours: 4), endDateOffset: 1),
  _DemoEvent(9, 1, Duration(hours: 12), Duration(hours: 16)),
  _DemoEvent(9, 2, Duration(hours: 12), Duration(hours: 13)),
  _DemoEvent(9, 3, Duration(hours: 12), Duration(hours: 13)),
  _DemoEvent(9, 4, Duration(hours: 12), Duration(hours: 13)),
  _DemoEvent(9, 5, Duration(hours: 15), Duration(hours: 16)),
  _DemoEvent.allDay(0, 0, 1),
  _DemoEvent.allDay(1, 1, 1),
  _DemoEvent.allDay(2, 0, 2),
  _DemoEvent.allDay(3, 2, 2),
  _DemoEvent.allDay(4, 2, 2),
  _DemoEvent.allDay(5, 1, 2),
  _DemoEvent.allDay(6, 3, 2),
  _DemoEvent.allDay(7, 4, 4),
  _DemoEvent.allDay(8, -1, 2),
  _DemoEvent.allDay(9, -2, 2),
  _DemoEvent.allDay(10, -3, 2),
];

class _DemoEvent extends BasicEvent {
  _DemoEvent(
    int demoId,
    int eventId,
    Duration start,
    Duration end, {
    int endDateOffset = 0,
  }) : super(
          id: '$demoId-$eventId',
          title: '$demoId-$eventId',
          backgroundColor: _getColor('$demoId-$eventId'),
          start: DateTime.now().toUtc().atStartOfDay + demoId.days + start,
          end: DateTime.now().toUtc().atStartOfDay +
              (demoId + endDateOffset).days +
              end,
        );

  _DemoEvent.allDay(int id, int startOffset, int length)
      : super(
          id: 'a-$id',
          title: 'a-$id',
          backgroundColor: _getColor('a-$id'),
          start: DateTime.now().toUtc().atStartOfDay + startOffset.days,
          end:
              DateTime.now().toUtc().atStartOfDay + (startOffset + length).days,
        );

  static Color _getColor(String id) {
    return Random(id.hashCode)
        .nextColorHsv(saturation: 0.6, value: 0.8, alpha: 1)
        .toColor();
  }
}

List<TimeOverlay> positioningDemoOverlayProvider(
  BuildContext context,
  DateTime date,
) {
  assert(date.isValidTimetableDate);

  final widget =
      ColoredBox(color: context.theme.brightness.contrastColor.withOpacity(.1));

  if (DateTime.monday <= date.weekday && date.weekday <= DateTime.friday) {
    return [
      TimeOverlay(start: 0.hours, end: 8.hours, widget: widget),
      TimeOverlay(start: 20.hours, end: 24.hours, widget: widget),
    ];
  } else {
    return [TimeOverlay(start: 0.hours, end: 24.hours, widget: widget)];
  }
}
