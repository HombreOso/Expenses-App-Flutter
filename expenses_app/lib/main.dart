import 'package:flutter/material.dart';
import './dropdownExpenseCategories.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      home: ExpenseList(),
    );
  }
}

class ExpenseList extends StatefulWidget {
  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  final expenses = <Expense>[];
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myControllerName = TextEditingController();
  final myControllerCost = TextEditingController();
  String _selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
      ),
      body: ListView.builder(
        itemCount: expenses.length,
        prototypeItem: ListTile(
            title: Text("name_title"),
            subtitle: Text("name_subtitle"),
          ),
        itemBuilder: (context, index) {
          final expense = expenses[index];
          print(expense.name);
          return ListTile(
            title: Text(expense.name),
            subtitle: Text(expense.cost.toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Expense'),
                content: Column(
                  children: [
                    DropdownButtonExample(
                      onChangedDDL: (value) {
                        _selectedCategory = value;
                      }
                     ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Cost'),
                      keyboardType: TextInputType.number,
                      controller: myControllerCost,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      // Code to add the expense to the expenses list
                      setState(() {expenses.add(Expense(name: _selectedCategory, cost: double.parse(myControllerCost.text)));});
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class Expense {
  final String name;
  final double cost;

  Expense({
    required this.name,
    required this.cost,
  });
}
