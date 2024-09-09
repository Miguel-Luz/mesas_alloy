import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/features/tables/widgets/table_card.widget.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

class TablesList extends StatelessWidget {
  TablesList({super.key});

  final tablesStore = GetIt.I.get<TablesStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(builder: (_) {
              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: tablesStore.filtredTables
                    .map(
                      (table) => Stack(
                        children: [
                          TableCard(
                            table: table,
                          ),
                          Positioned(
                            bottom: 4,
                            right: 4,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(20),
                              ),
                              child: Material(
                                child: InkWell(
                                  onTap: () {
                                    tablesStore.removetable(table);
                                  },
                                  child: Ink(
                                    height: 28,
                                    width: 24.5,
                                    decoration: BoxDecoration(
                                      color: context.appColors.green,
                                    ),
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              );
            }),
          ],
        ));
  }
}
