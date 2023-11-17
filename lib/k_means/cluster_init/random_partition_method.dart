import 'dart:math';

import 'package:cluster_analysis/common/model/data_item.dart';
import 'package:cluster_analysis/k_means/cluster_init/cluster_initialization_method.dart';
import 'package:cluster_analysis/k_means/model/cluster.dart';

class RandomPartitionMethod implements ClusterInitializationMethod {
  final _rand = Random();

  @override
  List<Cluster> initClusters(
      {required List<AbstractDataItem> data, required int clusterCount}) {
    final alreadyChosenIndexes = List<int>.empty(growable: true);
    return List.generate(clusterCount, (i) {
      return Cluster(
          centroid:
              data[_getRandomIndex(alreadyChosenIndexes, data.length)].values,
          label: i.toString());
    });
  }

  int _getRandomIndex(List<int> alreadyChosenIndexes, int maxIndex) {
    var index = _rand.nextInt(maxIndex);
    while (alreadyChosenIndexes.contains(index)) {
      index = _rand.nextInt(maxIndex);
    }

    alreadyChosenIndexes.add(index);
    return index;
  }
}
