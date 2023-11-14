import 'package:cluster_analysis/k_means/model/cluster.dart';

abstract interface class ClusteringAlgorithm {
  List<Cluster> clusterize();
}
