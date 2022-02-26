import 'package:envairo/view/pages/advertisement_grid.dart';
import 'package:envairo/view/pages/new_advertisement.dart';
import 'package:envairo/view/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget{
  static const String route = '/';

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static final List<MenuOption> _widgetOptions = <MenuOption>[
    MenuOption(
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home_filled),
        label: "Home",
        page: const AdvertisementGrid(),
    ),

    MenuOption(
      icon: const Icon(Icons.search_outlined),
      selectedIcon: const Icon(Icons.search),
      label: "Search",
      page: const SearchPage(),
    ),

    MenuOption(
      icon: const Icon(Icons.add_circle_outline),
      selectedIcon: const Icon(Icons.add_circle),
      label: "New",
      page: const NewAdvertisement(),
    ),

    MenuOption(
      icon: const Icon(Icons.mail_outline),
      selectedIcon: const Icon(Icons.mail),
      label: "Messages",
      page: const NewAdvertisement(),
    ),

    MenuOption(
      icon: const Icon(Icons.person_outline),
      selectedIcon: const Icon(Icons.person),
      label: "Profile",
      page: const NewAdvertisement(),
    ),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex).page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: List<BottomNavigationBarItem>.generate(
            _widgetOptions.length,
            (index) => BottomNavigationBarItem(
                icon: _selectedIndex == index?
                _widgetOptions[index].selectedIcon : _widgetOptions[index].icon,
                label: _widgetOptions[index].label,
            )
        ),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MenuOption{
  final Icon icon, selectedIcon;
  final String label;
  final Widget page;

  MenuOption({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.page
  });
}