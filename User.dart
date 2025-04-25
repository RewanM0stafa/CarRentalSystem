
//enum user{Manager,Customer, }
abstract class User {
  final String _id, name, email, phoneNumber, address;
  String get id => _id;

  User({
    required id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,}): _id=id;


}
