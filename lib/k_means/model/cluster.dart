import 'package:cluster_analysis/common/model/abstract_cluster.dart';

class Cluster extends AbstractCluster {
  List<num> centroid;

  Cluster({required this.centroid, required super.label});

  @override
  String toString() {
    return "[${centroid.join(',')}]";
  }
}
