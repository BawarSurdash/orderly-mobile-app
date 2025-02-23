import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/image/profile.jpg'),
            ),
            accountName: Text(
              "Zhayr Saber",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            accountEmail: Text(
              "zhyar317saber@gnail.com",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 19, 19, 19),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          // Different ListTile entries
          ListItem(title: 'Home', icon: Icons.home),
          ListItem(title: 'Categories', icon: Icons.category),
          ListItem(title: 'Notification', icon: Icons.notifications),

          ListItem(title: 'Review', icon: Icons.reviews),
          ListItem(title: 'FeedBack', icon: Icons.feedback_sharp),
          ListItem(
              title: 'Add Product', icon: Icons.production_quantity_limits),
          ListItem(title: 'Setting', icon: Icons.settings),
          ListItem(title: 'About', icon: Icons.people),

          SizedBox(height: 70),
          ListTile(
            title: Center(
              child: Text(
                "Powered By Bawar Surdash",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color.fromARGB(255, 0, 202, 252),
                  fontFamily: 'english',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom ListItem widget
class ListItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const ListItem({
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 202, 252),
          ),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              icon,
              color: Colors.white,
            ),
            dense: true,
          ),
        ),
      ),
    );
  }
}
