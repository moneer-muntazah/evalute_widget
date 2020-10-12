import "package:flutter/material.dart";
import "dart:typed_data";
import "package:overlay_container/overlay_container.dart";

const ipsum = "Duis nec velit dictum, consectetur lectus ut, viverra sem. Sed maximus sapien eu sapien mollis, ultricies dapibus nibh pellentesque. Nulla facilisi. Morbi sollicitudin, ligula non malesuada congue, mauris purus convallis erat, in ornare diam nisi id nunc. Nullam laoreet dolor sit amet imperdiet pharetra. Aliquam eleifend sem erat, eu aliquet purus sagittis vitae. Sed ullamcorper molestie volutpat. Nulla facilisi. Maecenas hendrerit libero a sapien tristique, a varius ligula vehicula. Nulla facilisi. Nulla sed magna id nunc hendrerit finibus. Quisque dapibus consequat consequat. Nulla ut libero ex. Nam nec urna a massa laoreet viverra. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam a nisi a magna elementum efficitur vitae non felis. ";

class Evaluate extends StatefulWidget {
  final Widget child;

  Evaluate({this.child});

  @override
  _EvaluateState createState() => _EvaluateState();
}

class _EvaluateState extends State<Evaluate> {
  double height = 50;

  @override
  Widget build(BuildContext context) {

    var m = Matrix4.fromFloat64List(Float64List.fromList([
      1, 0, 0, 0,
      0, -1, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 1
    ]));

    print("ok");
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        OverlayContainer(
          show: true,
          position: OverlayContainerPosition(
            0, 0
          ),
          child: Listener(
            onPointerDown: (PointerDownEvent downEvent) {
              print(downEvent.localPosition);
              setState(() {
                height += 5;
              });
            },
            child: Container(
              height: height,

              transform: m,
              color: Colors.purpleAccent,
              child: Text("heloo"),
            ),
          ),
        ),
        widget.child
      ],
    );
  }
}
