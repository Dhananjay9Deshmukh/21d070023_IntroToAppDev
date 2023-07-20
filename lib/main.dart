import 'package:flutter/material.dart';

void main() {
  runApp(BudgetTrackerApp());
}

class BudgetTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Tracker'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, Dhananjay',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Total Expenses: \$151140',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExpenseScreen(),
                  ),
                );
              },
              child: Text('View Expenses'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.cyan,
    );
  }
}

class ExpenseScreen extends StatelessWidget {
  List<Map<String, dynamic>> expenses = [
    {
      'category': 'College',
      'amount': 150000,
      'description': 'Bought groceries for the week',
      'items': [
        {'name': 'Tution Fee', 'amount': 100000},
        {'name': 'SMA', 'amount': 22500},
        {'name': 'Hostel Rent', 'amount': 25000},
      ],
    },
    {
      'category': 'Entertainment',
      'amount': 650,
      'description': 'Watched a movie with friends',
      'items': [
        {'name': 'Movie Tickets', 'amount': 250},
        {'name': 'Popcorn', 'amount': 300},
        {'name': 'Soda', 'amount': 100},
      ],
    },
    {
      'category': 'Transportation',
      'amount': 490,
      'description': 'Bus fare for commuting',
      'items': [
        {'name': 'Bus Ticket', 'amount': 40},
        {'name': 'Local', 'amount': 5},
        {'name': 'Uber', 'amount': 445},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
        centerTitle: true,
      ),
      body: Center(
        child: Wrap(
          spacing: 16,
          children: expenses.map((expense) {
            return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExpenseDetailsScreen(expense: expense),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      expense['category'],
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Amount: \$${expense['amount']}',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCategoryScreen(),
            ),
          ).then((value) {
            // Refresh the screen after adding a new category
            // You can implement logic to update the expenses list here
          });
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.cyan,
    );
  }
}

class ExpenseDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> expense;

  ExpenseDetailsScreen({required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(expense['category']),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: expense['items'].length,
        itemBuilder: (context, index) {
          final item = expense['items'][index];
          return ListTile(
            title: Text('${item['name']} - \$${item['amount']}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Implement delete functionality for items here
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddItemScreen(),
            ),
          ).then((value) {
            // Refresh the screen after adding a new item
            // You can implement logic to update the items list here
          });
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.cyan,
    );
  }
}

class AddCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Add Category Form'),
      ),
      backgroundColor: Colors.cyan,
    );
  }
}

class AddItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Add Item Form'),
      ),
      backgroundColor: Colors.cyan,
    );
  }
}

