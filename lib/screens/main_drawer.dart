import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String Identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
            ])),
            child: Row(
              children: [
                const Icon(Icons.fastfood_sharp, size: 40, color: Colors.white54),
                const SizedBox(
                  width: 10,
                ),
                Text("Cooking Up!",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant_rounded),
            title: const Text(
              "Meals",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            onTap: () {
              onSelectScreen("meals");
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              "Filters",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            onTap: () {
              onSelectScreen("filters");
            },
          )
        ],
      ),
    );
  }
}
