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

class _SlotWidgetState extends State<SlotWidget> with TickerProviderStateMixin {
  final double slotHeight;
  final double slotWidth;
  final List<String> imageAssets;
  final double totalHeight;
  List<Widget> slotItems = [];

  _SlotWidgetState(
      this.imageAssets, this.slotHeight, this.slotWidth, this.totalHeight);

  @override
  void initState() {
    AnimationController controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    super.initState();
    setState(() {
      slotItems.addAll([
        _SingleSlotWidget(
          slotHeight,
          slotWidth,
          imageAssets.last,
          totalHeight,
          listenable: Tween<double>(begin: 0, end: totalHeight + slotHeight)
              .animate(controller),
        ),
      ]);
    });
    imageAssets.removeLast();
    controller.forward();
  }

  void removeListener(item) {
    if (totalHeight +
            slotHeight -
            ((item as _SingleSlotWidget).listenable as Animation).value <
        0) {
      setState(() {
        slotItems.remove(item);
      });
    }
  }

  void createListener(item) {
    if (((item as _SingleSlotWidget).listenable as Animation).value >
        slotHeight + 1.0) {
      AnimationController controller = AnimationController(
          duration: Duration(milliseconds: 500), vsync: this);
      if (imageAssets.length > 1) {
        setState(() {
          slotItems.addAll([
            _SingleSlotWidget(
              slotHeight,
              slotWidth,
              imageAssets.last,
              totalHeight,
              listenable: Tween<double>(begin: 0, end: totalHeight + slotHeight)
                  .animate(controller),
            ),
          ]);
          imageAssets.removeLast();
          controller.forward();
        });
      } else {
        setState(() {
          ///todo wrong animation duration
          slotItems.addAll([
            _SingleSlotWidget(
              slotHeight,
              slotWidth,
              imageAssets.last,
              totalHeight,
              listenable:
                  Tween<double>(begin: 0, end: slotHeight).animate(controller),
            ),
          ]);
        });
        imageAssets.removeLast();
        controller.forward();
      }
      ((item as _SingleSlotWidget).listenable as Animation)
          .removeListener(() => createListener(item));
    }
  }

  @override
  Widget build(BuildContext context) {
    slotItems.forEach((item) {
      ((item as _SingleSlotWidget).listenable as Animation)
          .addListener(() => removeListener(item));
    });
    ((slotItems.last as _SingleSlotWidget).listenable as Animation)
        .addListener(() => createListener(slotItems.last));
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
              ? totalHeight - (listenable as Animation<double>).value + 1.0
              : 0.0),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        alignment: (listenable as Animation<double>).value >= height
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
