import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'room_Model.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color mainColor = const Color(0xFFFFBD28);

  Color inActiveColor = const Color(0xFFC1BDB8);

  int btn_index = 0;
  int bottomNavIndex = 0;

  List<Room> rooms_list = [];

  @override
  void initState() {
    refresh_list();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Interior design',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            height: 100,
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        btn_index = 0;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: btn_index == 0 ? mainColor : inActiveColor,
                        ),
                        child: const Center(
                          child: Text('Design of children\'s room'),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        btn_index = 1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: btn_index == 1 ? mainColor : inActiveColor,
                        ),
                        child: Center(
                          child: Text('Living room design'),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        btn_index = 2;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: btn_index == 2 ? mainColor : inActiveColor,
                        ),
                        child: Center(
                          child: Text('Design of children\'s room'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Different services',
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  'See all',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
          room_views(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Offers&Packages',
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  'See all',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.asset('assets/2.jpg'),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.browse_gallery),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases),
            label: 'My Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'My requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: bottomNavIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            bottomNavIndex = index;
          });
        },
      ),
    );
  }

  Widget room_views() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: rooms_list.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 25),
            child: ListTile(
              title: Text(rooms_list[index].name),
              subtitle: Text(rooms_list[index].discription),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 100,
                  child: Image.asset(
                    rooms_list[index].image_path,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              trailing: Column(
                children: [
                  Text('${rooms_list[index].price} EG'),
                  RatingBarIndicator(
                    rating: rooms_list[index].rating,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 4,
                    itemSize: 20,
                    direction: Axis.horizontal,
                  ),
                  Container(
                    height: 20,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        'Book'.toUpperCase(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  refresh_list() {
    rooms_list.add(Room(
      image_path: 'assets/1.jpg',
      name: 'Design of children\'s room for 2 children',
      discription: 'interior design',
      price: 320,
      rating: 3,
    ));
    rooms_list.add(Room(
      image_path: 'assets/1.jpg',
      name: 'Design of children\'s room for 2 children',
      discription: 'interior design',
      price: 500,
      rating: 4,
    ));
    rooms_list.add(Room(
      image_path: 'assets/1.jpg',
      name: 'Design of children\'s room for 2 children',
      discription: 'interior design',
      price: 250,
      rating: 1.75,
    ));
  }
}
