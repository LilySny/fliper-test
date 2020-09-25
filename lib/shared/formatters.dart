import 'package:intl/intl.dart';

String moneyFormat(num amount) {
  return NumberFormat.currency(name: '', locale: 'eur').format(amount).toString();
}

String percentFormat(double amount, int decimal) {
  return NumberFormat.decimalPattern()
          .format(toPrecision(amount, decimal))
          .toString()
          .replaceAll(".", ",") +
      "%";
}

double toPrecision(double amount, int decimal) {
  return double.parse(amount.toStringAsFixed(decimal));
}
