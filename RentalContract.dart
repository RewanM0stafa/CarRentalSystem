import 'Car.dart';
import 'Customer.dart';
import 'Manager.dart';
import 'idGenerator.dart';

abstract class PayForDay {
  static int getDayNumbers(DateTime start, DateTime end) {
    return end.difference(start).inDays;
  }

  static double calculateTotal(int dayNums, double dayPrice) {
    return dayNums * dayPrice;
  }
}

enum contractStatus{Pending,Approved,Rejected,Paid}

class RentalContract extends PayForDay {
  String _id;
  Car car;
  Customer customer;
  var startDate, endDate;
  double? totalCost;
  bool? isApproved ;
  Manager? approvedBy;
  contractStatus status;
  String get id => _id;

  //constructor
  RentalContract({
    required this.car,
    required this.customer,
    required this.startDate,
    required this.endDate,
    this.totalCost,
    required this.isApproved,
    required this.approvedBy,
    this.status = contractStatus.Pending ,
  }):_id=EntityIDGenerator.generateIncrementalId('Rent');

  //named constructor
  factory RentalContract.init({
    required car,
    required customer,
    required startDate,
    required endDate,
    required status,
  }) {
    int dayCount = PayForDay.getDayNumbers(startDate, endDate);
    double total = PayForDay.calculateTotal(dayCount, car.dayPrice);

    return RentalContract(
      car: car,
      customer: customer,
      startDate: startDate,
      endDate: endDate,
      totalCost: total,
      isApproved: false,
      approvedBy: null,
      status: status,
    );
  }

  double get dayPrice => car.dayPrice;
    //view the details
  String displayContractDetails(){
    return '''
    Rental Contract:
    Car: ${car.carInfo}
    Customer: ${customer.name}
    Start: $startDate
    End: $endDate
    Total: \$${totalCost?.toStringAsFixed(2)}
    Status: $status
    Approved By: ${approvedBy?.name ?? "Not Approved Yet"}
''';
  }

    // approve/reject contract by manager
    void contractApproved(Manager manager) {
      status = contractStatus.Approved ;
      isApproved=true;
      approvedBy=manager;
    }

    void contractRejected(Manager manager) {
      status = contractStatus.Rejected ;
      isApproved=false;
      approvedBy=manager;
    }

    //update the pay status
    void markAsPaid() {
      status = contractStatus.Paid;
    }

    //update dates
  void updateRentalDates(DateTime newStart, DateTime newEnd) {
    startDate = newStart;
    endDate = newEnd;
    totalCost = PayForDay.calculateTotal(PayForDay.getDayNumbers(startDate,endDate), dayPrice);
  }


}
