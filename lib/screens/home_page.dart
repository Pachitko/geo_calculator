import 'package:flutter/material.dart';
import 'deg_to_gms_page.dart';
import 'gms_to_degree_page.dart';
import 'direct_calc_page.dart';
import 'round_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Center(
                child: Text(
                  'ГЕО калькулятор',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              getPageButton(context, const DegPage(), "Deg to GMS "),
              getPageButton(context, const GMSPage(), "GMS to Deg"),
              getPageButton(context, const DirectPage(), "Прямая геодезическая задача"),
              getPageButton(context, const RoundPage(), "Обратная геодезическая задача"),
            ],
          ),
        ),
      )
    );
  }
}

Widget getPageButton(BuildContext context, root, String text) {
  return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => root),
          );
        },
        style: ButtonStyle(
          alignment: Alignment.center,
          fixedSize: const MaterialStatePropertyAll(Size(130, 100)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        child: Text(
            text,
            style: const TextStyle(color: Colors.black)),
      )
  );
}
