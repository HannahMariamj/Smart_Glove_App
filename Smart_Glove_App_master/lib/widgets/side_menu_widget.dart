import 'package:flutter/material.dart';
import 'package:fitness_dashboard_ui/data/side_menu_data.dart';
import 'package:fitness_dashboard_ui/model/menu_model.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({Key? key}) : super(key: key);

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;

  void _onMenuTap(BuildContext context, int index, MenuModel menuItem) {
    setState(() {
      selectedIndex = index;
    });

    switch (menuItem.title) {
      case 'Settings':
        Navigator.pushNamed(context, '/settings');
        break;
      case 'Dos and Donts': // New case for Dos and Don'ts
        Navigator.pushNamed(context, '/dos_and_donts');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: const Color(0xFF171821),
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) {
          return _buildMenuEntry(context, data.menu[index], index);
        },
      ),
    );
  }

  Widget _buildMenuEntry(BuildContext context, MenuModel menuItem, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        color: isSelected ? Colors.orange : Colors.transparent,
      ),
      child: InkWell(
        onTap: () => _onMenuTap(context, index, menuItem), 
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              child: Icon(
                menuItem.icon,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
            Text(
              menuItem.title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
