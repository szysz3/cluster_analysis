import 'dart:math';

import 'package:cluster_analysis/common/model/abstract_data_item.dart';

class DataNormalization {
  void normalizeWithZScore(List<AbstractDataItem> dataItems) {
    var dimensions = dataItems.first.values.length;
    var averageValuesList = _calculateAverageValues(dataItems, dimensions);
    var standardDeviationList =
        _calculateStandardDeviation(dataItems, averageValuesList, dimensions);

    for (var axis = 0; axis < dimensions; axis++) {
      for (var i = 0; i < dataItems.length; i++) {
        var value = dataItems[i].values[axis];
        var zScore =
            (value - averageValuesList[axis]) / standardDeviationList[axis];
        dataItems[i].values[axis] = zScore;
      }
    }
  }

  List<double> _calculateAverageValues(
      List<AbstractDataItem> dataItems, int dimensions) {
    List<double> averageValuesList = List.empty(growable: true);
    for (var axis = 0; axis < dimensions; axis++) {
      var sum = 0.0;
      for (var dataItem in dataItems) {
        sum += dataItem.values[axis];
      }

      averageValuesList.add(sum / dataItems.length);
    }

    return averageValuesList;
  }

  List<double> _calculateStandardDeviation(List<AbstractDataItem> dataItems,
      List<double> averageValuesList, int dimensions) {
    var squaredSumOfValuesMinusAverageList = List.empty(growable: true);
    for (var axis = 0; axis < dimensions; axis++) {
      var sumOfValuesMinusAverage = 0.0;
      for (var dataItem in dataItems) {
        var value = dataItem.values[axis];
        sumOfValuesMinusAverage += pow(value - averageValuesList[axis], 2.0);
      }

      squaredSumOfValuesMinusAverageList.add(sumOfValuesMinusAverage);
    }

    List<double> standardDeviationList = List.empty(growable: true);
    for (var axis = 0; axis < dimensions; axis++) {
      var standardDeviation =
          sqrt(squaredSumOfValuesMinusAverageList[axis] / dataItems.length);
      standardDeviationList.add(standardDeviation);
    }

    return standardDeviationList;
  }
}
