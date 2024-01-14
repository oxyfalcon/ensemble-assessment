  import 'package:client_task/widgets/custom_radio.dart';
import 'package:client_task/widgets/nested_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProviderScope(child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Client Task"),
      ),
      body: ListView(children: const <Widget>[
        CustomRadioWidget(
          radioValue: "male",
          groupId: "gender",
        ),
        CustomRadioWidget(
          radioValue: "female",
          groupId: "gender",
          isDefault: true,
        ),
        CustomRadioWidget(radioValue: "yes", groupId: "isAdult"),
        CustomRadioWidget(radioValue: "no", groupId: "isAdult"),
        NestedWidget()
      ]),
    );
  }
}

// class WidgetOne extends ConsumerWidget {
//   const WidgetOne({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     RadioValue radioValue = ref.watch(radioValueProvider);
//     RadioValueNotifier notifier = ref.read(radioValueProvider.notifier);
//     return Column(
//       children: [
//         RadioListTile.adaptive(
//             title: const Text("Radio One"),
//             value: RadioValue.valueOne,
//             groupValue: radioValue,
//             onChanged: (value) {
//               notifier.changeValue(value!);
//             }),
//       ],
//     );
//   }
// }

// class WidgetTwo extends ConsumerWidget {
//   const WidgetTwo({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     RadioValue value = ref.watch(radioValueProvider);
//     RadioValueNotifier notifier = ref.read(radioValueProvider.notifier);
//     return Column(
//       children: [
//         RadioListTile.adaptive(
//           title: const Text("Radio Two"),
//           groupValue: value,
//           value: RadioValue.valueTwo,
//           onChanged: (value) => notifier.changeValue(value),
//         ),
//       ],
//     );
//   }
// }

// class RadioValueNotifier extends Notifier<RadioValue> {
//   @override
//   RadioValue build() => RadioValue.empty;

//   void changeValue(RadioValue? value) {
//     state = value ?? RadioValue.empty;
//   }
// }

// final radioValueProvider = NotifierProvider<RadioValueNotifier, RadioValue>(
//     () => RadioValueNotifier());

enum RadioValue { valueOne, valueTwo, empty }
