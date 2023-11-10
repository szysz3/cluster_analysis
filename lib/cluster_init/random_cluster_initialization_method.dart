import 'dart:math';

import 'package:k_means/model/cluster.dart';
import 'package:k_means/cluster_init/cluster_initialization_method.dart';
import 'package:k_means/model/data_item.dart';

class RandomClusterInitializationMethod implements ClusterInitializationMethod {
  final _rand = Random();

  @override
  List<Cluster> initClusters(
      {required List<DataItem> data, required int clusterCount}) {
    return List.generate(clusterCount, (i) {
      return Cluster(
          centroid: data[_rand.nextInt(clusterCount)].data,
          label: i.toString());
    });
  }
}
