import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class NestedNavigator extends StatefulWidget {
  final Widget body;
  const NestedNavigator({super.key, required this.body});

  @override
  State<NestedNavigator> createState() => _NestedNavigatorState();
}

class _NestedNavigatorState extends State<NestedNavigator> {
  int currentIndex = 0;

  void changeTab(int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/historic');
        break;
      default:
        context.go('/settings');
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeTab,
        backgroundColor: const Color(0xffe0b9f6),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'historic'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'settings'),
        ],
      ),
    );
  }
}
