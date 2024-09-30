const months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

extension SlashString on DateTime {
  String get monthString => '$day ${months[month - 1]} $year';

  String get dayString {
    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return '${days[weekday - 1]}, ${months[month - 1]} $day';
  }

  String get time {
    final localTime = toLocal();
    return "${localTime.hour.toString().padLeft(2, '0')}:${localTime.minute.toString().padLeft(2, '0')}";
  }

  String get amPmTime {
    final localTime = toLocal();
    final ampm = localTime.hour >= 12 ? 'pm' : 'am';
    final hourIn12 = localTime.hour > 12 ? localTime.hour - 12 : localTime.hour;
    return "$hourIn12:${localTime.minute.toString().padLeft(2, '0')} $ampm";
  }

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);
    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'now';
    }
  }

  String get yearMonthDay =>
      '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
}
