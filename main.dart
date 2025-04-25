/*
  # 1- Initialization : بعرف كل حاجة السيستم بيستخدمها
  # 2- Initial Request: الكستمر بيبعت عقد إيجار مبدأي
  # 3- Manager Decision: . المدير بيستقبل العقد وبيقرر
  # 4-
*/
import 'Car.dart';
import 'Customer.dart';
import 'Manager.dart';
import 'RentalContract.dart';

void main() {
  Manager owner1 = Manager(
    name: "Omar",
    email: "omar_carRent02@gmail.com",
    phoneNumber: "01220909397",
    address: "Mansoura-Talkha",
  );

  Car bmwX5 = Car(
    company: "BMW",
    model: "X5",
    year: "2023",
    type: "SUV",
    dayPrice: 1200.0,
  );

  Customer rewan = Customer(
    name: 'Rewan',
    email: 'rodlv300@gmail.com',
    phoneNumber: '01220909397',
    address: 'Mansoura-Talkha',
    licence: '24689235',
    car: bmwX5,
  );

  RentalContract rewanRentRequestBMWX5 = RentalContract.init(
    car: bmwX5,
    customer: rewan,
    startDate: DateTime.now(),
    endDate: DateTime(2025, 5, 1),
    status: contractStatus.Pending
  );


  owner1.receiveInitContracts(rewanRentRequestBMWX5);
  owner1.approveContract(rewanRentRequestBMWX5);

  owner1.viewAllContracts();

}






/*
Conceots are apllied on:
  -Encapsulation:hide data (private, setter, getter)
  -Inheritance:reusabilitym shared Info (customer&manager as a user)
  -Polymorphim:many forms (overloading & overriding) /عندك ميثود مشتركة في الكلاسات الوريثة بس بتنفيذ مختلف
  -Abstraction: (abstract class, Interface) /لتحديد السلوك المطلوب بدون تفاصيل التنفيذ


📌 خطوات التفكير عمومًا:

    مين اللي بيعمل الحاجة؟ → يبقى هو اللي يمتلك الميثود.

    الميثود بتتعامل مع إيه؟ → يبقى تمرر له كـ باراميتر.

    إيه النتيجة أو التأثير؟ → مثلاً تحديث حالة، طباعة، تغيير متغير.


📌 أمتى بنستخدم : في الـ constructor؟

    لتعيين القيم للـ final variables

    أو لما نحتاج نعمل initialization logic قبل الجسم

    أو لو بنستخدم super(...) (لو فيه وراثة)
*/
