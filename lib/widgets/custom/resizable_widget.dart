import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResizableWidget extends StatefulWidget {
  final Widget child;
  final double ballDiameter;
  final double dragArea;
  final Color _ballColor;
  final Color _dragColor;
  final Color _borderColor;
  final double initialWidth;
  final double initialHeight;
  final double? maxWidth;
  final double? maxHeight;
  final Widget? ballWidget;
  final Widget? centerWidget;
  final double discreteStepSize;
  final bool stepsOn;

  ResizableWidget({
    required this.child,
    this.ballDiameter = 14.0,
    this.dragArea = 30.0,
    this.initialHeight = 400.0,
    this.initialWidth = 200.0,
    this.discreteStepSize = 50.0,
    this.stepsOn = false,
    this.maxWidth,
    this.maxHeight,
    this.ballWidget,
    this.centerWidget,
    Color? ballColor,
    Color? dragColor,
    Color? borderColor,
  })  : this._dragColor = dragColor ?? Colors.transparent,
        this._ballColor = ballColor ?? Colors.blue.withOpacity(0.35),
        this._borderColor = borderColor ?? Colors.grey;

  @override
  _ResizableWidgetState createState() => _ResizableWidgetState();
}

class _ResizableWidgetState extends State<ResizableWidget> {
  late double height;
  late double width;
  late BoxConstraints _constraints;

  double _top = 0;
  double _left = 0;
  double initX = 0;
  double initY = 0;
  bool _moving = false;

  double cumulativeDy = 0;
  double cumulativeDx = 0;
  double cumulativeMid = 0;

  void _onDrag(double dx, double dy) {
    var newHeight = height + dy;
    var newWidth = width + dx;

    setState(() {
      height = newHeight > 0 ? newHeight : 0;
      width = newWidth > 0 ? newWidth : 0;
    });
  }

  @override
  void initState() {
    height = widget.initialHeight;
    width = widget.initialWidth;
    _constraints = BoxConstraints(
      maxHeight: widget.maxHeight ?? double.maxFinite,
      maxWidth: widget.maxWidth ?? double.maxFinite,
      minHeight: widget.initialHeight,
      minWidth: widget.initialWidth,
    );
    super.initState();
  }

  double calMidBallOpc([bool isWidth = true]) {
    if (isWidth) {
      if (_constraints.maxWidth - (widget.dragArea * 3) <= 0) {
        return 0.01;
      } else {
        if (_constraints.maxWidth - (widget.dragArea * 3) > 148) {
          return 0.99;
        }
        return (_constraints.maxWidth - (widget.dragArea * 3)) / 150;
      }
    } else {
      if (_constraints.maxHeight - (widget.dragArea * 3) <= 0) {
        return 0.01;
      } else {
        if (_constraints.maxHeight - (widget.dragArea * 3) > 148) {
          return 0.99;
        }
        return (_constraints.maxHeight - (widget.dragArea * 3)) / 150;
      }
    }
  }

