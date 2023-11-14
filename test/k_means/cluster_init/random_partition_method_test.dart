import 'package:flutter_test/flutter_test.dart';
import 'package:cluster_analysis/k_means/cluster_init/random_partition_method.dart';

import '../tools/test_tools.dart';

void main() {
  test('given cluster number initalized randomly ', () {
    //arrange
    final dataItems = generateDataItem(count: 10, dimension: 5);
    const clusterCount = 3;

    //act
    final initMethod = RandomPartitionMethod();
    final clusters =
        initMethod.initClusters(data: dataItems, clusterCount: clusterCount);

    //assert
    expect(clusters.length == clusterCount, true);
    expect(
        clusters.map((cluster) => cluster.centroid).every((centroid) =>
            dataItems.map((dataItem) => dataItem.values).contains(centroid)),
        true);
  });
}
