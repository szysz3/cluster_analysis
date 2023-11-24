import 'package:cluster_analysis/common/similarity_measure/squared_euclidean_distance.dart';
import 'package:cluster_analysis/algorithms/k_means/cluster_init/cluster_initialization_method.dart';
import 'package:cluster_analysis/algorithms/k_means/model/k_means_config.dart';
import 'package:test/test.dart';

import '../../../tools/mocks.dart';
import '../../../tools/test_tools.dart';

void main() {
  test('config initialized with given data', () {
    //arrange
    final data = generateAbstractDataItem(count: 3, dimension: 3);
    const maxIterations = 10;
    const clusterCount = 3;
    final similarityMeasure = MockSimilarityCalculator();
    final initMethod = MockClusterInitializationMethod();
    //act
    final config = KMeansConfig(
        maxIterations: maxIterations,
        data: data,
        clusterCount: clusterCount,
        similarityMeasure: similarityMeasure,
        initMethod: initMethod);

    //assert
    expect(config.maxIterations, maxIterations);
    expect(config.data, data);
    expect(config.clusterCount, clusterCount);
    expect(config.similarityMeasure, similarityMeasure);
    expect(config.initMethod, initMethod);
  });

  test('config initialized with default data', () {
    //arrange
    final data = generateAbstractDataItem(count: 3, dimension: 3);
    const maxIterations = 10;
    const clusterCount = 3;
    //act
    final config = KMeansConfig.squaredEuclidean(
        maxIterations: maxIterations, data: data, clusterCount: clusterCount);

    //assert
    expect(config.maxIterations, maxIterations);
    expect(config.data, data);
    expect(config.clusterCount, clusterCount);
    expect(config.similarityMeasure, isInstanceOf<SquaredEuclideanDistance>());
    expect(config.initMethod, isInstanceOf<ClusterInitializationMethod>());
  });
}
