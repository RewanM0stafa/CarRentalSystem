import 'Car.dart';
import 'PaymentProcess.dart';
import 'RentalContract.dart';
import 'User.dart';
import 'idGenerator.dart';

class Customer extends User  {
  final String licence;
  Car car;
  Payment? payment;

  Customer({
    //super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.address,
    required this.licence,
    required this.car
  }):super(  id: EntityIDGenerator.generateIncrementalId('CUS'),)
  ;



  // Choose a car
  chooseACar() {
    // لو العربية متاحة هنحجزها
    if (car.isAvailable) {
      car.rentedCar();
      print("Rental contract process");
    } else {
      print('Sorry, this car is not available.');
    }
  }

  // كل مرة الكستمر هيحجز سيارة، هيتعملله عقد إيجار، وبالتالي محتاجة نسخة من العقد كل مرة
  // هحتاج ميثود تعمللي نسخة من العقد
  // Request for a rent

  //الكستمر هيحجز سيارة وبعدها هيبعت طلب بإن يتعملله عقد إيجار (هيطلب نسخة من عقد الإيجار)



  // عقد مبدأي بيتبعت للمدير ونشوف هيقبله أو لا
  RentalContract requestRentalContract({
    required String id,
    required Car car,
    required DateTime startDate,
    required DateTime endDate,
  }) {

    var initContract = RentalContract.init(
      car: car,
      customer: this,
      startDate: startDate,
      endDate: endDate,
      status: 'pending',
    );
    return initContract;
  }




  // Pay
  // (amount,method,rental con tract) البيامات اللي محتاجها
  // هتتباصال منين؟  Rental Contract

  void payForRent(double amount,payMethod method, RentalContract contract){

    final newPayment = payment?.processOfPayment( amount: amount, method: method, rental: contract);
    if(newPayment != null)
      this.payment = newPayment;


  }




  // View profile
  viewProfile() {
    return '''
Customer Id     : $id
Name            : $name
Email           : $email
Phone Number    : $phoneNumber
Address         : $address
Licence Number  : $licence 
    ''';
  }
}
