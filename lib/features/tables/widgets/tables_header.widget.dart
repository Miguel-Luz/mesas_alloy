import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/features/tables/widgets/customers_counter.widget.dart';
import 'package:teste_flutter/features/tables/widgets/edit_table_modal.widget.dart';
import 'package:teste_flutter/shared/widgets/search_input.widget.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

class TablesHeader extends StatelessWidget {
  const TablesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final tablesStore = GetIt.I<TablesStore>();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Text(
              'Mesas',
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(width: 20),
            SearchInput(
              onChanged: (value) => tablesStore.searchField = value ?? '' ,
            ),
            const SizedBox(width: 20),
            Observer(
              builder: (_) {
                return CustomersCounter(
                  label: tablesStore.occupation.toString(),
                );
              },
            ),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => const EditTableModal(),
                );
              },
              tooltip: 'Criar nova mesa',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
