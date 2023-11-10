import 'package:flutter_test/flutter_test.dart';
import 'package:k_means/cluster_init/random_cluster_initialization_method.dart';

import '../test_tools.dart';

void main() {
  test('given cluster number initalized randomly ', () {
    //arrange
    final dataItems = generateDataItem(count: 10, dimension: 5);
    const clusterCount = 3;

    //act
    final initMethod = RandomClusterInitializationMethod();
    final clusters =
        initMethod.initClusters(data: dataItems, clusterCount: clusterCount);

    //assert
    expect(clusters.length == clusterCount, true);
    expect(
        clusters.map((cluster) => cluster.centroid).every((centroid) =>
            dataItems.map((dataItem) => dataItem.data).contains(centroid)),
        true);
  });
}
