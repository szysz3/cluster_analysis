import 'dart:math';

import 'package:cluster_analysis/common/model/abstract_data_item.dart';
import 'package:cluster_analysis/algorithms/dbscan/model/data_item.dart';

var _rand = Random();

List<AbstractDataItem> generateAbstractDataItem(
    {required int count, required int dimension}) {
  return List.generate(count, (_) {
    return AbstractDataItem(values: generateValues(dimension: dimension));
  });
}

List<DataItem> generateDataItem({required int count, required int dimension}) {
  return List.generate(count, (_) {
    return DataItem(values: generateValues(dimension: dimension));
  });
}

List<double> generateValues({required int dimension}) {
  return List.generate(dimension, (_) => _rand.nextDouble());
}
