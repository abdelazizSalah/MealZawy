/// this file contains the screen of the settings filter

import 'package:flutter/material.dart';
import '../Wigdets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Map<String, bool> filters;
  final Function saveFilters;
  const FiltersScreen(
      {super.key, required this.filters, required this.saveFilters});
  static const routeName = '/filters-route';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _vegiterian = false;
  bool _vegan = false;
  bool _glutenFree = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _vegan = widget.filters['Vegan'] as bool;
    _vegiterian = widget.filters['Vegiterian'] as bool;
    _glutenFree = widget.filters['Gluten'] as bool;
    _lactoseFree = widget.filters['Lactose'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(title, desc, currentVal, func, ctx) {
    final theme = Theme.of(context);

    return Card(
      elevation: 5,
      shadowColor: theme.colorScheme.primary,
      child: SwitchListTile(
        title: Text(
          title,
          style: theme.textTheme.displayMedium,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 7.5),
          child: Text(
            desc,
            style: theme.textTheme.displayLarge,

            // style: theme.,
          ),
        ),
        value: currentVal,
        onChanged: func,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                Map<String, bool> newFilters = {
                  'Vegiterian': _vegiterian,
                  'Vegan': _vegan,
                  'Gluten': _glutenFree,
                  'Lactose': _lactoseFree,
                };

                widget.saveFilters(newFilters);
              },
            )
          ],
        ),
        drawer: const MainDrawer(),
        body: Container(
          color: theme.colorScheme.background,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text('Adjust your meal selection'),
              ),
              _buildSwitchListTile(
                'Vegitarian',
                'Only include vegitarian meals',
                _vegiterian,
                (newVal) {
                  setState(() {
                    _vegiterian = newVal;
                  });
                },
                context,
              ),
              _buildSwitchListTile(
                'Vegan',
                'Only include Vegan meals',
                _vegan,
                (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                },
                context,
              ),
              _buildSwitchListTile(
                'Gluten-Free',
                'Only include Gluten-Free meals',
                _lactoseFree,
                (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                },
                context,
              ),
              _buildSwitchListTile(
                'Lactose-Free',
                'Only include Lactose-Free meals',
                _glutenFree,
                (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                },
                context,
              )
            ],
          ),
        ));
  }
}