  Widget baseEdge({
    required double top,
    required double left,
    required void Function(double, double) onDrag,
    bool isEdge = false,
    bool isWidth = false,
    MouseCursor cursor = SystemMouseCursors.basic,
    Alignment alignment = const Alignment(1, -1),
  }) {
    return Positioned(
      top: top,
      left: left,
      child: MouseRegion(
        cursor: cursor,
        child: isEdge
            ? ManipulatingBall(
                ballDiameter: widget.ballDiameter,
                dragArea: widget.dragArea,
                ballWidget: widget.ballWidget,
                alignment: alignment,
                color: widget._ballColor,
                dragColor: widget._dragColor,
                onDrag: onDrag,
              )
            : Opacity(
                opacity: calMidBallOpc(isWidth),
                child: ManipulatingDiamond(
                  onDrag: onDrag,
                  centerWidget: widget.centerWidget,
                  dragColor: widget._dragColor,
                  color: widget._ballColor,
                  isWidth: isWidth,
                  dragArea: widget.dragArea,
                  constraints: _constraints,
                  ballDiameter: widget.ballDiameter,
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              border: Border.all(
                width: _moving ? 2 : 0.5,
                color: widget._borderColor,
              ),
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: LayoutBuilder(builder: (context, cs) {
              _constraints = cs;

              return MouseRegion(
                // cursor: _moving ? Theme.of(context).platform == TargetPlatform.windows
                //     ? SystemMouseCursors.move
                //     : SystemMouseCursors.grabbing : SystemMouseCursors.basic,
                cursor: SystemMouseCursors.basic,
                child: GestureDetector(
                  onLongPressEnd: (details) {
                    setState(() {
                      _moving = false;
                    });
                  },
                  onLongPressStart: (details) {
                    setState(() {
                      _moving = true;
                      initX = details.globalPosition.dx;
                      initY = details.globalPosition.dy;
                    });
                  },
                  onLongPressMoveUpdate: (details) {
                    setState(() {
                      var dx = details.globalPosition.dx - initX;
                      var dy = details.globalPosition.dy - initY;
                      initX = details.globalPosition.dx;
                      initY = details.globalPosition.dy;
                      _top += dy;
                      _left += dx;
                    });
                  },
                  child: widget.child,
                ),
              );
            }),
          ),
        ),
        // top left
        baseEdge(
          isEdge: true,
          cursor: SystemMouseCursors.resizeUpLeft,
          top: _top - widget.ballDiameter / 2,
          left: _left - widget.ballDiameter / 2,
          alignment: Alignment(-1, -1),
          onDrag: (dx, dy) {
            var mid = (dx + dy) / 2;
            var newHeight = height - 2 * mid;
            var newWidth = width - 2 * mid;

            setState(() {
              _top += mid;
              _left += mid;
              height = newHeight > 0 ? newHeight : 0;
              width = newWidth > 0 ? newWidth : 0;
            });
          },
        ),
        // top middle
        // if (widget.dragArea * 5<= _constraints.maxWidth)
        baseEdge(
          top: _top - widget.dragArea / 2,
          left: _left + widget.dragArea * 1.5,
          cursor: SystemMouseCursors.resizeUp,
          isWidth: true,
          onDrag: (dx, dy) {
            var newHeight = height - dy;

            setState(() {
              height = newHeight > 0 ? newHeight : 0;
              _top += dy;
            });
          },
        ),
        // top right
        baseEdge(
          isEdge: true,
          cursor: SystemMouseCursors.resizeUpRight,
          top: _top - widget.ballDiameter / 2,
          left: _left + width - (widget.dragArea - (widget.ballDiameter / 2)),
          onDrag: (dx, dy) {
            var mid = (dx + (dy * -1)) / 2;

            var newHeight = height + 2 * mid;
            var newWidth = width + 2 * mid;

            setState(() {
              height = newHeight > 0 ? newHeight : 0;
              width = newWidth > 0 ? newWidth : 0;
              _top -= mid;
              _left -= mid;
            });
          },
        ),
        // center right
        baseEdge(
          cursor: SystemMouseCursors.resizeRight,
          top: _top + widget.dragArea * 1.5,
          left: _left + width - widget.dragArea / 2,
          onDrag: (dx, dy) {
            var newWidth = width + dx;

            setState(() {
              width = newWidth > 0 ? newWidth : 0;
            });
          },
        ),
        // bottom right
        baseEdge(
          isEdge: true,
          cursor: SystemMouseCursors.resizeDownRight,
          top: _top + height - (widget.dragArea - (widget.ballDiameter / 2)),
          left: _left + width - (widget.dragArea - (widget.ballDiameter / 2)),
          alignment: Alignment(1, 1),
          onDrag: (dx, dy) {
            var mid = (dx + dy) / 2;

            var newHeight = height + 2 * mid;
            var newWidth = width + 2 * mid;

            setState(() {
              height = newHeight > 0 ? newHeight : 0;
              width = newWidth > 0 ? newWidth : 0;
              _top -= mid;
              _left -= mid;
            });
          },
        ),
        // bottom center
        baseEdge(
          top: _top + height - widget.dragArea / 2,
          left: _left + widget.dragArea * 1.5,
          cursor: SystemMouseCursors.resizeDown,
          isWidth: true,
          onDrag: (dx, dy) {
            var newHeight = height + dy;

            setState(() {
              height = newHeight > 0 ? newHeight : 0;
            });
          },
        ),
        // bottom left
        baseEdge(
          isEdge: true,
          cursor: SystemMouseCursors.resizeDownLeft,
          top: _top + height - (widget.dragArea - (widget.ballDiameter / 2)),
          left: _left - widget.ballDiameter / 2,
          alignment: Alignment(-1, 1),
          onDrag: (dx, dy) {
            var mid = ((dx * -1) + dy) / 2;

            var newHeight = height + 2 * mid;
            var newWidth = width + 2 * mid;

            setState(() {
              height = newHeight > 0 ? newHeight : 0;
              width = newWidth > 0 ? newWidth : 0;
              _top -= mid;
              _left -= mid;
            });
          },
        ),
        //left center
        baseEdge(
          top: _top + widget.dragArea * 1.5,
          left: _left - widget.dragArea / 2,
          cursor: SystemMouseCursors.resizeLeft,
          onDrag: (dx, dy) {
            var newWidth = width - dx;

            setState(() {
              width = newWidth > 0 ? newWidth : 0;
              _left += dx;
            });
          },
        ),
      ],
    );
  }
}

