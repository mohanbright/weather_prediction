import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
part 'weather_model.g.dart';

abstract class WeatherResponse implements Built<WeatherResponse, WeatherResponseBuilder> {
  @BuiltValueField(wireName: 'list')
  BuiltList<Weather> get weatherList;

  WeatherResponse._();
  factory WeatherResponse([void Function(WeatherResponseBuilder) updates]) = _$WeatherResponse;

  static Serializer<WeatherResponse> get serializer => _$weatherResponseSerializer;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(WeatherResponse.serializer, json)!;
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(WeatherResponse.serializer, this) as Map<String, dynamic>;
  }
}

abstract class Weather implements Built<Weather, WeatherBuilder> {
  @BuiltValueField(wireName: 'dt')
  int get dt;

  @BuiltValueField(wireName: 'main')
  Main get main;

  @BuiltValueField(wireName: 'weather')
  BuiltList<WeatherDescription> get weather;

  @BuiltValueField(wireName: 'clouds')
  Clouds get clouds;

  @BuiltValueField(wireName: 'wind')
  Wind get wind;

  @BuiltValueField(wireName: 'visibility')
  int get visibility;

  @BuiltValueField(wireName: 'pop')
  double get pop;

  @BuiltValueField(wireName: 'rain')
  Rain? get rain; // Nullable field

  @BuiltValueField(wireName: 'sys')
  Sys get sys;

  @BuiltValueField(wireName: 'dt_txt')
  String get dtTxt; // Date and time in string format

  Weather._();
  factory Weather([void Function(WeatherBuilder) updates]) = _$Weather;

  static Serializer<Weather> get serializer => _$weatherSerializer;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Weather.serializer, json)!;
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Weather.serializer, this) as Map<String, dynamic>;
  }
}

abstract class Main implements Built<Main, MainBuilder> {
  @BuiltValueField(wireName: 'temp')
  double get temp;

  @BuiltValueField(wireName: 'feels_like')
  double get feelsLike;

  @BuiltValueField(wireName: 'temp_min')
  double get tempMin;

  @BuiltValueField(wireName: 'temp_max')
  double get tempMax;

  @BuiltValueField(wireName: 'pressure')
  int get pressure;

  @BuiltValueField(wireName: 'sea_level')
  int get seaLevel;

  @BuiltValueField(wireName: 'grnd_level')
  int get grndLevel;

  @BuiltValueField(wireName: 'humidity')
  int get humidity;

  @BuiltValueField(wireName: 'temp_kf')
  double get tempKf;

  Main._();
  factory Main([void Function(MainBuilder) updates]) = _$Main;

  static Serializer<Main> get serializer => _$mainSerializer;

  factory Main.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Main.serializer, json)!;
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Main.serializer, this) as Map<String, dynamic>;
  }
}

abstract class WeatherDescription implements Built<WeatherDescription, WeatherDescriptionBuilder> {
  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'main')
  String get main;

  @BuiltValueField(wireName: 'description')
  String get description;

  @BuiltValueField(wireName: 'icon')
  String get icon;

  WeatherDescription._();
  factory WeatherDescription([void Function(WeatherDescriptionBuilder) updates]) = _$WeatherDescription;

  static Serializer<WeatherDescription> get serializer => _$weatherDescriptionSerializer;

  factory WeatherDescription.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(WeatherDescription.serializer, json)!;
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(WeatherDescription.serializer, this) as Map<String, dynamic>;
  }
}

abstract class Clouds implements Built<Clouds, CloudsBuilder> {
  @BuiltValueField(wireName: 'all')
  int get all;

  Clouds._();
  factory Clouds([void Function(CloudsBuilder) updates]) = _$Clouds;

  static Serializer<Clouds> get serializer => _$cloudsSerializer;

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Clouds.serializer, json)!;
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Clouds.serializer, this) as Map<String, dynamic>;
  }
}

abstract class Wind implements Built<Wind, WindBuilder> {
  @BuiltValueField(wireName: 'speed')
  double get speed;

  @BuiltValueField(wireName: 'deg')
  int get deg;

  @BuiltValueField(wireName: 'gust')
  double? get gust; // Nullable field

  Wind._();
  factory Wind([void Function(WindBuilder) updates]) = _$Wind;

  static Serializer<Wind> get serializer => _$windSerializer;

  factory Wind.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Wind.serializer, json)!;
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Wind.serializer, this) as Map<String, dynamic>;
  }
}

abstract class Rain implements Built<Rain, RainBuilder> {
  @BuiltValueField(wireName: '3h')
  double? get h3;

  Rain._();
  factory Rain([void Function(RainBuilder) updates]) = _$Rain;

  static Serializer<Rain> get serializer => _$rainSerializer;

  factory Rain.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Rain.serializer, json)!;
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Rain.serializer, this) as Map<String, dynamic>;
  }
}

abstract class Sys implements Built<Sys, SysBuilder> {
  @BuiltValueField(wireName: 'pod')
  String get pod;

  Sys._();
  factory Sys([void Function(SysBuilder) updates]) = _$Sys;

  static Serializer<Sys> get serializer => _$sysSerializer;

  factory Sys.fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Sys.serializer, json)!;
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Sys.serializer, this) as Map<String, dynamic>;
  }
}

@SerializersFor(const [
  WeatherResponse,
  Weather,
  Main,
  WeatherDescription,
  Clouds,
  Wind,
  Rain,
  Sys,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
