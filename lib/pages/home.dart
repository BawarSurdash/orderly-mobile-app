import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '/pages/mydrawer.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {


  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orderly',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'english',
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 202, 252),
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
            ),
            items: [
              'assets/image/shopping.jpg',
              'assets/image/tech.png',
              'assets/image/fastlink.png',
              'assets/image/fastfood.jpg',
              'assets/image/korek.png',
              'assets/image/console.jpg',
              'assets/image/logo.jpg',
              'assets/image/girl.jpg',
              'assets/image/vege.jpg',
            ].map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore Categories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 202, 252),
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 0, 202, 252),
                    color: Color.fromARGB(255, 0, 202, 252),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/vegetable');
                  },
                  child: const item(
                    imagePath: 'assets/image/fruits-and-vegetables.png',
                    title: "Fruits & Vegetables",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/fastfood');
                  },
                  child: const item(
                    imagePath: 'assets/image/burgericon.png',
                    title: "FastFood",
                  ),
                ),
              ],
            ),
          ),
           Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/snack');
                  },
                  child: const item(
                    imagePath: 'assets/image/snack.png',
                    title: "Snack",
                  ),
                ),
               const item(imagePath: 'assets/image/brandicon.png', title: "Clothes"),
              ],
            ),
          ),
           Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                item(
                    imagePath: 'assets/image/techicon.png',
                    title: "Technology"),
                item(imagePath: 'assets/image/atm-card.png', title: "Cards"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class item extends StatelessWidget {
  final String imagePath;
  final String title;

  const item({required this.imagePath, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 59, 216, 255),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image.asset(imagePath),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }
}