class ManipulatingBall extends StatefulWidget {
  final void Function(double, double) onDrag;
  final double ballDiameter;
  final double dragArea;
  final Color _color;
  final Color _dragColor;
  final Alignment alignment;
  final Widget? ballWidget;

  ManipulatingBall({
    Key? key,
    required this.onDrag,
    required this.alignment,
    this.ballDiameter = 20.0,
    this.dragArea = 40.0,
    this.ballWidget,
    Color? color,
    Color? dragColor,
  })  : this._color = color ?? Colors.blue.withOpacity(0.3),
        this._dragColor = dragColor ?? Colors.green.withOpacity(0.1);

  @override
  _ManipulatingBallState createState() => _ManipulatingBallState();
}

class _ManipulatingBallState extends State<ManipulatingBall> {
  late double initX;
  late double initY;

  _handleDrag(DragStartDetails details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(DragUpdateDetails details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: Container(
        height: widget.dragArea,
        width: widget.dragArea,
        color: widget._dragColor,
        // All Widgets For Painting shoould know Hieght, Width and **Position**
        child: Align(
          alignment: widget.alignment,
          child: widget.ballWidget ??
              Container(
                width: widget.ballDiameter,
                height: widget.ballDiameter,
                decoration: BoxDecoration(
                  color: widget._color,
                  shape: BoxShape.circle,
                ),
              ),
        ),
      ),
    );
  }
}

class ManipulatingDiamond extends StatefulWidget {
  final void Function(double, double) onDrag;
  final double ballDiameter;
  final double dragArea;
  final BoxConstraints constraints;
  final Color _color;
  final Color _dragColor;
  final bool isWidth;
  final Widget? centerWidget;

  ManipulatingDiamond({
    Key? key,
    required this.onDrag,
    required this.constraints,
    required this.isWidth,
    this.ballDiameter = 20.0,
    this.dragArea = 40.0,
    this.centerWidget,
    Color? color,
    Color? dragColor,
  })  : this._color = color ?? Colors.blue.withOpacity(0.3),
        this._dragColor = dragColor ?? Colors.green.withOpacity(0.1);

  @override
  _ManipulatingDiamondState createState() => _ManipulatingDiamondState();
}

class _ManipulatingDiamondState extends State<ManipulatingDiamond> {
  late double initX;
  late double initY;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    var maxDragHeight = widget.constraints.maxHeight - (widget.dragArea * 3);
    var maxDragWidth = widget.constraints.maxWidth - (widget.dragArea * 3);
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: Container(
        height: widget.isWidth
            ? widget.dragArea
            : maxDragHeight > 0
                ? maxDragHeight
                : 0,
        width: !widget.isWidth
            ? widget.dragArea
            : maxDragWidth > 0
                ? maxDragWidth
                : 0,
        color: widget._dragColor,
        // All Widgets For Painting shoould know Hieght, Width and **Position**
        child: Align(
          alignment: Alignment(0, 0),
          child: (widget.isWidth && widget.centerWidget != null
                  ? Transform.rotate(
                      angle: math.pi / 2, child: widget.centerWidget)
                  : widget.centerWidget) ??
              Container(
                height: widget.isWidth
                    ? widget.ballDiameter / 1.5
                    : widget.ballDiameter * 2,
                width: widget.isWidth
                    ? widget.ballDiameter * 2
                    : widget.ballDiameter / 1.5,
                decoration: BoxDecoration(
                  color: widget._color,
                  borderRadius: BorderRadius.circular(widget.ballDiameter / 2),
                  shape: BoxShape.rectangle,
                ),
              ),
        ),
      ),
    );
  }
}
