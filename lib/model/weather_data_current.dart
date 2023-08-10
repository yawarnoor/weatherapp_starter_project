class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {
  String? lastUpdated;
  double? tempC;
  Condition? condition;
  double? windKph;
  int? humidity;
  int? cloud;

  Current({
    this.lastUpdated,
    this.tempC,
    this.condition,
    this.windKph,
    this.humidity,
    this.cloud,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdated: json['last_updated'] as String?,
        tempC: json['temp_c'] as double?,
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        windKph: (json['wind_kph'] as num?)?.toDouble(),
        humidity: json['humidity'] as int?,
        cloud: json['cloud'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'last_updated': lastUpdated,
        'temp_c': tempC,
        'condition': condition?.toJson(),
        'wind_kph': windKph,
        'humidity': humidity,
        'cloud': cloud,
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
