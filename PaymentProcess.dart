import 'RentalContract.dart';


enum payMethod{ cash , card }
class Payment {
  String id; // cash, card, etc.
  RentalContract rental;
  double amount;
  DateTime paymentDate;
  payMethod method;

  Payment({
    required this.id,
    required this.rental,
    required this.amount,
    required this.paymentDate,
    required this.method,
  });



 //display Payment Details
 String displayPaymentDetails(){
  return '''
  Id             : $id
  Amount         : $amount
  Payment Date   : $paymentDate
  Payment method : $method.
  Rental Status : ${rental.status}
  ''';
}



 Payment? processOfPayment({
   required double amount,
   required payMethod method,
   required RentalContract rental,
 }) {
   //1-بعمل تشك هل الفلوس المدفوعة كافي 2- لو اه ، بخزن بيانات عملية الدفع

   if (rental.totalCost == null) {
     print("Contract total cost is not determined yet.");
     return null;
   }

   if (!isValidPayment){
     print("Invalid Payment");
   return null;
 }
   else{
     rental.status = contractStatus.Paid;
     final payment = Payment(id: id, rental: rental, amount: amount, paymentDate: DateTime.now(), method: method);
     print("A payment of \$ $amount using $method way has been done!");
     return payment;
   }

 }


 String sendReceipt(){
   return '''
     Payment ID  : $id
     Customer    : ${rental.customer.name}  // اسم العميل من العقد 
     Car         : ${rental.car.carInfo} //اسم السيارة من العقد   
     Amount Paid : \$${amount.toStringAsFixed(2)}
     Paid Via    : $method
     Date   
   ''';
 }


bool get isValidPayment{
   return amount >= (rental.totalCost ?? 0);
}


}
