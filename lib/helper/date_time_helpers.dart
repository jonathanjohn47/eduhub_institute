extension DateTimeHelper on DateTime {
  String get getDateWithShortMonthName {
    Map<int, String> months = {
      1: 'Jan',
      2: 'Feb',
      3: 'Mar',
      4: 'Apr',
      5: 'May',
      6: 'Jun',
      7: 'July',
      8: 'Aug',
      9: 'Sept',
      10: 'Oct',
      11: 'Nov',
      12: 'Dec',
    };

    return '$day ${months[month]} $year';
  }

  String get getHowMuchTimeAgo{
    var diff = DateTime.now().difference(this);
    if(diff.inDays > 0){
      return '${diff.inDays} days ago';
    }else if(diff.inHours > 0){
      return '${diff.inHours} hours ago';
    }else if(diff.inMinutes > 0){
      return '${diff.inMinutes} minutes ago';
    }else if(diff.inSeconds > 0){
      return '${diff.inSeconds} seconds ago';
    }else{
      return 'Just now';
    }
  }
}
