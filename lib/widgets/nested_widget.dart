import 'package:client_task/widgets/custom_radio.dart';
import 'package:flutter/material.dart';

class NestedWidget extends StatefulWidget {
  const NestedWidget({super.key});

  @override
  State<NestedWidget> createState() => _NestedWidgetState();
}

class _NestedWidgetState extends State<NestedWidget> {
  @override
  Widget build(BuildContext context) {
    return const CustomRadioWidget(
      groupId: "gender",
      radioValue: "others",
      isDefault: true,
    );
  }
}
