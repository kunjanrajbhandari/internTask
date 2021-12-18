

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeStampConverter extends ChangeNotifier{
  DateTime? dateTime;
    pickDate(context)async{
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context, 
      initialDate: initialDate, 
      firstDate: DateTime(DateTime.now().year -1), 
      lastDate: DateTime(DateTime.now().year +1)
    );
    dateTime = newDate;
    notifyListeners();
  }
  
  getTimeStamp(var getTime){
  //final timestamp1 = 1639575285192; // timestamp in seconds
  final DateTime dateYYMMDD = DateTime.fromMillisecondsSinceEpoch(getTime);

  var outputFormat = DateFormat('dd-MM-yyyy');
  var dateDDMMYY = outputFormat.format(dateYYMMDD);

  return dateDDMMYY;

  }
}