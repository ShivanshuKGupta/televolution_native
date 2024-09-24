import '../../appwrite/mustache.dart';

class Passenger extends Mustache {
  String fName;
  String lName;
  int cabinNumber;

  Passenger({
    required super.$id,
    required this.fName,
    required this.lName,
    required this.cabinNumber,
  });

  @override
  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
      $id: json['\$id'],
      fName: json['fName'],
      lName: json['lName'],
      cabinNumber: int.tryParse(json['cabinNumber'].toString()) ?? 0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      '\$id': $id,
      'fName': fName,
      'lName': lName,
      'cabinNumber': cabinNumber,
    };
  }
}
