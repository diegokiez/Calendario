import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calendario(),
    );
  }
}

class Calendario extends StatelessWidget {
  TextEditingController data = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextFormField(
        controller: data,
        decoration: InputDecoration(
            hintText: "Fecha",
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
                onPressed: () async {
                  DateTime? fecha = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 3650)),
                      lastDate: DateTime.now().add(const Duration(days: 3650)));
                  if (fecha != null) {
                    data.text = DateFormat("yyyy/MM/dd").format(fecha);
                  }
                },
                icon: const Icon(Icons.calendar_month_outlined))),
      ),
    );
  }
}
