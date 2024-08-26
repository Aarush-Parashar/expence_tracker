import 'package:expence_tracker/widgets/chart/chart.dart';
import 'package:flutter/material.dart';
import 'package:expence_tracker/models/expense.dart';
import 'package:expence_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expence_tracker/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'ABC',
        amount: 10,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'XYZ',
        amount: 10,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Deleted Expense'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  double get totalExpense {
    return _registeredExpenses.fold(
      0.0,
      (previousValue, expense) => previousValue + expense.amount,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No Expenses Found!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expense: _registeredExpenses,
        onRemovedExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Total Spendings: ₹${totalExpense.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Chart(
                  expenses: _registeredExpenses,
                ),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(
                    expenses: _registeredExpenses,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Total Spendings: ₹${totalExpense.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Expanded(child: mainContent),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
