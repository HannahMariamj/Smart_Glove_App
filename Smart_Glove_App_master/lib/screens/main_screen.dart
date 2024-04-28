import 'package:fitness_dashboard_ui/util/responsive.dart';
import 'package:fitness_dashboard_ui/widgets/bluetooth_integration.dart';
import 'package:fitness_dashboard_ui/widgets/dashboard_widget.dart';
import 'package:fitness_dashboard_ui/widgets/header_widget.dart';
import 'package:fitness_dashboard_ui/widgets/side_menu_widget.dart';
import 'package:fitness_dashboard_ui/widgets/summary_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      drawer: !isDesktop
          ? const SizedBox(
              width: 250,
              child: SideMenuWidget(),
            )
          : null,
      endDrawer: Responsive.isMobile(context)
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const SummaryWidget(),
            )
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(),
              BluetoothPage(),
              Row(
                children: [
                  if (isDesktop)
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: SideMenuWidget(),
                      ),
                    ),
                  Expanded(
                    flex: 7,
                    child: DashboardWidget(),
                  ),
                  if (isDesktop)
                    Expanded(
                      flex: 3,
                      child: SummaryWidget(),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
