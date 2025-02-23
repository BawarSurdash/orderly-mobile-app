import 'package:flutter/material.dart';
import 'InvoicePage.dart'; // Import the invoice page

class Vegetables extends StatefulWidget {
  const Vegetables({super.key});

  @override
  State<Vegetables> createState() => _VegetablesState();
}

class _VegetablesState extends State<Vegetables> {
  Map<String, int> itemCounters = {
    'Carrot': 0,
    'Cucumber': 0,
    'Tomato': 0,
    'Mashroom': 0,
    'Broccoli': 0,
    'Mango': 0,
    'Apple': 0,
    'Banana': 0,
    'Potato': 0,
    'Orange': 0,
    'Strawberry': 0,
  };

  Map<String, double> itemPrices = {
    'Carrot': 2.5,
    'Cucumber': 3.75,
    'Tomato': 1.75,
    'Mashroom': 1.25,
    'Broccoli': 4.99,
    'Mango': 7.25,
    'Apple': 3.75,
    'Banana': 3.75,
    'Potato': 2.50,
    'Orange': 4.15,
    'Strawberry': 7.75,
  };

  // Calculate the total number of items and total price
  int get totalItems {
    return itemCounters.values.fold(0, (sum, counter) => sum + counter);
  }

  double get totalPrice {
    double price = 0.0;
    itemCounters.forEach((key, value) {
      if (itemPrices.containsKey(key)) {
        price += value * itemPrices[key]!;
      }
    });
    return price;
  }

  // Prepare the list of items for the invoice page
  List<Map<String, dynamic>> get itemDetails {
    List<Map<String, dynamic>> details = [];
    itemCounters.forEach((name, count) {
      if (count > 0) {
        details.add({
          'name': name,
          'quantity': count,
          'price': itemPrices[name]! * count,
        });
      }
    });
    return details;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vegetables',
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 202, 252),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              ItemCounterWidget(
                imagePath: 'assets/image/carrot.png',
                name: 'Carrot',
                price: '2.5  \$',
                counter: itemCounters['Carrot'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Carrot'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/cucumber.png',
                name: 'Cucumber',
                price: '3.75 \$',
                counter: itemCounters['Cucumber'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Cucumber'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/tomato.png',
                name: 'Tomato',
                price: '1.75 \$',
                counter: itemCounters['Tomato'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Tomato'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/food.png',
                name: 'Mashroom',
                price: '1.25 \$',
                counter: itemCounters['Mashroom'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Mashroom'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/broccoli.png',
                name: 'Broccoli',
                price: '4.99 \$',
                counter: itemCounters['Broccoli'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Broccoli'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/mango.png',
                name: 'Mango',
                price: '7.25 \$',
                counter: itemCounters['Mango'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Mango'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/apple.png',
                name: 'Apple',
                price: '3.75 \$',
                counter: itemCounters['Apple'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Apple'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/banana.png',
                name: 'Banana',
                price: '3.75 \$',
                counter: itemCounters['Banana'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Banana'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/potato.png',
                name: 'Potato',
                price: '2.50 \$',
                counter: itemCounters['Potato'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Potato'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/orange.png',
                name: 'Orange',
                price: '4.15 \$',
                counter: itemCounters['Orange'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Orange'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/strawberry.png',
                name: 'Strawberry',
                price: '7.75 \$',
                counter: itemCounters['Strawberry'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Strawberry'] = newCounter;
                  });
                },
              ),
              SizedBox(
                height: 70,
              )
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                // Navigate to invoice page with the items and their total price
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InvoicePage(
                      items: itemDetails,
                      totalItems: totalItems,
                      totalPrice: totalPrice,
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              backgroundColor: const Color.fromARGB(255, 0, 202, 252),
              shape: const CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCounterWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final int counter;
  final ValueChanged<int> onCounterChanged;

  const ItemCounterWidget({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.counter,
    required this.onCounterChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      child: Image(image: AssetImage(imagePath))),
                  Padding(
                    padding: const EdgeInsets.only(left: 7.0),
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      color: Colors.black,
                      onPressed: () {
                        onCounterChanged(counter > 0 ? counter - 1 : 0);
                      },
                    ),
                    Text(
                      '$counter',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.black,
                      onPressed: () {
                        onCounterChanged(counter + 1);
                      },
                    ),
                  ],
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
