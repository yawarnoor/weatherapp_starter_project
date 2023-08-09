import 'condition.dart';

class Day {
	int? maxtempC;
	int? maxtempF;
	double? mintempC;
	int? mintempF;
	double? avgtempC;
	double? avgtempF;
	double? maxwindMph;
	double? maxwindKph;
	int? totalsnowCm;
	Condition? condition;

	Day({
		this.maxtempC, 
		this.maxtempF, 
		this.mintempC, 
		this.mintempF, 
		this.avgtempC, 
		this.avgtempF, 
		this.maxwindMph, 
		this.maxwindKph, 
		this.totalsnowCm, 
		this.condition, 
	});

	factory Day.fromJson(Map<String, dynamic> json) => Day(
				maxtempC: json['maxtemp_c'] as int?,
				maxtempF: json['maxtemp_f'] as int?,
				mintempC: (json['mintemp_c'] as num?)?.toDouble(),
				mintempF: json['mintemp_f'] as int?,
				avgtempC: (json['avgtemp_c'] as num?)?.toDouble(),
				avgtempF: (json['avgtemp_f'] as num?)?.toDouble(),
				maxwindMph: (json['maxwind_mph'] as num?)?.toDouble(),
				maxwindKph: (json['maxwind_kph'] as num?)?.toDouble(),
				totalsnowCm: json['totalsnow_cm'] as int?,
				condition: json['condition'] == null
						? null
						: Condition.fromJson(json['condition'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'maxtemp_c': maxtempC,
				'maxtemp_f': maxtempF,
				'mintemp_c': mintempC,
				'mintemp_f': mintempF,
				'avgtemp_c': avgtempC,
				'avgtemp_f': avgtempF,
				'maxwind_mph': maxwindMph,
				'maxwind_kph': maxwindKph,
				'totalsnow_cm': totalsnowCm,
				'condition': condition?.toJson(),
			};
}
