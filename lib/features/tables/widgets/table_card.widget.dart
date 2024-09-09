import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_flutter/features/tables/entities/table.entity.dart';
import 'package:teste_flutter/features/customers/widgets/customers_card.widget.dart';
import 'package:teste_flutter/features/tables/widgets/customers_counter.widget.dart';
import 'package:teste_flutter/features/tables/widgets/edit_table_modal.widget.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

const double _innerPadding = 1.0;
const double _topPadding = 5.0;

class TableCard extends StatelessWidget {
  const TableCard({
    super.key,
    required this.table,
  });

  final TableEntity table;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        _innerPadding,
        _topPadding,
        _innerPadding,
        _innerPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.appColors.lightGreen,
      ),
      width: 285,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(table.identification.toUpperCase(),
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: context.appColors.green,
                        fontWeight: FontWeight.w500)),
              ),
              Observer(builder: (_) {
                return CustomersCounter(
                  label: table.occupation,
                  iconWidth: 18,
                  color: context.appColors.green,
                  textStyle: context.textTheme.bodySmall
                      ?.copyWith(color: context.appColors.green),
                );
              }),
              TextButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => EditTableModal(table: table),
                  );
                },
                icon: Icon(
                  Icons.edit,
                  color: context.appColors.green,
                  size: 14,
                ),
                label: Text(
                  'Alterar',
                  style: context.textTheme.bodySmall
                      ?.copyWith(color: context.appColors.green),
                ),
              )
            ],
          ),
          const SizedBox(height: _innerPadding),
          Card(
            elevation: 1,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
              child: CustomersCard(
                table: table,
                color: context.appColors.darkGrey,
                textStyle: context.textTheme.bodySmall
                    ?.copyWith(color: context.appColors.darkGrey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
