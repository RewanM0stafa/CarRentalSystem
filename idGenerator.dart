
import 'dart:math';

abstract class EntityIDGenerator {
  static final Map<String, int> _counters = {};

  static String generateIncrementalId(String prefix) {  // الid اللي الكلاسات هتورثه أو هساويه ببتاعها
    int counter = (_counters[prefix]??0)+1;
    return '${prefix}_${(counter).toString().padLeft(4,'0')} ';
  }

  static String generateRandomId(String prefix){
    Random randId = Random();
    return '${prefix}_${List.generate(4, (_) => randId.nextInt(10)).join()}';

  }
}