import 'package:flutter_test/flutter_test.dart';
import 'package:k_means/distance/squared_euclidean_distance.dart';
import 'package:k_means/model/k_means_config.dart';

import '../mocks.dart';
import '../test_tools.dart';

void main() {
  test('config initialized with given data', () {
    //arrange
    final data = generateDataItem(count: 3, dimension: 3);
    const maxIterations = 10;
    const clusterCount = 3;
    final distanceMeasure = MockDistanceCalculator();
    //act
    final config = KMeansConfig(
        maxIterations: maxIterations,
        data: data,
        clusterCount: clusterCount,
        distanceMeasure: distanceMeasure);

    //assert
    expect(config.maxIterations, maxIterations);
    expect(config.data, data);
    expect(config.clusterCount, clusterCount);
    expect(config.distanceMeasure, distanceMeasure);
  });

  test('config initialized with default data', () {
    //arrange
    final data = generateDataItem(count: 3, dimension: 3);
    const maxIterations = 10;
    const clusterCount = 3;
    //act
    final config = KMeansConfig.squaredEuclidean(
        maxIterations: maxIterations, data: data, clusterCount: clusterCount);

    //assert
    expect(config.maxIterations, maxIterations);
    expect(config.data, data);
    expect(config.clusterCount, clusterCount);
    expect(config.distanceMeasure, isInstanceOf<SquaredEuclideanDistance>());
  });
}
