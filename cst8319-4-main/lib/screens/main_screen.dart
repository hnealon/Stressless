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

  // One GlobalKey per tab so each Navigator keeps its own history
  // even when the user switches tabs and comes back.
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  // The root widget for each tab.
  static const List<Widget> _tabRoots = <Widget>[
    HomeScreenNew(),
    LearnScreen(),
    ScriptBuilderScreen(),
    ApologyGuideScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == _selectedIndex) {
      // Tapping the current tab pops to that tab's root.
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // Build a Navigator for a single tab.
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
      // If we can pop within the current tab's Navigator, do that
      // instead of exiting the app on Android back button.
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
              label: 'Advanced',
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
