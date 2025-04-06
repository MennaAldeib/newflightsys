class TripInfo {
  final String destination;
  final DateTime startDate;
  final DateTime endDate;

  TripInfo({
    required this.destination,
    required this.startDate,
    required this.endDate,
  });

  factory TripInfo.fromJson(json) {
    return TripInfo(
      destination: json['destination'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }
}