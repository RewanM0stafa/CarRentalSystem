/*
methods:
markAsRented
 */

import 'idGenerator.dart';

class Car extends EntityIDGenerator {
  final String _id, company, model, year, type;
  bool isAvailable;
  double _dayPrice;
  static int counter=0;

  String get id => _id;

  double get dayPrice=>_dayPrice;
  set dayPrice(double value) {
    _dayPrice = value;
  }
  Car({
    required this.company,
    required this.model,
    required this.year,
    required this.type,
    required dayPrice,
    this.isAvailable = true,
  }):  _id = EntityIDGenerator.generateRandomId('Car'),_dayPrice = dayPrice;

  // check Availability  By Manager
 // checkAvailability() => isAvailable == true;

  //set As Rented
  rentedCar() {
    isAvailable = false;
  }

  //set As Available

  availableCar() {
    isAvailable = true;
  }

  // display Car Details

  displayCarDetails() {
    return '''
Company  : $company
Model    : $model
Type     : $type
Year     : $year
Status   : ${isAvailable ? 'Available' : 'Rented'}
''';
  }

  String get carInfo => "$company $model $type $year";
}
