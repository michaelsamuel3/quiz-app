import 'package:flutter/material.dart';

class Textboxfield extends StatefulWidget {
  final String text;
  final IconData iconName;
  final TextEditingController txtcontroller;
  final  dynamic validator;
  final bool hidetext;
  const Textboxfield(
      {super.key,
      required this.text,
      required this.iconName,
      required this.txtcontroller,
    required this.validator,
      required this.hidetext, 
      });

  @override
  State<Textboxfield> createState() => _TextboxfieldState();
}

class _TextboxfieldState extends State<Textboxfield> {
  late bool show=widget.hidetext;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Color.fromARGB(179, 208, 200, 200), borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
       validator: widget.validator,
        controller: widget.txtcontroller,
        obscureText: show,
        decoration: InputDecoration(
          
            hintText: widget.text,
            icon: Icon(
              widget.iconName,
              color: Colors.red,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
