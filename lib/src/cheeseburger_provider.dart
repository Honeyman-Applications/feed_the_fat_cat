import 'dart:async';

import 'package:flutter/material.dart';

/// Bradley Honeyman
/// April 5, 2024
/// This class is used to hold the count of cheeseburgers in the cat
class CheeseburgerProvider with ChangeNotifier {
  /// current count of cheeseburgers
  int _count = 0;

  /// fraction of the smaller length of screen used to calculate cat sizes
  int _sizeFraction = 0;

  /// timer used to decrement cheeseburger count
  late final Timer _timer;

  /// if true a cheeseburger can be seen
  bool cheeseburgerVisible = false;

  /// constructor init the timer and sets the initial cheeseburger count
  CheeseburgerProvider({
    required int count,
    required int interval,
    required int sizeFraction,
  }) {
    _count = count;
    _sizeFraction = sizeFraction;

    _timer = Timer.periodic(
        Duration(
          milliseconds: interval,
        ), (timer) {
      cheeseburgerVisible = false;
      decrementCheeseburgerCount();
      print(
        _count,
      );
    });
  }

  /// gets the fraction of the smaller length of screen used to calculate cat sizes
  int getSizeFraction() {
    return _sizeFraction;
  }

  /// returns the current number of cheeseburgers
  int getCheeseburgerCount() => _count;

  /// increments the cheeseburger count by 1
  void incrementCheeseburgerCount() {
    if (_count < _sizeFraction) {
      _count++;
      notifyListeners();
    }
  }

  /// decrements the cheeseburger count by 1
  void decrementCheeseburgerCount() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }

  /// ensure timer is canceled when provider is destroyed
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
