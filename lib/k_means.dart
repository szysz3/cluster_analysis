library k_means;

import 'package:k_means/model/data_item.dart';

/// k-means clustering algorithm
class KMeans {
  final int maxIterations;
  final List<DataItem> data;
  final int clusterCount;

  KMeans(
      {required this.data,
      required this.maxIterations,
      required this.clusterCount});
}
