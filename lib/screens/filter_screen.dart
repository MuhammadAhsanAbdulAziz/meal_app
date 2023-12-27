import 'package:flutter/material.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({required this.activeFilters,super.key});

  final Map<Filter,bool> activeFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  var _glutenFilterChange = false;
  var _lactoseFilterChange = false;
  var _vegetarianFilterChange = false;
  var _veganFilterChange = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFilterChange = widget.activeFilters[Filter.glutenFree]!;
    _lactoseFilterChange = widget.activeFilters[Filter.lactoseFree]!;
    _vegetarianFilterChange = widget.activeFilters[Filter.vegetarian]!;
    _veganFilterChange = widget.activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Your Filters"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if(didPop) return;

          Navigator.of(context).pop({
            Filter.glutenFree : _glutenFilterChange,
            Filter.lactoseFree : _lactoseFilterChange,
            Filter.vegetarian : _vegetarianFilterChange,
            Filter.vegan : _veganFilterChange,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFilterChange,
              onChanged: (value) {
                setState(() {
                  _glutenFilterChange = value;
                });
                
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              title: Text(
                "Gluten-free",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only includes gluten-free meals",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
            SwitchListTile(
              value: _lactoseFilterChange,
              onChanged: (value) {
                setState(() {
                  _lactoseFilterChange = value;
                });
                
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              title: Text(
                "Lactose-free",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only includes lactose-free meals",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
            SwitchListTile(
              value: _vegetarianFilterChange,
              onChanged: (value) {
                setState(() {
                  _vegetarianFilterChange = value;
                });
                
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only includes vegetarian meals",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
            SwitchListTile(
              value: _veganFilterChange,
              onChanged: (value) {
                setState(() {
                  _veganFilterChange = value;
                });
                
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only includes vegan meals",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
