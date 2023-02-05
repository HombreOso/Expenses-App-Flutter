import 'package:flutter/material.dart';

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
                    TextField(
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Cost'),
                      keyboardType: TextInputType.number,
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
                      setState(() {expenses.add(Expense());});
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
    this.name="action",
    this.cost=0,
  });
}
