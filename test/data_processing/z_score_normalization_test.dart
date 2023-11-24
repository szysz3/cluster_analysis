import 'package:cluster_analysis/common/model/abstract_data_item.dart';
import 'package:cluster_analysis/data_processing/z_score_normalization.dart';
import 'package:test/test.dart';

void main() {
  test('standarize data with z-score', () async {
    //arrange
    var data = List<AbstractDataItem>.of([
      AbstractDataItem(values: List.of([1, 1])),
      AbstractDataItem(values: List.of([3, 3])),
      AbstractDataItem(values: List.of([10, 55])),
    ]);
    var zScore = ZScoreNormalization();
    var expectedData = List<AbstractDataItem>.of([
      AbstractDataItem(
          values: List.of([-0.9502552681394961, -0.746733045887731])),
      AbstractDataItem(
          values: List.of([-0.4319342127906801, -0.6667259338283312])),
      AbstractDataItem(values: List.of([1.382189480930176, 1.413458979716062])),
    ]);

    //act
    zScore.calculate(data);

    //assert
    expect(data[0].values[0] == expectedData[0].values[0], isTrue);
    expect(data[0].values[1] == expectedData[0].values[1], isTrue);

    expect(data[1].values[0] == expectedData[1].values[0], isTrue);
    expect(data[1].values[1] == expectedData[1].values[1], isTrue);

    expect(data[2].values[0] == expectedData[2].values[0], isTrue);
    expect(data[2].values[1] == expectedData[2].values[1], isTrue);
  });
}
