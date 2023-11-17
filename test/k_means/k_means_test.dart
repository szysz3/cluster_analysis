// ignore_for_file: avoid_print

import 'package:cluster_analysis/common/model/abstract_data_item.dart';
import 'package:cluster_analysis/k_means/k_means.dart';
import 'package:cluster_analysis/k_means/model/k_means_config.dart';
import 'package:flutter_test/flutter_test.dart';

import '../tools/test_tools.dart';

void main() {
  var maxIterationCount = 50;
  var clusterCount = 2;

  test('every data item assigned to cluster', () {
    //arrange
    var data = generateAbstractDataItem(count: 10, dimension: 5);

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
      expect(dataItem.clusterIndex != null, isTrue);
    }
  });

  test('data assigned to particular clusters', () {
    //arrange
    var data = [
      AbstractDataItem(values: [0, 0]),
      AbstractDataItem(values: [1, 1]),
      AbstractDataItem(values: [100, 100]),
      AbstractDataItem(values: [101, 101]),
    ];

    var config = KMeansConfig.squaredEuclidean(
        maxIterations: maxIterationCount,
        data: data,
        clusterCount: clusterCount);
    var kMeans = KMeans(config: config);

    //act
    var clusters = kMeans.clusterize();

    //assert
    expect(clusters.length, clusterCount);
    var itemsInCluster = [0, 0];

    for (var dataItem in data) {
      itemsInCluster[dataItem.clusterIndex!] += 1;
    }
    expect(itemsInCluster[0] == 2, isTrue);
    expect(itemsInCluster[1] == 2, isTrue);
  });
}
