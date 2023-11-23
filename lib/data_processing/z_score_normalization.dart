import 'dart:math';

import 'package:cluster_analysis/common/model/abstract_data_item.dart';

class ZScoreNormalization {
  void calculate(List<AbstractDataItem> dataItems) {
    var dimensions = dataItems.first.values.length;
    var meanValuesList = _calculateMeanValues(dataItems, dimensions);
    var standardDeviationList =
        _calculateStandardDeviation(dataItems, meanValuesList, dimensions);

    for (var axis = 0; axis < dimensions; axis++) {
      for (var i = 0; i < dataItems.length; i++) {
        var value = dataItems[i].values[axis];
        var zScore =
            (value - meanValuesList[axis]) / standardDeviationList[axis];
        dataItems[i].values[axis] = zScore;
      }
    }
  }

  List<double> _calculateMeanValues(
      List<AbstractDataItem> dataItems, int dimensions) {
    List<double> meanValuesList = List.empty(growable: true);
    for (var axis = 0; axis < dimensions; axis++) {
      var sum = 0.0;
      for (var dataItem in dataItems) {
        sum += dataItem.values[axis];
      }

      meanValuesList.add(sum / dataItems.length);
    }

    return meanValuesList;
  }

  List<double> _calculateStandardDeviation(List<AbstractDataItem> dataItems,
      List<double> meanValuesList, int dimensions) {
    var squaredSumOfValuesMinusMeanList = List.empty(growable: true);
    for (var axis = 0; axis < dimensions; axis++) {
      var sumOfValuesMinusMean = 0.0;
      for (var dataItem in dataItems) {
        var value = dataItem.values[axis];
        sumOfValuesMinusMean += pow(value - meanValuesList[axis], 2.0);
      }

      squaredSumOfValuesMinusMeanList.add(sumOfValuesMinusMean);
    }

    List<double> standardDeviationList = List.empty(growable: true);
    for (var axis = 0; axis < dimensions; axis++) {
      var standardDeviation =
          sqrt(squaredSumOfValuesMinusMeanList[axis] / dataItems.length);
      standardDeviationList.add(standardDeviation);
    }

    return standardDeviationList;
  }
}
