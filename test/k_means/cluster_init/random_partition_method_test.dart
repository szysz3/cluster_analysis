import 'package:cluster_analysis/k_means/cluster_init/random_partition_method.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../tools/test_tools.dart';

void main() {
  test('given cluster number initalized randomly', () {
    //arrange
    final dataItems = generateAbstractDataItem(count: 10, dimension: 5);
    const clusterCount = 3;

    //act
    final initMethod = RandomPartitionMethod();
    final clusters =
        initMethod.initClusters(data: dataItems, clusterCount: clusterCount);

    //assert
    expect(clusters.length == clusterCount, isTrue);
    expect(
        clusters.map((cluster) => cluster.centroid).every((centroid) =>
            dataItems.map((dataItem) => dataItem.values).contains(centroid)),
        isTrue);
  });

  test('initialized clusters are different', () {
    //arrange
    final dataItems = generateAbstractDataItem(count: 10, dimension: 5);
    const clusterCount = 5;

    //act
    final initMethod = RandomPartitionMethod();
    final clusters =
        initMethod.initClusters(data: dataItems, clusterCount: clusterCount);

    //assert
    expect(clusters.length == clusterCount, isTrue);
    expect(
        clusters.map((cluster) => cluster.centroid).toSet().toList().length ==
            clusterCount,
        isTrue);
  });
}
