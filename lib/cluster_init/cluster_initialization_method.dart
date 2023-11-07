import 'package:k_means/model/cluster.dart';
import 'package:k_means/model/data_item.dart';

abstract interface class ClusterInitializationMethod {
  List<Cluster> initClusters(List<DataItem> data);
}
