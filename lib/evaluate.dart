import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

const ipsum =
    "Duis nec velit dictum, consectetur lectus ut, viverra sem. Sed maximus sapien eu sapien mollis, ultricies dapibus nibh pellentesque. Nulla facilisi. Morbi sollicitudin, ligula non malesuada congue, mauris purus convallis erat, in ornare diam nisi id nunc. Nullam laoreet dolor sit amet imperdiet pharetra. Aliquam eleifend sem erat, eu aliquet purus sagittis vitae. Sed ullamcorper molestie volutpat. Nulla facilisi. Maecenas hendrerit libero a sapien tristique, a varius ligula vehicula. Nulla facilisi. Nulla sed magna id nunc hendrerit finibus. Quisque dapibus consequat consequat. Nulla ut libero ex. Nam nec urna a massa laoreet viverra. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam a nisi a magna elementum efficitur vitae non felis. ";

class Evaluate extends StatefulWidget {
  @override
  _EvaluateState createState() => _EvaluateState();
}

class _EvaluateState extends State<Evaluate> {
  double height = 50;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent downEvent) {
        // print(downEvent.localPosition);
        // setState(() {
        //   height += 5;
        // });
      },
      onPointerMove: (PointerMoveEvent moveEvent) {
        print(moveEvent.delta);
        setState(() {
          height -= moveEvent.delta.dy;
        });
      },
      onPointerUp: (PointerUpEvent upEvent) {},
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: const Radius.circular(50),
                topLeft: const Radius.circular(50),
              ),
              child: Container(
                  height: 15,
                  color: Colors.grey[100],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 190),
                    child: Divider(
                      thickness: 5,
                    ),
                  )),
            ),
            Container(
              height: height,
              child: Text(ipsum),
            ),
          ],
        ),
      ),
    );
  }
}
