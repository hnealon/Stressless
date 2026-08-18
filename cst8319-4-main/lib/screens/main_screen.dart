import 'package:flutter/material.dart';
import 'package:myapp/screens/home_screen_new.dart';
import 'learn_screen.dart';
import 'apology_guide_screen.dart';
import 'script_builder_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  static const List<Widget> _tabRoots = <Widget>[
    HomeScreenNew(),
    LearnScreen(),
    ScriptBuilderScreen(),
    ApologyGuideScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == _selectedIndex) {
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget _buildTabNavigator(int index) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => _tabRoots[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final currentNavigator = _navigatorKeys[_selectedIndex].currentState;
        if (currentNavigator != null && currentNavigator.canPop()) {
          currentNavigator.pop();
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: List.generate(_tabRoots.length, _buildTabNavigator),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Learn VS'),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_note_rounded),
              label: 'Build VS',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Advanced - TA',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}