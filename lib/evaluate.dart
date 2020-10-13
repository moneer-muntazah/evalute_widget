import "package:flutter/material.dart";

class Evaluate extends StatefulWidget {
  @override
  _EvaluateState createState() => _EvaluateState();
}

class _EvaluateState extends State<Evaluate>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  double lowHeight, topHeight, height;

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    controller.addListener(() {
      setState(() {
        height = animation.value;
      });
    });
    // });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void startAnimation(PointerUpEvent upEvent) {
    final midHeight = topHeight / 2;

    final end = height <= midHeight ? lowHeight : topHeight;

    final tween = Tween<double>(begin: height, end: end);

    //tween.animate(CurvedAnimation(parent: controller,
    // curve: Curves.elasticInOut));
    animation = controller.drive(tween);
    controller.reset();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    topHeight = MediaQuery.of(context).size.height / 3;
    lowHeight = topHeight / 3;
    height ??= lowHeight;

    return Listener(
      onPointerDown: (PointerDownEvent downEvent) {
        // print(downEvent.localPosition);
        // setState(() {
        //   height += 5;
        // });
      },
      onPointerMove: (PointerMoveEvent moveEvent) {
        // print(moveEvent.delta);
        final h = height - moveEvent.delta.dy;
        if (h >= lowHeight && h <= topHeight) {
          setState(() {
            height -= moveEvent.delta.dy;
          });
        }
      },
      onPointerUp: startAnimation,
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
                ),
              ),
            ),
            Container(
              height: height,
              alignment: AlignmentDirectional.topStart,
              child: OverflowBox(
                alignment: AlignmentDirectional.topStart,
                maxHeight: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("send feedback"),
                      Text(
                        "tell us your suggestion",
                        style:
                        TextStyle(color: Colors.grey[200], fontSize: 12),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        decoration:
                        InputDecoration(border: OutlineInputBorder()),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,

                        ),
                        padding: const EdgeInsets.all(10),
                        child: RaisedButton(
                          elevation: 0,
                          onPressed: () {

                          },
                          child: Text(
                            "send",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
