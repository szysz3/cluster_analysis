import 'dart:math';

import 'package:cluster_analysis/common/model/data_item.dart';

List<DataItem> generateDataItem({required int count, required int dimension}) {
  var rand = Random();
  return List.generate(count, (_) {
    return DataItem(values: List.generate(dimension, (_) => rand.nextInt(100)));
  });
}
