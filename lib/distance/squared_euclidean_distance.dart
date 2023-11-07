import 'dart:math';

import 'package:collection/collection.dart';
import 'package:k_means/distance/distance_calculator.dart';

class SquaredEuclideanDistance implements DistanceCalculator {
  @override
  num calculate(List<num> data1, List<num> data2) {
    if (data1.length != data2.length) {
      throw ArgumentError("Lengths are not equal.");
    }

    final distance = data1.mapIndexed((data1Index, data1Value) {
      final data2Value = data2[data1Index];
      return pow(data1Value - data2Value, 2);
    }).sum;

    return distance;
  }
}