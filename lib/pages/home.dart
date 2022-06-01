import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var faker = new Faker();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyWidget = [
      ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            backgroundImage:
                NetworkImage('https://picsum.photos/id/${120 + index}/200/300'),
          ),
          title: Text("${faker.person.name()}"),
          subtitle:
              Text("${DateFormat('y-MM-dd HH:mm:ss').format(DateTime.now())}"),
        ),
      ),
      Center(child: Text("Body 2")),
      Center(child: Text("Body 3")),
      Center(child: Text("Body 4")),
      Center(child: Text("Body 5")),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Faker App"),
      ),
      body: bodyWidget[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.map, title: "Discovery"),
          TabItem(icon: Icons.add, title: "Add"),
          TabItem(icon: Icons.message, title: "Message"),
          TabItem(icon: Icons.people, title: "Profile"),
        ],
        initialActiveIndex: 2,
        onTap: (int i) {
          setState(() {
            currentIndex = i;
            print(currentIndex);
          });
        },
      ),
    );
  }
}
