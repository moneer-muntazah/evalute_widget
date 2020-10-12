import "package:flutter/material.dart";

class CustomBottomSheet extends StatefulWidget {
  @override
  State createState() => _CustomBottomSheetState();
}


class _CustomBottomSheetState extends State<CustomBottomSheet> {
  double height = 50;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        color: Colors.redAccent,
        constraints: BoxConstraints(minHeight: height,
        ),
      ),
    );
  }
}
