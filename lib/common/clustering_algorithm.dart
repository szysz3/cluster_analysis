import 'package:cluster_analysis/common/model/abstract_cluster.dart';

abstract interface class ClusteringAlgorithm {
  List<AbstractCluster> clusterize();
}
