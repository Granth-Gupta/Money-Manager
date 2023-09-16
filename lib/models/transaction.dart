import 'package:flutter/foundation.dart';
// to import required (can use material.dart)

class Transaction {
  final String id;
  final String title;
  final double money;
  final DateTime date;

  Transaction({
    @required this.date,
    @required this.id,
    @required this.money,
    @required this.title,
  });
}
