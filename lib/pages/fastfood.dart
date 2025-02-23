import 'package:flutter/material.dart';
import 'InvoicePage.dart'; // Import the invoice page

class Fastfood extends StatefulWidget {
  const Fastfood({super.key});

  @override
  State<Fastfood> createState() => _FastfoodState();
}

class _FastfoodState extends State<Fastfood> {
  Map<String, int> itemCounters = {
    'Burger': 0,
    'TacoBell': 0,
    'BigMac': 0,
    'Fries': 0,
    'Chicken sandwich': 0,
    'Pizza': 0,
    'Kabab': 0,
    'Shawrma': 0,
    'Cola': 0,
    'Ice Cream': 0,
    'Water': 0,
  };

  Map<String, double> itemPrices = {
    'Burger': 6.99,
    'TacoBell': 6.10,
    'BigMac': 12.99,
    'Fries': 4.25,
    'Chicken sandwich': 4.35,
    'Pizza': 8.50,
    'Kabab': 10.99,
    'Shawrma': 2.75,
    'Cola': 1.99,
    'Ice Cream': 3.15,
    'Water': 0.75,
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
          'FastFood',
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
                imagePath: 'assets/image/burger.png',
                name: 'Burger',
                price: '6.99  \$',
                counter: itemCounters['Burger'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Burger'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/taco.png',
                name: 'TacoBell',
                price: '6.10 \$',
                counter: itemCounters['TacoBell'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['TacoBell'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/bigmac.png',
                name: 'BigMac',
                price: '12.99 \$',
                counter: itemCounters['BigMac'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['BigMac'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/fried-potatoes.png',
                name: 'Fries',
                price: '4.25 \$',
                counter: itemCounters['Fries'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Fries'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/sandwich.png',
                name: 'Chicken sandwich',
                price: '4.35 \$',
                counter: itemCounters['Chicken sandwich'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Chicken sandwich'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/pizza.png',
                name: 'Pizza',
                price: '8.50 \$',
                counter: itemCounters['Pizza'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Pizza'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/kabab.png',
                name: 'Kabab',
                price: '10.99 \$',
                counter: itemCounters['Kabab'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Kabab'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/shawarma.png',
                name: 'Shawrma',
                price: '2.75 \$',
                counter: itemCounters['Shawrma'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Shawrma'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/cola.png',
                name: 'Cola',
                price: '1.99 \$',
                counter: itemCounters['Cola'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Cola'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/ice-cream.png',
                name: 'Ice Cream',
                price: '3.15 \$',
                counter: itemCounters['Ice Cream'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Ice Cream'] = newCounter;
                  });
                },
              ),
              ItemCounterWidget(
                imagePath: 'assets/image/water.png',
                name: 'Water',
                price: '0.75 \$',
                counter: itemCounters['Water'] ?? 0,
                onCounterChanged: (newCounter) {
                  setState(() {
                    itemCounters['Water'] = newCounter;
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
