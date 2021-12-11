import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uix/flutter_uix.dart';

import '../../utils/helpers.dart';

class SearchPickerDialog<T> extends StatefulWidget {
  final ValueChanged<T> onValuePicked;
  final String? semanticLabel;
  final bool isSearchable;
  final Color? searchCursorColor;
  final List<T> values;
  final String title;
  final String notFoundStr;
  final String searchStr;
  final List<T> Function(List<T>) searchFn;
  final double height;
  final double width;

  SearchPickerDialog({
    Key? key,
    required this.height,
    required this.width,
    required this.onValuePicked,
    required this.values,
    required this.notFoundStr,
    required this.searchStr,
    required this.searchFn,
    required this.title,
    this.semanticLabel,
    this.isSearchable = true,
    this.searchCursorColor,
  }) : super(key: key);

  @override
  SingleChoiceDialogState createState() {
    return new SingleChoiceDialogState();
  }
}

class SingleChoiceDialogState<T> extends State<SearchPickerDialog<T>> {
  late List<T> _allValues;
  late List<T> _filteredValues;

  @override
  void initState() {
    _allValues = widget.values;
    _filteredValues = _allValues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      padding: EdgeInsets.fromLTRB(widget.width * 0.08, widget.height * 0.05,
          widget.width * 0.08, widget.height * 0.05),
      decoration: BoxDecoration(
        color: Color(0xff222344),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Semantics(
        namesRoute: true,
        hint: widget.title,
        label: widget.title,
        child: DefaultTextStyle(
          style: textStyle(14, weight: FontWeight.w400, color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    widget.title,
                    style: textStyle(15, color: Colors.white),
                  ),
                ).pLTRB(0, 2, 0, 4),
                if (widget.isSearchable)
                  TextField(
                    cursorColor: widget.searchCursorColor,
                    decoration: InputDecoration(
                      hintText: " " + widget.searchStr,
                      hintStyle: textStyle(
                        15,
                        color: Colors.white,
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    ),
                    style: textStyle(14, color: Colors.white),
                    onChanged: (String value) {
                      setState(
                        () {
                          // _filteredValues = _allValues
                          //     .where((T language) =>
                          //         language.name
                          //             .toLowerCase()
                          //             .startsWith(value.toLowerCase()) ||
                          //         language.isoCode
                          //             .toLowerCase()
                          //             .startsWith(value.toLowerCase()))
                          //     .toList();
                          _filteredValues = widget.searchFn(_allValues);
                        },
                      );
                    },
                  ).pSy(y: 4),
                _buildContent(context),
                // if (actions != null) {
                //   ButtonBar(
                //     children: actions!,
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildContent(BuildContext context) {
    return _filteredValues.isNotEmpty
        ? ListView(
            shrinkWrap: true,
            children: _filteredValues
                .map(
                  (item) => SimpleDialogOption(
                    child: Text(T.toString()),
                    onPressed: () {
                      widget.onValuePicked(item);
                    },
                  ),
                )
                .toList(),
          ).pLTRB(0, 4, 0, 0)
        : Center(
            child: Text(
              widget.notFoundStr,
              style: textStyle(15, color: Colors.white),
            ),
          ).pLTRB(0, 8, 0, 0);
  }
}
