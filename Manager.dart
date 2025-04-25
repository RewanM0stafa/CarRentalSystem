import 'Car.dart';
import 'Customer.dart';
import 'RentalContract.dart';
import 'User.dart';
import 'idGenerator.dart';

class Manager extends User {
  List<RentalContract> contracts = [];
  List<RentalContract> initContracts = [];
  List<Customer> customers = [];

  Manager({
    //required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.address,
  }) : super(id: EntityIDGenerator.generateRandomId('MGR'));

  //Receive initial contract
  void receiveInitContracts(RentalContract init) {
    initContracts.add(init);
  }

  // Find the initial contract we need to evaluate
  foundInitContract(String rentId) {
    RentalContract? found = initContracts.firstWhere(
      (contract) => contract.id == rentId,
      //search for a contract in init with this id
      orElse: () => throw Exception("Contract not found"),
    );
    return found;
  }

  // Approve contract
  void approveContract(RentalContract evaluated) {
    evaluated = foundInitContract(
      evaluated.id,
    ); // بخزن عندي العقد اللي عايزة أقيمه من العقود الابتدائية
    evaluated.status = contractStatus.Approved;
    evaluated.isApproved = true;
    evaluated.approvedBy = this;

    initContracts.remove(evaluated);
    contracts.add(evaluated);
  }

  // Reject contract
  void rejectContract(RentalContract evaluated) {
    evaluated = foundInitContract(
      evaluated.id,
    ); // بخزن عندي العقد اللي عايزة أقيمه من العقود الابتدائية
    evaluated.status = contractStatus.Rejected;
    evaluated.isApproved = false;
    evaluated.approvedBy = this;

    initContracts.remove(evaluated);
  }

  //View all initial contracts
  void viewAllInitContracts() {
    for (var contract in initContracts) {
      print(
        'Rent ${contract.id}: \n' +
            contract.displayContractDetails() +
            '\n ###############################',
      );
    }
  }

  //View all contracts
  void viewAllContracts() {
    for (var contract in contracts) {
      print(
        'Rent ${contract.id}: \n' +
            contract.displayContractDetails() +
            '\n ###############################',
      );
    }
  }

  //########################################

  //Check car availability
  checkAvailability(Car car) =>
      "Car ${car.carInfo} is ${car.isAvailable ? "Available" : "Rented"}";

  // #########################################

  //Add and Remove customers
  void addCustomer(Customer cust) => customers.add(cust);
  void removeCustomer(Customer cust) => customers.remove(cust);
  void removeCustomerById(String customerId) {
    customers.removeWhere((customer) => customer.id == customerId);
    print("Customer with ID $customerId removed.");
  }

  //View Customer profile
  viewAllCustomerProfiles() {
    allCustomers() {
      for (var cust in customers) {
        print(
          'Customer ${cust.id}: \n' +
              cust.viewProfile() +
              '\n ###############################',
        );
      }
    }

    (customers.isEmpty) ? "No customers yet!" : allCustomers();
  }

  //View Manager info
  void viewManagerProfile() {
    print('''
Manager ID       : $id
Name             : $name
Email            : $email
Phone Number     : $phoneNumber
Address          : $address
''');
  }
}
