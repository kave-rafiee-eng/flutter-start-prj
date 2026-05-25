import 'package:flutter/material.dart';
import 'package:flutter_application_1/meals/widgets/swtchFilter.dart';
import 'package:flutter_application_1/meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegeterianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilter = ref.read(filterProvider);

    _glutenFreeFilterSet = activeFilter[Filter.glutenFree]!;
    _lactoseFreeFilterSet = activeFilter[Filter.lactoseFree]!;
    _vegeterianFilterSet = activeFilter[Filter.vegetarian]!;
    _veganFilterSet = activeFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('your Filters...')),
      // drawer: MainDrawer(onSelectScreen: _setScreen),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, a) {
          ref.read(filterProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegeterianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          if (didPop) return;
          Navigator.of(context).pop();
          // return true;
          // Navigator.of(context).pop({
          //   Filter.glutenFree: _glutenFreeFilterSet,
          //   Filter.lactoseFree: _lactoseFreeFilterSet,
          //   Filter.vegetarian: _vegeterianFilterSet,
          //   Filter.vegan: _veganFilterSet,
          // });
        },

        child: Column(
          children: [
            Switchfilter(
              onChanged: (newV) {
                setState(() {
                  _glutenFreeFilterSet = newV;
                });
                print('message');
              },
              state: _glutenFreeFilterSet,
              title: 'gloten-free',
              subtitle: 'include only gloten Free',
            ),

            //-----------------------------------------------------------
            Switchfilter(
              onChanged: (newV) {
                setState(() {
                  _lactoseFreeFilterSet = newV;
                });
              },
              state: _lactoseFreeFilterSet,
              title: 'lactose-free',
              subtitle: 'include only lactose Free',
            ),

            //-----------------------------------------------------------
            Switchfilter(
              onChanged: (newV) {
                setState(() {
                  _vegeterianFilterSet = newV;
                });
              },
              state: _vegeterianFilterSet,
              title: 'vegeterian-free',
              subtitle: 'include only vegeterian Free',
            ),

            //-----------------------------------------------------------
            Switchfilter(
              onChanged: (newV) {
                setState(() {
                  _veganFilterSet = newV;
                });
              },
              state: _veganFilterSet,
              title: 'vegan-free',
              subtitle: 'include only vegan Free',
            ),
            //-----------------------------------------------------------
          ],
        ),
      ),
    );
  }
}
