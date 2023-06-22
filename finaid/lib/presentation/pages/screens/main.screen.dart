import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/bloc/cubit/app_cubit.dart';
import 'accounts/accounts.screen.dart';
import 'categories/categories.screen.dart';
import 'home/home.screen.dart';
import 'onboard/onboard_screen.dart';
import 'settings/settings.screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _controller = PageController(keepPage: true);
  int _selected = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = context.read<AppCubit>();
        if (cubit.state.currency == null || cubit.state.username == null) {
          return OnboardScreen();
        }
        return Scaffold(
          body: PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [HomeScreen(), AccountsScreen(), CategoriesScreen()],
            onPageChanged: (int index) {
              setState(() {
                _selected = index;
              });
            },
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: _selected,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(icon: Icon(Icons.wallet), label: "Accounts"),
              NavigationDestination(icon: Icon(Icons.category), label: "Categories"),
            ],
            onDestinationSelected: (int selected) {
              _controller.jumpToPage(selected);
            },
          ),
          drawer: NavigationDrawer(
            selectedIndex: _selected,
            children: const [
              NavigationDrawerDestination(icon: Icon(Icons.home), label: Text("Home")),
              NavigationDrawerDestination(icon: Icon(Icons.wallet), label: Text("Accounts")),
              NavigationDrawerDestination(icon: Icon(Icons.category), label: Text("Categories")),
              NavigationDrawerDestination(icon: Icon(Icons.settings), label: Text("Settings")),
            ],
            onDestinationSelected: (int selected) {
              Navigator.pop(context);
              if (selected < 3) {
                _controller.jumpToPage(selected);
              }

              if (selected == 3) {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
              }
            },
          ),
        );
      },
    );
  }
}
