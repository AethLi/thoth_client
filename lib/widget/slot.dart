import 'package:flutter/material.dart';

class SlotWidget extends StatefulWidget {
  final double slotHeight;
  final double slotWidth;
  final double totalWidth;
  final List<String> imageAssets;
  final TickerProvider provider;

  SlotWidget(this.imageAssets, this.slotHeight, this.slotWidth, this.provider,
      this.totalWidth,
      {Key key})
      : super(key: key);

  @override
  _SlotWidgetState createState() => _SlotWidgetState(
      imageAssets, slotHeight, slotWidth, provider, totalWidth);
}

class _SlotWidgetState extends State<SlotWidget> {
  final double slotHeight;
  final double slotWidth;
  final List<String> imageAssets;
  final TickerProvider provider;
  final double totalWidth;
  static AnimationController controller =
      AnimationController(duration: Duration(milliseconds: 200), vsync: null);
  Animation animation;
  var thisStack = Stack();

  _SlotWidgetState(this.imageAssets, this.slotHeight, this.slotWidth,
      this.provider, this.totalWidth);

  @override
  void initState() {
    animation = Tween<double>(begin: 0, end: imageAssets.length * slotWidth)
        .animate(controller);
    super.initState();
    controller.forward();
    setState(() {
      thisStack.children.add(
        Container(
          height: slotHeight,
          width: slotWidth,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 100),
            padding: EdgeInsets.only(bottom: (animation.value)),
            child: Image.asset(imageAssets[0]),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return thisStack;
  }
}
