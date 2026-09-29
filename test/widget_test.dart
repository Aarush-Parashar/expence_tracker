import 'package:expence_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows the expense tracker dashboard', (tester) async {
    await tester.pumpWidget(const ExpenseTrackerApp());

    expect(find.text('Expense Tracker'), findsOneWidget);
    expect(find.text('Total Spendings: ₹20.00'), findsOneWidget);
    expect(find.text('ABC'), findsOneWidget);
    expect(find.text('XYZ'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('fits the dashboard on a narrow screen', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ExpenseTrackerApp());

    expect(find.text('Expense Tracker'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
