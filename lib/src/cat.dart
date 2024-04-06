import 'package:feed_the_fat_cat/src/cheeseburger_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_platform/universal_platform.dart';

/// Bradley Honeyman
/// April 5, 2024
/// This class is used to display the cat.
class Cat extends StatefulWidget {
  /// fraction of the smaller length of screen used to calculate cat sizes
  final int sizeFraction;

  /// number of cheeseburgers
  final int cheeseburgerCount;

  const Cat({
    super.key,
    required this.sizeFraction,
    required this.cheeseburgerCount,
  });

  @override
  State<StatefulWidget> createState() => CatState();
}

class CatState extends State<Cat> {
  /// determines if width of height is the smaller size for the current screen.
  /// Then make the cat a fraction of the smaller length * the number of cheeseburgers
  double _calculateSize({
    required BuildContext context,
  }) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // check if dead
    if (widget.cheeseburgerCount < 1) {
      return width <= height
          ? width /
              widget.sizeFraction *
              (context.read<CheeseburgerProvider>().getSizeFraction() / 2)
          : height /
              widget.sizeFraction *
              (context.read<CheeseburgerProvider>().getSizeFraction() / 2);
    }

    // calc if not dead
    return width <= height
        ? width / widget.sizeFraction * widget.cheeseburgerCount
        : height / widget.sizeFraction * widget.cheeseburgerCount;
  }

  @override
  Widget build(BuildContext context) {
    // calc size
    double size = _calculateSize(
      context: context,
    );

    String prefix = UniversalPlatform.isAndroid ? "assets/" : "";

    return Center(
      child: widget.cheeseburgerCount > 0
          ? SizedBox(
              width: size,
              height: size,
              child: Image.asset(
                "${prefix}cats/cat1.png",
              ),
            )
          : SizedBox(
              width: size,
              height: size,
              child: Image.asset(
                "${prefix}cats/dead.png",
              ),
            ),
    );
  }
}
