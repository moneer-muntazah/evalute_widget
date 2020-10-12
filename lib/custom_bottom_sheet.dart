import "package:flutter/material.dart";

final text = "At vero eos et accusamus et iusto odio dignissimos ducimus qui "
    "blanditiis praesentium voluptatum deleniti atque corrupti quos dolores "
    "et quas molestias excepturi sint occaecati cupiditate non provident, "
    "similique sunt in culpa qui officia deserunt mollitia animi, id est "
    "laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita "
    "distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque "
    "nihil impedit quo minus id quod maxime placeat facere possimus, omnis "
    "voluptas assumenda est, omnis dolor repellendus. Temporibus autem "
    "quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet "
    "ut et voluptates repudiandae sint et molestiae non recusandae. Itaque "
    "earum rerum hic tenetur a sapiente delectus, ut aut reiciendis "
    "voluptatibus maiores alias consequatur aut perferendis doloribus "
    "asperiores repellat.";

class CustomBottomSheet extends StatefulWidget {
  final Widget child;

  CustomBottomSheet({this.child});

  @override
  State createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  double height = 50;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent downEvent) {
        print(downEvent.localPosition);
        setState(() {
          height += 10;
        });
      },
      onPointerMove: (PointerMoveEvent moveEvent) {
        print(moveEvent.localPosition);
      },
      onPointerUp: (PointerUpEvent upEvent) {
        print(upEvent.localPosition);
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          IntrinsicHeight(
            child: Container(
              color: Colors.redAccent,
              constraints: BoxConstraints.tightFor(height: height),
              child: Text(text),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}
