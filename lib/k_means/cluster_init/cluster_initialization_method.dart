import 'package:cluster_analysis/k_means/model/cluster.dart';
import 'package:cluster_analysis/common/model/data_item.dart';

abstract interface class ClusterInitializationMethod {
  List<Cluster> initClusters(
      {required List<AbstractDataItem> data, required int clusterCount});
}
