import 'package:expence_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(),
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    ),
  );
}
