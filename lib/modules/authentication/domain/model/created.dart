import 'package:equatable/equatable.dart';

class Created extends Equatable {
  final DateTime? date;
  final int timezoneType;
  final String timezone;
  const Created({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  @override
  List<Object?> get props => [date, timezone, timezoneType];
}
