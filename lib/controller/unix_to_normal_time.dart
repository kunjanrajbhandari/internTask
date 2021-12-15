

import 'package:intl/intl.dart';

class TimeStampConverter{
  getTimeStamp(var getTime){
  //final timestamp1 = 1639575285192; // timestamp in seconds
  final DateTime dateYYMMDD = DateTime.fromMillisecondsSinceEpoch(getTime);

  var outputFormat = DateFormat('dd-MM-yyyy');
  var dateDDMMYY = outputFormat.format(dateYYMMDD);

  return dateDDMMYY;

  }
}