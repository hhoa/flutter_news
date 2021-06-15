import 'package:flutter_news/common/utils/parse_utils.dart';
import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String toFormatDate(String format) {
    return DateFormat(format).format(this);
  }

  String toDateAndTime() =>
      "${ParseUtils.month(this.month)} ${this.day}, ${this.year} ${toFormatDate("hh:mm a")}";
}
