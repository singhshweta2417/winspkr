import 'package:flutter/material.dart';

class SmallSlidingSwitch extends StatefulWidget {
  final double height;
  final ValueChanged<bool> onChanged;
  final double width;
  final bool value;
  final String textOff;
  final String textOn;
  final IconData ?iconOff;
  final IconData ?iconOn;
  final double contentSize;
  final Duration animationDuration;
  final Color colorOn;
  final Color colorOff;
  final Color background;
  final Color buttonColor;
  final Color inactiveColor;
  final Function onTap;
  final Function onDoubleTap;
  final Function onSwipe;

  const SmallSlidingSwitch({super.key,
    required this.value,
    required this.onChanged,
    this.height = 55,
    this.width = 250,
    this.animationDuration = const Duration(milliseconds: 400),
    required this.onTap,
    required this.onDoubleTap,
    required this.onSwipe,
    this.textOff = "Off",
    this.textOn = "On",
    this.iconOff,
    this.iconOn,
    this.contentSize = 12,
    this.colorOn = const Color(0xffdc6c73),
    this.colorOff = const Color(0xfff7f5f7),
    this.background = const Color(0xffe4e5eb),
    this.buttonColor = const Color(0xfff7f5f7),
    this.inactiveColor = const Color(0xfff7f5f7),
  });
  @override
  _SmallSlidingSwitch createState() => _SmallSlidingSwitch();
}

class _SmallSlidingSwitch extends State<SmallSlidingSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  double value = 0.0;

  late bool turnState;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: widget.animationDuration);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationController.addListener(() {
      setState(() {
        value = animation.value;
      });
    });
    turnState = widget.value;
    _determine();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: () {
          _action();
          if (widget.onDoubleTap != null) widget.onDoubleTap();
        },
        onTap: () {
          _action();
          if (widget.onTap != null) widget.onTap();
        },
        onPanEnd: (details) {
          _action();
          if (widget.onSwipe != null) widget.onSwipe();
        },
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color: widget.background,
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(2),
          child: Stack(children: <Widget>[
            Transform.translate(
                offset: Offset(((widget.width * 0.5) * value - (2 * value)), 0),
                child: Container(
                  height: widget.height,
                  width: widget.width * 0.5 - 4,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: widget.buttonColor,
                      boxShadow: [
                         BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 10),
                          blurRadius: 20.0,
                        ),
                      ]),
                )),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: widget.iconOff == null
                        ? Text(
                      widget.textOff,
                      style: TextStyle(
                          color: turnState
                              ? widget.inactiveColor
                              : widget.colorOff,
                          fontSize: widget.contentSize,
                          fontWeight: FontWeight.w600),
                    )
                        : Icon(widget.iconOff,
                      semanticLabel: widget.textOff,
                      size: widget.contentSize,
                      color: turnState
                          ? widget.inactiveColor
                          : widget.colorOff,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: widget.iconOn == null
                        ? Text(
                      widget.textOn,
                      style: TextStyle(
                          color:
                          turnState ? widget.colorOn : widget.inactiveColor,
                          fontSize: widget.contentSize,
                          fontWeight: FontWeight.w600),
                    )
                        : Icon(widget.iconOn,
                      semanticLabel: widget.textOn,
                      size: widget.contentSize,
                      color: turnState
                          ? widget.colorOn
                          : widget.inactiveColor,
                    ),
                  ),
                )
              ],
            )
          ]),
        ));
  }

  _action() {
    _determine(changeState: true);
  }

  _determine({bool changeState = false}) {
    setState(() {
      if (changeState) turnState = !turnState;
      (turnState)
          ? animationController.forward()
          : animationController.reverse();
      if (changeState) widget.onChanged(turnState);
    });
  }
}