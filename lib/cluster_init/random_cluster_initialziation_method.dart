import 'package:k_means/model/cluster.dart';
import 'package:k_means/cluster_init/cluster_initialization_method.dart';
import 'package:k_means/model/data_item.dart';

class RandomClusterInitializationMethod implements ClusterInitializationMethod {
  @override
  List<Cluster> initClusters(List<DataItem> data) {
    throw UnimplementedError();
  }
}
