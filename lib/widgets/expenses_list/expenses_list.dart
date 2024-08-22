import 'package:expence_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expence_tracker/models/expense.dart';
import 'package:flutter/widgets.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expense,
    required this.onRemovedExpense,
  });
  final void Function(Expense expense) onRemovedExpense;
  final List<Expense> expense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) {
            onRemovedExpense(expense[index]);
          },
          key: ValueKey(
            expense[index],
          ),
          child: ExpenseItem(expense: expense[index])),
    );
  }
}
