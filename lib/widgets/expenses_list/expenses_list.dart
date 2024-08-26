import 'package:expence_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expence_tracker/models/expense.dart';

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
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            ),
          ),
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
