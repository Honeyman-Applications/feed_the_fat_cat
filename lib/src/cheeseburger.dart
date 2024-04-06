import 'package:flutter/material.dart';

/// Bradley Honeyman
/// April 5, 2024
/// This class is used to display the cheeseburger.
class Cheeseburger extends StatefulWidget {
  /// fraction of the smaller length of screen used to calculate cat sizes
  final int sizeFraction;

  /// numerator over the divisor for the sizeFraction
  final int cheeseburgerSizeFractionNumerator;

  const Cheeseburger({
    super.key,
    required this.sizeFraction,
    required this.cheeseburgerSizeFractionNumerator,
  });

  @override
  State<StatefulWidget> createState() => CheeseburgerState();
}

class CheeseburgerState extends State<Cheeseburger> {
  /// determines if width of height is the smaller size for the current screen.
  /// Then make the cheeseburger a fraction of the smaller length
  double _calculateSize({
    required BuildContext context,
  }) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // calc if not dead
    return width <= height
        ? width / widget.sizeFraction * widget.cheeseburgerSizeFractionNumerator
        : height /
            widget.sizeFraction *
            widget.cheeseburgerSizeFractionNumerator;
  }

  @override
  Widget build(BuildContext context) {
    // calc size
    double size = _calculateSize(
      context: context,
    );

    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Image.asset(
          "cats/cheeseburger.png",
        ),
      ),
    );
  }
}
