import 'dart:math';

import 'package:collection/collection.dart';
import 'package:cluster_analysis/common/similarity_measure/similarity_measure.dart';

class SquaredEuclideanDistance implements SimilarityMeasure {
  @override
  num calculate({required List<num> data1, required List<num> data2}) {
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
