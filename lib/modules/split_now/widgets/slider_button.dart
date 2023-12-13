import 'package:design_challenge/shared/global_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

enum SwipePosition {
  SwipeLeft,
  SwipeRight,
}

class SwipeController {
  late AnimationController _controller;

  void _attachController(AnimationController controller) => _controller = controller;

  /// Reset the Swipe button using a smooth animation
  /// Set the duration what you want
  void reset({Duration duration = const Duration(milliseconds: 600)}) {
    _controller.duration = duration;
    _controller.reverse();
  }
}

class SwipeButton extends StatefulWidget {
  const SwipeButton({
    Key? key,
    this.thumb,
    this.content,
    this.borderRadius = BorderRadius.zero,
    this.initialPosition = SwipePosition.SwipeLeft,
    this.swipeController,
    required this.onChanged,
    required this.height,
  }) : super(key: key);

  final Widget? thumb;
  final Widget? content;
  final BorderRadius borderRadius;
  final double height;
  final SwipePosition? initialPosition;
  final ValueChanged<SwipePosition> onChanged;
  final SwipeController? swipeController;

  @override
  SwipeButtonState createState() => SwipeButtonState(height: height);
}

class SwipeButtonState extends State<SwipeButton> with SingleTickerProviderStateMixin {
  final GlobalKey _containerKey = GlobalKey();
  final GlobalKey _positionedKey = GlobalKey();

  late AnimationController _controller;
  late Animation<double> _contentAnimation;
  Offset _start = Offset.zero;

  RenderBox get _positioned => _positionedKey.currentContext!.findRenderObject() as RenderBox;

  RenderBox get _container => _containerKey.currentContext!.findRenderObject() as RenderBox;

  final double height;
  SwipeButtonState({required this.height});
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _contentAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    if (widget.initialPosition == SwipePosition.SwipeRight) {
      _controller.value = 1.0;
    }
    widget.swipeController?._attachController(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 78,
      child: Stack(
        key: _containerKey,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: darkBg,
              borderRadius: BorderRadius.circular(56),
            ),
            child: ClipRRect(
              clipper: _SwipeButtonClipper(
                animation: _controller,
                borderRadius: widget.borderRadius,
              ),
              borderRadius: widget.borderRadius,
              child: SizedBox.expand(
                child: Padding(
                  padding: EdgeInsets.only(left: widget.height),
                  child: FadeTransition(
                    opacity: _contentAnimation,
                    child: widget.content,
                  ),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? animatedChild) {
              return Align(
                alignment: Alignment((_controller.value * 2.0) - 1.0, 0.0),
                child: animatedChild,
              );
            },
            child: GestureDetector(
              onHorizontalDragStart: _onDragStart,
              onHorizontalDragUpdate: _onDragUpdate,
              onHorizontalDragEnd: _onDragEnd,
              child: Container(
                key: _positionedKey,
                width: 143,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  color: bgColor,
                ),
                child: widget.thumb,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    final pos = _positioned.globalToLocal(details.globalPosition);
    _start = Offset(pos.dx, 0.0);
    _controller.stop(canceled: true);
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final pos = _container.globalToLocal(details.globalPosition) - _start;
    final extent = _container.size.width - _positioned.size.width;
    _controller.value = (pos.dx.clamp(0.0, extent) / extent);
  }

  void _onDragEnd(DragEndDetails details) {
    final extent = _container.size.width - _positioned.size.width;
    var fractionalVelocity = (details.primaryVelocity! / extent).abs();
    if (fractionalVelocity < 0.5) {
      fractionalVelocity = 0.5;
    }
    SwipePosition result;
    double acceleration, velocity;
    if (_controller.value > 0.5) {
      acceleration = 0.5;
      velocity = fractionalVelocity;
      result = SwipePosition.SwipeRight;
    } else {
      acceleration = -0.5;
      velocity = -fractionalVelocity;
      result = SwipePosition.SwipeLeft;
    }
    final simulation = _SwipeSimulation(
      acceleration,
      _controller.value,
      1.0,
      velocity,
    );
    _controller.animateWith(simulation).then((_) {
      widget.onChanged(result);
    });
  }
}

class _SwipeSimulation extends GravitySimulation {
  _SwipeSimulation(double acceleration, double distance, double endDistance, double velocity) : super(acceleration, distance, endDistance, velocity);

  @override
  double x(double time) => super.x(time).clamp(0.0, 1.0);

  @override
  bool isDone(double time) {
    final absValue = x(time).abs();
    return absValue <= 0.0 || absValue >= 1.0;
  }
}

class _SwipeButtonClipper extends CustomClipper<RRect> {
  const _SwipeButtonClipper({
    required this.animation,
    required this.borderRadius,
  }) : super(reclip: animation);

  final Animation<double> animation;
  final BorderRadius borderRadius;

  @override
  RRect getClip(Size size) {
    return borderRadius.toRRect(
      Rect.fromLTRB(
        size.width * animation.value,
        0.0,
        size.width,
        size.height,
      ),
    );
  }

  @override
  bool shouldReclip(_SwipeButtonClipper oldClipper) => true;
}

class AnimatedSlideUp extends StatefulWidget {
  const AnimatedSlideUp({Key? key}) : super(key: key);

  @override
  State<AnimatedSlideUp> createState() => _AnimatedSlideUpState();
}

class _AnimatedSlideUpState extends State<AnimatedSlideUp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _position;
  late Animation<double> _opacity;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _position = Tween<double>(begin: 0, end: 60).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0, 1)),
    )..addListener(() {
        setState(() {});
      });

    _opacity = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(.5, 1)),
    )..addListener(() {
        setState(() {});
      });
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 120),
          child: Row(
            children: List.generate(
              5,
              (index) => ImageIcon(
                const AssetImage(forward),
                color: Colors.white.withOpacity(_opacity.value),
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
