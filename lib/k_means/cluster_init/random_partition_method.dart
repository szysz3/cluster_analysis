import 'dart:math';

import 'package:cluster_analysis/k_means/model/cluster.dart';
import 'package:cluster_analysis/k_means/cluster_init/cluster_initialization_method.dart';
import 'package:cluster_analysis/common/model/data_item.dart';

class RandomPartitionMethod implements ClusterInitializationMethod {
  final _rand = Random();

  @override
  List<Cluster> initClusters(
      {required List<DataItem> data, required int clusterCount}) {
    return List.generate(clusterCount, (i) {
      return Cluster(
          centroid: data[_rand.nextInt(clusterCount)].values,
          label: i.toString());
    });
  }
}
