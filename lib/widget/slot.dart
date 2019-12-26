import 'package:flutter/material.dart';

class SlotWidget extends StatefulWidget {
  final double slotHeight;
  final double slotWidth;
  final double totalWidth;
  final List<String> imageAssets;

  SlotWidget(this.imageAssets, this.slotHeight, this.slotWidth, this.totalWidth,
      {Key key})
      : super(key: key);

  @override
  _SlotWidgetState createState() =>
      _SlotWidgetState(imageAssets, slotHeight, slotWidth, totalWidth);
}

class _SlotWidgetState extends State<SlotWidget>
    with SingleTickerProviderStateMixin {
  final double slotHeight;
  final double slotWidth;
  final List<String> imageAssets;
  final double totalWidth;
  Animation animation;
  List<Widget> slotItems = [];

  _SlotWidgetState(
      this.imageAssets, this.slotHeight, this.slotWidth, this.totalWidth);

  @override
  void initState() {
    AnimationController controller =
        AnimationController(duration: Duration(milliseconds: 20000), vsync: this);
    animation = Tween<double>(begin: 0, end: imageAssets.length * slotWidth)
        .animate(controller);
    super.initState();
    setState(() {
      slotItems.addAll([
        Container(
          height: slotHeight,
          width: slotWidth,
          child: Container(
            padding: EdgeInsets.only(bottom: (animation.value)),
            child: Image.asset(imageAssets[0]),
          ),
        ),
      ]);
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: slotItems,
    );
  }
}
