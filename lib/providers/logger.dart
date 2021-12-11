import 'package:dartx/dartx.dart';
import 'package:logger/logger.dart';

Logger? _logger;

Logger getLogger(String className) {
  return _logger ??
      (_logger = Logger(
        printer: SecondLogger(
          className: className,
        ),
      ));
}

class SecondLogger extends LogPrinter {
  final String className;

  SecondLogger({required this.className});

  @override
  List<String> log(LogEvent event) {
  final level = event.level;
    final color = PrettyPrinter.levelColors[level]!;
    final emoji = PrettyPrinter.levelEmojis[level];
    final divider = PrettyPrinter.doubleDivider;
    final middle = PrettyPrinter.middleCorner;
    final verticalLine = PrettyPrinter.verticalLine;
    int methodCount;
    if (level == Level.debug) {
      methodCount = 2;
    } else if (level == Level.error || level == Level.wtf) {
      methodCount = -1;
    } else if (level == Level.warning) {
      methodCount = 4;
    } else {
      methodCount = 1;
    }
    final res =
        PrettyPrinter().formatStackTrace(StackTrace.current, methodCount)!;
    final preLog = <String>[
      "$emoji  $className - ${event.message}",
    ];
    return [
      color(middle + divider * 25),
      ...preLog.map((v) => color("$verticalLine $v")),
      ...res.split("\n").drop(1).map((v) => "$verticalLine $v")
    ];
  }
}
