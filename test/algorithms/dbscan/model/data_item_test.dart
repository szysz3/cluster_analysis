import 'package:cluster_analysis/algorithms/dbscan/model/data_item.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../tools/test_tools.dart';

void main() {
  test('data item initialized with given data', () {
    //arrange
    final values = generateValues(dimension: 3);
    const noise = false;
    const clusterIndex = 1;

    //act
    final dataItem =
        DataItem(values: values, isNoise: noise, clusterIndex: clusterIndex);

    //assert
    expect(dataItem.values, values);
    expect(dataItem.isNoise, noise);
    expect(dataItem.clusterIndex, clusterIndex);
  });

  test('data item initialized with required data', () {
    //arrange
    final values = generateValues(dimension: 3);

    //act
    final dataItem = DataItem(values: values);

    //assert
    expect(dataItem.values, values);
    expect(dataItem.isNoise, isNull);
    expect(dataItem.clusterIndex, isNull);
  });
}
