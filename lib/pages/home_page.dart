import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _inputField(
            title: "Title",
            hint: "Enter title",
            controller: _titleController,
            size: size),
        _inputField(
            title: "Note",
            hint: "Enter note",
            controller: _titleController,
            size: size),
        // Future<DateTime>showDatePicker(
        //   context: context,
        //   initialDate: DateTime.now(),
        //   firstDate: DateTime(2020),
        //   lastDate: DateTime(2030),
        // ),
      ]),
    ));
  }

  Widget _inputField(
      {required String title,
      required String hint,
      required TextEditingController controller,
      required Size size}) {
    return SizedBox(
      width: size.width * 0.9,
      child: TextFormField(
        // initialValue: "Enter title",
        controller: _titleController,
        decoration: InputDecoration(
          hintText: hint,
          labelText: title,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 2,
              )),
        ),
      ),
    );
  }
}
