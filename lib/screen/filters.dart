import 'package:flutter/material.dart';
import 'package:meals/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: selectedFilters[Filter.glutenfree]!,
            onChanged: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenfree, value);
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 40,
            ),
          ),
          SwitchListTile(
            value: selectedFilters[Filter.lactosefree]!,
            onChanged: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactosefree, value);
            },
            title: Text(
              'Lactose-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include lactose-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 40,
            ),
          ),
          SwitchListTile(
            value: selectedFilters[Filter.vegeterian]!,
            onChanged: (value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegeterian, value);
            },
            title: Text(
              'Vegeterian Only',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegeterian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 40,
            ),
          ),
          SwitchListTile(
            value: selectedFilters[Filter.vegan]!,
            onChanged: (value) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, value);
            },
            title: Text(
              'Vegan only',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 40,
            ),
          ),
        ],
      ),
    );
  }
}
