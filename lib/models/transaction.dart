import 'package:envairo/models/advertisement.dart';
import 'package:envairo/models/user.dart';

class Transaction{
  final Item advertisement;
  final User buyer;

  Transaction({
    required this.advertisement,
    required this.buyer
  });
}