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
    AnimationController controller = AnimationController(
        duration: Duration(milliseconds: 200000), vsync: this);
    animation = Tween<double>(begin: 0, end: imageAssets.length * slotWidth)
        .animate(controller);
    super.initState();
    setState(() {
      slotItems.addAll([
        _SingleSlotWidget(
          slotHeight,
          slotWidth,
          imageAssets[0],
          listenable: animation,
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

class _SingleSlotWidget extends AnimatedWidget {
  final double height;
  final double width;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height-(listenable as Animation<double>).value,
      width: width,
      margin: EdgeInsets.only(bottom: (listenable as Animation<double>).value),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Image.asset(
          imageAsset,
          width: width,
          height: height,
          fit: BoxFit.none,
        ),
      ),
    );
  }

  _SingleSlotWidget(this.height, this.width, this.imageAsset,
      {Key key, Listenable listenable})
      : super(key: key, listenable: listenable);
}
