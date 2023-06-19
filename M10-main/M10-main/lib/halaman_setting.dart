import 'package:app_m10/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:app_m10/provider.dart';
import 'package:provider/provider.dart';

class HalamanSetting extends StatefulWidget {
  const HalamanSetting({super.key});

  @override
  State<HalamanSetting> createState() => _HalamanSettingState();
}

class _HalamanSettingState extends State<HalamanSetting> {
  @override
  Widget build(BuildContext context) {
    DialogProvider dialogProvider = Provider.of<DialogProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 10'),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(height: 16),
        MaterialBanner(
            content:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Banner',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ]),
            actions: [
              TextButton(
                onPressed: () => ScaffoldMessenger.of(context)
                  ..removeCurrentMaterialBanner()
                  ..showMaterialBanner(showBanner(context)),
                child: const Text('Show Banner'),
              ),
            ]),
        const SizedBox(height: 16),
        MaterialBanner(
            content:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Setting',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('${dialogProvider.selectedOption}')
            ]),
            actions: [
              TextButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) =>
                          showAlertDialog(context, dialogProvider)),
                  child: const Text('Phone Ringtone'))
            ]),
      ]),
    );
  }
}

showBanner(BuildContext context) {
  return MaterialBanner(
    content: const Text('Flutter Tutorial',
        style: TextStyle(fontWeight: FontWeight.bold)),
    leading: const Icon(Icons.info, color: Colors.yellow),
    actions: [
      TextButton(
          onPressed: () =>
              ScaffoldMessenger.of(context).showSnackBar(showSnackBar(context)),
          child: const Text('Update')),
      TextButton(
          onPressed: () =>
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
          child: const Text('Dismiss'))
    ],
  );
}

showSnackBar(BuildContext context) {
  return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 6),
      content: Row(children: [
        Icon(Icons.info),
        SizedBox(width: 8),
        Flexible(child: Text('Hey User '))
      ]),
      action: SnackBarAction(
          label: 'ADD',
          textColor: Colors.white,
          onPressed: () =>
              ScaffoldMessenger.of(context).removeCurrentSnackBar()));
}

showAlertDialog(BuildContext context, DialogProvider dialogProvider) {
  return AlertDialog(
    title: const Text('Phone Ringtone'),
    content: SingleChildScrollView(
      child: Container(
          width: 30,
          height: 340,
          child: ListView(children: getRadioListTile(context, dialogProvider))),
    ),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancell')),
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Accept')),
    ],
  );
}

getRadioListTile(BuildContext context, DialogProvider dialogProvider) {
  return List.generate(dialogProvider.options.length, (index) {
    String option = dialogProvider.options[index];

    return RadioListTile<String?>(
      title: Text(option),
      value: option,
      groupValue: dialogProvider.selectedOption,
      onChanged: (String? value) {
        dialogProvider.selectedOption = value;
        print('${dialogProvider.selectedOption}');
      },
    );
  });
}
