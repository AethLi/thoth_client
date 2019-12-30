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
    with TickerProviderStateMixin {
  final double slotHeight;
  final double slotWidth;
  final List<String> imageAssets;
  final double totalWidth;
  List<Widget> slotItems = [];

  _SlotWidgetState(
      this.imageAssets, this.slotHeight, this.slotWidth, this.totalWidth);

  @override
  void initState() {
    AnimationController controller = AnimationController(
        duration: Duration(milliseconds: 20000), vsync: this);
    super.initState();
    setState(() {
      slotItems.addAll([
        _SingleSlotWidget(
          slotHeight,
          slotWidth,
          imageAssets.last,
          totalWidth,
          listenable: Tween<double>(begin: 0, end: totalWidth + slotHeight)
              .animate(controller),
        ),
      ]);
    });
    imageAssets.removeLast();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    slotItems.forEach((item) {
      ((item as _SingleSlotWidget).listenable as Animation).addListener(() {
        if (totalWidth+slotHeight -
                ((item as _SingleSlotWidget).listenable as Animation).value <
            0) {
          setState(() {
            slotItems.remove(item);
          });
        }
      });
      if (((item as _SingleSlotWidget).listenable as Animation).value > 0) {
     /*   AnimationController controller = AnimationController(
            duration: Duration(milliseconds: 20000), vsync: this);
        setState(() {
          slotItems.addAll([
            _SingleSlotWidget(
              slotHeight,
              slotWidth,
              imageAssets.last,
              totalWidth,
              listenable: Tween<double>(begin: 0, end: totalWidth + slotHeight)
                  .animate(controller),
            ),
          ]);
        });*/
      }
    });
    return Stack(
      children: slotItems,
    );
  }
}

class _SingleSlotWidget extends AnimatedWidget {
  final double height;
  final double width;
  final double totalHeight;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: totalHeight,
      width: width,
      margin: EdgeInsets.only(
          bottom: (listenable as Animation<double>).value > height
              ? (listenable as Animation<double>).value - height
              : 0.0,
          top: (listenable as Animation<double>).value < height
              ? totalHeight + height - (listenable as Animation<double>).value
              : 0.0),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        alignment: (listenable as Animation<double>).value > height
            ? Alignment.bottomCenter
            : Alignment.topCenter,
        child: Image.asset(
          imageAsset,
          width: width,
          height: height,
        ),
      ),
    );
  }

  _SingleSlotWidget(this.height, this.width, this.imageAsset, this.totalHeight,
      {Key key, Listenable listenable})
      : super(key: key, listenable: listenable);
}
