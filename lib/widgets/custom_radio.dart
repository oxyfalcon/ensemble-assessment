import 'package:client_task/notifiers/radio_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomRadioWidget extends ConsumerStatefulWidget {
  const CustomRadioWidget(
      {super.key,
      required this.radioValue,
      required this.groupId,
      this.isDefault = false});

  final String radioValue;
  final String groupId;
  final bool isDefault;
  @override
  ConsumerState<CustomRadioWidget> createState() => _CustomRadioWidgetState();
}

class _CustomRadioWidgetState extends ConsumerState<CustomRadioWidget> {
  late GroupNotifier notifier;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    notifier = ref.watch(groupProvider.notifier);
    notifier.addGroup(widget.groupId, widget.isDefault, widget.radioValue);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> g = ref.watch(groupProvider);
    return RadioListTile.adaptive(
        title: Text(widget.radioValue),
        value: widget.radioValue,
        groupValue: g[widget.groupId],
        onChanged: (String? value) {
          notifier.setGroupValue(widget.groupId, widget.radioValue);
        });
  }
}
