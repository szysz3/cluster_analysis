import 'dart:math';

import 'package:k_means/model/data_item.dart';

List<DataItem> generateDataItem({required int count, required int dimension}) {
  var rand = Random();
  return List.generate(count, (_) {
    return DataItem(data: List.generate(dimension, (_) => rand.nextInt(100)));
  });
}
