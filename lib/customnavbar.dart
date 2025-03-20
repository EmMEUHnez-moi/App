import 'package:flutter/material.dart';

class Customnavbar extends StatefulWidget {
  const Customnavbar({super.key});

  @override
  State<Customnavbar> createState() => _CustomnavbarState();
}

class _CustomnavbarState extends State<Customnavbar> {
  int _currentIndex = 0;
  final List<Widget> _screens = [HomeScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SafeArea(
          child: Container(
        height: 56,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Color(0xFF17203A).withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF17203A).withValues(alpha: 0.3),
              offset: Offset(0, 20),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              2,
              (index) => SizedBox(
                    height: 36,
                    width: 36,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      icon: Icon(
                        index == 0 ? Icons.home : Icons.person,
                        color: _currentIndex == index ? Colors.white : Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  )),
        ),
      )),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}
