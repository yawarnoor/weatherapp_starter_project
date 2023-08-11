class WeatherDataHourly {
  List<Hour> hourly;

  WeatherDataHourly({required this.hourly});

  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) {
    final hourlyJson = json['hour'];
    if (hourlyJson != null && hourlyJson is List) {
      return WeatherDataHourly(
        hourly: List<Hour>.from(
            hourlyJson.map((hourJson) => Hour.fromJson(hourJson))),
      );
    } else {
      return WeatherDataHourly(hourly: []);
    }
  }
}

class Hour {
  int? timeEpoch;
  String? time;
  double? tempC;
  Condition? condition;

  Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.condition,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        timeEpoch: json['time_epoch'] as int?,
        time: json['time'] as String?,
        tempC: (json['temp_c'] as num?)?.toDouble(),
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'time_epoch': timeEpoch,
        'time': time,
        'temp_c': tempC,
        'condition': condition?.toJson(),
      };
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json['text'] as String?,
        icon: json['icon'] as String?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'icon': icon,
        'code': code,
      };
}
