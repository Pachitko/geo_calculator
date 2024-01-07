import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/geo_math.dart';

class DegPage extends StatefulWidget {
  const DegPage({super.key});

  @override
  State<DegPage> createState() => DegPageState();
}

class DegPageState extends State<DegPage> {
  final TextEditingController _textController = TextEditingController();
  String res = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(50),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _textController,
                  onSubmitted: (value) {
                    setState(() {
                      res = GeoMath.toGMS(double.parse(_textController.text));
                    });
                  },
                  decoration: const InputDecoration(
                      labelText: "Введите градусы:",
                      border: OutlineInputBorder()),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              SelectableText(
                res,
                style: const TextStyle(fontSize: 25, color: Colors.white),
                onTap: () {
                  _textController.clear();
                  Clipboard.setData(ClipboardData(text: res)).then(
                    (_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Текст скопирован!",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
