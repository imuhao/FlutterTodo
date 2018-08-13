import 'package:flutter/material.dart';
import 'dart:async';

class AddEditView extends StatelessWidget {
  final _formKey;
  final _taskTitleKey;
  final _taskNoteKey;
  AddEditView(this._formKey, this._taskTitleKey, this._taskNoteKey);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidate: false,
        onWillPop: () {
          return Future(() => true);
        },
        child: ListView(
          children: <Widget>[
            Card(
              margin: const EdgeInsets.all(10.0),
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: TextFormField(
                  key: _taskTitleKey,
                  style: Theme.of(context).textTheme.subhead,
                  decoration: InputDecoration(
                      hintText: 'What do you need to do ?',
                      border: InputBorder.none),
                  validator: (val) =>
                      val.trim().isEmpty ? "Todo title Can not be empty" : null,
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(10.0),
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: TextFormField(
                  key: _taskNoteKey,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Note',
                  ),
                ),
              ),
            )
          ],
        )

        /*Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(10.0),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: TextFormField(
                key: _taskTitleKey,
                style: Theme.of(context).textTheme.subhead,
                decoration: InputDecoration(
                    hintText: 'What do you need to do ?',
                    border: InputBorder.none),
                validator: (val) =>
                    val.trim().isEmpty ? "Todo title Can not be empty" : null,
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(10.0),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: TextFormField(
                key: _taskNoteKey,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Note',
                ),
              ),
            ),
          )
        ],
      ),*/
        );
  }
}
