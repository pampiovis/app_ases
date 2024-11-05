// flight_info.dart
class FlightInfo {
  final String id;
  final String pilotPhoto;
  final String pilotName;

  FlightInfo(
      {required this.id, required this.pilotPhoto, required this.pilotName});

  factory FlightInfo.fromJson(Map<String, dynamic> json) {
    return FlightInfo(
      id: json['id'],
      pilotPhoto: json['foto_piloto'],
      pilotName: json['nome_piloto'],
    );
  }
}
