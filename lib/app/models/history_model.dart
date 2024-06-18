class HistoryModel {
  final String? title;
  final String? date;
  final DateTime? time;
  final String? statusWater;
  final String? ph;
  final String? oxygen;
  final String? salinity;
  final String? temp;

  HistoryModel({
    this.title,
    this.date,
    this.time,
    this.statusWater,
    this.ph,
    this.oxygen,
    this.salinity,
    this.temp,
  });

  List listHistoryData = [
    HistoryModel(
      title: 'History Data',
      date: '2021-10-10',
      time: DateTime.now(),
      statusWater: 'Good',
      ph: '7.5',
      oxygen: '4.5',
      salinity: '15',
      temp: '30',
    ),
  ];
}
