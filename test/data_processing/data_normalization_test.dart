import 'package:cluster_analysis/common/model/abstract_data_item.dart';
import 'package:cluster_analysis/data_processing/data_normalization.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('normalize data with z-score', () async {
    //arrange
    var data = List<AbstractDataItem>.of([
      AbstractDataItem(values: List.of([1, 1])),
      AbstractDataItem(values: List.of([3, 3])),
      AbstractDataItem(values: List.of([10, 55])),
    ]);
    var dataNormalization = DataNormalization();
    var expectedNormalizedData = List<AbstractDataItem>.of([
      AbstractDataItem(
          values: List.of([-0.9502552681394961, -0.746733045887731])),
      AbstractDataItem(
          values: List.of([-0.4319342127906801, -0.6667259338283312])),
      AbstractDataItem(values: List.of([1.382189480930176, 1.413458979716062])),
    ]);

    //act
    dataNormalization.normalizeWithZScore(data);

    //assert
    expect(data[0].values[0] == expectedNormalizedData[0].values[0], isTrue);
    expect(data[0].values[1] == expectedNormalizedData[0].values[1], isTrue);

    expect(data[1].values[0] == expectedNormalizedData[1].values[0], isTrue);
    expect(data[1].values[1] == expectedNormalizedData[1].values[1], isTrue);

    expect(data[2].values[0] == expectedNormalizedData[2].values[0], isTrue);
    expect(data[2].values[1] == expectedNormalizedData[2].values[1], isTrue);
  });
}
