import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

class SquareTile extends StatefulWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  State<SquareTile> createState() => _SquareTileState();
}

class _SquareTileState extends State<SquareTile> {
  final Constants constants = Constants();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(0, 222, 219, 229),
      ),
      child: Image.asset(
        widget.imagePath,
        height: 50,
      ),
    );
  }
}
