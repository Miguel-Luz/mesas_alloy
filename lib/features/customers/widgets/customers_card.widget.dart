import 'package:flutter/material.dart';
import 'package:teste_flutter/features/customers/widgets/action_customer_widget.dart';
import 'package:teste_flutter/features/customers/widgets/edit_customer_modal.widget.dart';
import 'package:teste_flutter/features/customers/widgets/remove_customer_modal.widget.dart';
import 'package:teste_flutter/features/tables/entities/table.entity.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

class CustomersCard extends StatelessWidget {
  const CustomersCard({
    super.key,
    this.color,
    this.textStyle,
    required this.table,
  });

  final Color? color;
  final TextStyle? textStyle;
  final TableEntity table;

  @override
  Widget build(BuildContext context) {
    const double innerPadding = 1.0;
    const double topPadding = 5.0;

    return Container(
      padding: const EdgeInsets.fromLTRB(
        innerPadding,
        topPadding,
        innerPadding,
        innerPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.appColors.lightGreen,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'NOME',
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.appColors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  'TELEFONE',
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.appColors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Observer(
            builder: (_) => Column(
              children: table.customers
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => EditCustomerModal(
                            customer: e,
                            table: table,
                          ),
                        );
                      },
                      child: Tooltip(
                        message: e.busy ? 'Editar ${e.name}' : '',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    e.name,
                                    style: textStyle ??
                                        context.textTheme.bodySmall,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    e.phone,
                                    style: textStyle ??
                                        context.textTheme.bodySmall,
                                  ),
                                ),
                              ),
                              ActionCustomer(
                                addCustomer: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => EditCustomerModal(
                                      customer: e,
                                      table: table,
                                    ),
                                  );
                                },
                                removeCustomer: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => RemoveCustomerModal(
                                      customer: e,
                                      table: table,
                                    ),
                                  );
                                },
                                busy: e.busy,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
