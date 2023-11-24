import 'package:cluster_analysis/algorithms/dbscan/model/dbscan_config.dart';
import 'package:test/test.dart';

import '../../../tools/mocks.dart';
import '../../../tools/test_tools.dart';

void main() {
  test('config initialized with given data', () {
    //arrange
    final data = generateDataItem(count: 3, dimension: 3);
    const minPts = 2;
    const eps = 1.0;
    final similarityMeasure = MockSimilarityCalculator();

    //act
    final config = DbscanConfig(
        minPts: minPts,
        data: data,
        eps: eps,
        similarityMeasure: similarityMeasure);

    //assert
    expect(config.minPts, minPts);
    expect(config.data, data);
    expect(config.eps, eps);
    expect(config.similarityMeasure, similarityMeasure);
  });
}
