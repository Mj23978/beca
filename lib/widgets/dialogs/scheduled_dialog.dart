import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_uix/flutter_uix.dart';
import 'package:intl/intl.dart';

class ScheduledDialog extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final BoxConstraints? constraints;
  final Color? backgroundColor;

  ScheduledDialog({
    required this.formKey,
    this.backgroundColor,
    this.constraints,
  });

  final Widget title = [
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        "Scheduled once on 6 April 2020",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
    ),
    12.heightBox,
    SizedBox(
      width: double.infinity,
      child: CupertinoSegmentedControl<String>(
        onValueChanged: (v) => print(v),
        children: {
          "Once": Text("Once"),
          "Daily": Text("Daily"),
          "Weekly": Text("Weekly"),
          "Monthly": Text("Monthly"),
          "Annually": Text("Annualy"),
        },
        groupValue: "Daily",
      ),
    ),
  ].column();
  final Widget content = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      [
        10.heightBox,
        <Widget>[
          Text(
            "Repeats Every 1 Day",
            style: TextStyle(color: Colors.blueAccent),
          ),
          FormBuilderField<double>(
            name: "slider",
            // valueTransformer: ,
            initialValue: 1,

            builder: (state) {
              return Slider(
                value: 1,
                min: 1,
                max: 14,
                divisions: 13,
                onChangeEnd: (v) => print(v),
                onChangeStart: (v) => print(v),
                onChanged: (v) => print(v),
              );
            },
          ).pSy(y: 4)
        ].column().pb(10),
        if (true)
          [
            [
              Text(
                "Date",
                style: TextStyle(color: Colors.blueAccent),
              ),
              FormBuilderDateTimePicker(
                name: "date",
                inputType: InputType.date,
                initialDate: DateTime.now(),
                format: DateFormat("yyyy-MM-dd"),
                initialValue: DateTime.now(),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ].column(alignment: MainAxisAlignment.start),
            16.widthBox,
            [
              Text(
                "Time",
                style: TextStyle(color: Colors.blueAccent),
              ),
              FormBuilderDateTimePicker(
                name: "time",
                inputType: InputType.time,
                initialValue: DateTime.now(),
                initialDate: DateTime.now(),
                format: DateFormat("HH:mm"),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ].column()
          ].row().pb(10),
        [
          Text(
            "Ends",
            style: TextStyle(color: Colors.blueAccent),
          ),
          FormBuilderField<double>(
            name: "slider",
            // valueTransformer: ,
            initialValue: 1,
            builder: (state) {
              return [
                [
                  Radio<String>(
                    value: "On",
                    groupValue: "Never",
                    activeColor: Colors.blueAccent,
                    onChanged: (v) => print(v),
                  ),
                  Text(
                    "On",
                    style: TextStyle(
                      // color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  10.widthBox,
                  FormBuilderDateTimePicker(
                    name: "date",
                    inputType: InputType.date,
                    initialDate: DateTime.now(),
                    format: DateFormat("yyyy-MM-dd"),
                    initialValue: DateTime.now(),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ].row(crossAlignment: CrossAxisAlignment.center),
                [
                  [
                    Radio<String>(
                      value: "On",
                      groupValue: "Never",
                      activeColor: Colors.blueAccent,
                      onChanged: (v) => print(v),
                    ),
                    Text(
                      "After 1 Event",
                      style: TextStyle(
                        // color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ].row(crossAlignment: CrossAxisAlignment.center),
                  FormBuilderField<double>(
                    name: "slider",
                    // valueTransformer: ,
                    initialValue: 1,
                    builder: (state) {
                      return Slider(
                        value: 1,
                        min: 1,
                        max: 14,
                        divisions: 13,
                        onChangeEnd: (v) => print(v),
                        onChangeStart: (v) => print(v),
                        onChanged: (v) => print(v),
                      );
                    },
                  ).pSy(y: 4)
                ].column(crossAlignment: CrossAxisAlignment.start),
                [
                  Radio<String>(
                    value: "Never",
                    groupValue: "Never",
                    activeColor: Colors.blueAccent,
                    onChanged: (v) => print(v),
                  ),
                  Text(
                    "Never",
                    // style: TextStyle(color: Colors.blueAccent),
                  ),
                ].row(crossAlignment: CrossAxisAlignment.center),
              ].column();
            },
          ).pSy(y: 4),
        ].column().pb(10),
      ].column()
    ],
  ).scrollVertical();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: ConstrainedBox(
        constraints: constraints ??
            BoxConstraints.expand(
                width: double.infinity, height: double.infinity),
        child: Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              backgroundColor:
                  backgroundColor ?? Theme.of(context).dialogBackgroundColor,
              titlePadding: EdgeInsets.all(0.0),
              title: Container(
                child: Center(
                  child: <Widget>[
                    // _getCloseButton(),
                    SizedBox(
                      height: 12,
                    ),
                    title,
                  ].column(
                    alignment: MainAxisAlignment.center,
                    crossAlignment: CrossAxisAlignment.center,
                  ),
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // content,
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
