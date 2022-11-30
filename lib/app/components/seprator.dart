import 'package:flutter/material.dart';
class Seprator extends StatelessWidget {
  const Seprator({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
          Visibility(
            visible: onPressed!=null,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "See all",
                style:
                    TextStyle(color: Colors.black38, fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}