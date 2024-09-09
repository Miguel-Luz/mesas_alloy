import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_flutter/features/customers/entities/customer.entity.dart';
import 'package:teste_flutter/features/tables/entities/table.entity.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/shared/widgets/modal.widget.dart';
import 'package:teste_flutter/shared/widgets/primary_button.widget.dart';
import 'package:teste_flutter/shared/widgets/secondary_button.widget.dart';

class EditTableModal extends StatefulWidget {
  const EditTableModal({super.key, this.table});

  final TableEntity? table;

  @override
  State<EditTableModal> createState() => _EditTableModalState();
}

class _EditTableModalState extends State<EditTableModal> {
  TableEntity? get table => widget.table;
  final tablesStore = GetIt.I<TablesStore>();

  final identificationController = TextEditingController();
  final quantityController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  _increment() {
    final value = int.tryParse(quantityController.text) ?? 0;
    quantityController.text = (value + 1).toString();
  }

  _decrement() {
    final value = int.tryParse(quantityController.text) ?? 0;
    if (value == 0) return;
    quantityController.text = (value - 1).toString();
  }

  String? _inputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }

  String? _inputValidatorQuantity(String? value) {
    final value = int.tryParse(quantityController.text) ?? 0;
    if (value < 1) {
      return 'Quantidade inválida';
    }

    return null;
  }

  void _handleSave() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final newTable = TableEntity(
      id: table?.id ?? DateTime.now().millisecondsSinceEpoch,
      identification: identificationController.text,
      customers: ObservableList.of(
        List.generate(
          int.tryParse(quantityController.text) ?? 0,
          (i) => CustomerEntity.empty(i++),
        ),
      ),
    );

    if (table == null) {
      tablesStore.addtable(newTable);
    } else {
      tablesStore.updatetable(newTable);
    }

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    identificationController.text = table?.identification ?? '';
    quantityController.text = table?.spaceQuantity ?? '0';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Modal(
          width: 280,
          title: '${table == null ? 'Nova' : 'Editar'} mesa',
          content: [
            TextFormField(
              controller: identificationController,
              decoration: const InputDecoration(labelText: 'Identificação'),
              validator: _inputValidator,
              autofocus: true,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: quantityController,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                    decoration: InputDecoration(
                      labelText: 'Qtd. Lugares',
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    validator: _inputValidatorQuantity,
                    autofocus: true,
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 5),
                SecondaryButton(
                  onPressed: _decrement,
                  text: '-',
                ),
                const SizedBox(width: 5),
                PrimaryButton(
                  onPressed: _increment,
                  text: '+',
                ),
              ],
            ),
          ],
          actions: [
            SecondaryButton(
              onPressed: () => Navigator.of(context).pop(),
              text: 'Cancelar',
            ),
            PrimaryButton(onPressed: _handleSave, text: 'Salvar'),
          ],
        ));
  }
}
