
import 'package:intl/intl.dart';

class PriceFormat{
  static String formatCurrent(num? price){
    if(price == null) return "invalid" ;
    final numberFormat = NumberFormat('#,###,###.##');
    var result = numberFormat.format(price);
    return  result ;
  }
}