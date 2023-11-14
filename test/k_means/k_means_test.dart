// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:cluster_analysis/k_means/k_means.dart';
import 'package:cluster_analysis/k_means/model/k_means_config.dart';

import 'tools/test_tools.dart';

void main() {
  var maxIterationCount = 10;
  var dataCount = 5;
  var clusterCount = 2;
  var dimensionCount = 2;
  var data = generateDataItem(count: dataCount, dimension: dimensionCount);

  test('data assigned to clusters', () {
    //arrange
    var config = KMeansConfig.squaredEuclidean(
        maxIterations: maxIterationCount,
        data: data,
        clusterCount: clusterCount);
    var kMeans = KMeans(config: config);

    //act
    var clusters = kMeans.clusterize();

    //assert
    expect(clusters.length, clusterCount);

    for (var dataItem in data) {
      expect(dataItem.clusterIndex != null, true);
      print('-> data: ${dataItem.values}, cluster:  ${dataItem.clusterIndex}');
    }

    print('clusters: ${clusters.join(' | ')}');
  });
}
