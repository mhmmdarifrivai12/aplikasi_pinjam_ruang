import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';
import '../controllers/home_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  // final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          _buildSearchBar(),
          _buildRecommendedRooms(),
        ],
      ),
      bottomNavigationBar: _buildBottomAppBar(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Dashboard',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          _buildProfileImage(),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      height: 50,
      width: 50,
      child: ClipOval(
        child: Image.network(
          "https://ibb.co/pWGgqPp",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 247, 248, 1),
        border: Border.all(color: const Color.fromRGBO(246, 247, 248, 1)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Color.fromRGBO(120, 124, 1132, 1),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Room',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedRooms() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Recommended Rooms'),
        _buildRoomCard(
          imageUrl: "https://ibb.co/4ZwcXjT",
          roomName: "Lab Digital",
          location: "Ged A",
          capacity: "Kapasitas 40 Kursi",
        ),
        _buildRoomCard(
          imageUrl: "https://ibb.co/T1rNpBQ",
          roomName: "Lab 1 GSG",
          location: "Ged GSG",
          capacity: "Kapasitas 40 Kursi",
        ),
        _buildRoomCard(
          imageUrl: "https://ibb.co/Hr8Y2sY",
          roomName: "Ruang 302 B",
          location: "Ged B",
          capacity: "Kapasitas 50 Kursi",
        ),
        _buildRoomCard(
          imageUrl: "https://ibb.co/zxfhrmk",
          roomName: "Lab 1 ICT",
          location: "Ged ICT",
          capacity: "Kapasitas 50 Kursi",
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomCard({
    required String imageUrl,
    required String roomName,
    required String location,
    required String capacity,
  }) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 110,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  roomName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(location),
                Text(capacity),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      height: 50,
      color: Color.fromRGBO(246, 247, 248, 1),
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavBarIcon(Icons.home, 0),
          _buildNavBarIcon(Icons.view_list_outlined, 1),
          SizedBox(), // Spacer
          _buildNavBarIcon(Icons.archive, 2),
          _buildNavBarIcon(Icons.logout, 3),
        ],
      ),
    );
  }

  Widget _buildNavBarIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(icon),
      color: _selectedIndex == index
          ? Color.fromRGBO(127, 116, 235, 1)
          : Color.fromRGBO(152, 155, 161, 1),
      onPressed: () {
        _onItemTapped(index);
      },
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      backgroundColor: Color.fromRGBO(127, 116, 235, 1),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
