import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_flutter/features/customers/entities/customer.entity.dart';
import 'package:teste_flutter/features/tables/entities/table.entity.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/shared/widgets/modal.widget.dart';
import 'package:teste_flutter/shared/widgets/primary_button.widget.dart';
import 'package:teste_flutter/shared/widgets/secondary_button.widget.dart';

class RemoveCustomerModal extends StatelessWidget {
  RemoveCustomerModal({
    super.key,
    required this.customer,
    required this.table,
  });

  final CustomerEntity customer;
  final TableEntity table;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final tableStore = GetIt.I<TablesStore>();

  _remover() {
    tableStore.removeCustomerAtTable(
      customer: customer,
      table: table,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Modal(
        width: 280,
        title: 'Atenção',
        content: [Text('Deseja remover: ${customer.name}')],
        actionsAlignment: MainAxisAlignment.end,
        actions: [
          SecondaryButton(
            onPressed: () => Navigator.of(context).pop(),
            text: 'Cancelar',
          ),
          PrimaryButton(
            onPressed: () {
              _remover();
              Navigator.of(context).pop();
            },
            text: 'Remover',
          ),
        ],
      ),
    );
  }
}
