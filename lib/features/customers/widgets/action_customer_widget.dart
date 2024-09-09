import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_flutter/utils/constants/app_icons.constants.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

class ActionCustomer extends StatelessWidget {
  const ActionCustomer({
    super.key,
    required this.addCustomer,
    required this.removeCustomer,
    required this.busy,
  });

  final Function addCustomer;
  final Function removeCustomer;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => busy ? removeCustomer() : addCustomer(),
      child: SvgPicture.asset(
        busy ? AppIcons.userRemove : AppIcons.userAdd,
        width: 14,
        colorFilter: ColorFilter.mode(
          context.appColors.green!,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
