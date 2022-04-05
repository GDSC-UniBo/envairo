import 'package:freebye/models/advertisement.dart';
import 'package:freebye/models/user.dart';

class Transaction {
  final Item advertisement;
  final User buyer;

  Transaction({required this.advertisement, required this.buyer});
}
