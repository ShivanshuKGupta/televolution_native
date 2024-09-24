import '../../appwrite/mustache.dart';

class Passenger extends Mustache {
  int id;
  String fName;
  String lName;
  int cabinNumber;

  Passenger({
    required super.$id,
    required this.id,
    required this.fName,
    required this.lName,
    required this.cabinNumber,
  });

  @override
  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
      $id: json['\$id'],
      id: json['id'],
      fName: json['f_name'],
      lName: json['l_name'],
      cabinNumber: int.tryParse(json['cabin_number'].toString()) ?? 0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      '\$id': $id,
      'id': id,
      'f_name': fName,
      'l_name': lName,
      'cabin_number': cabinNumber,
    };
  }
}
