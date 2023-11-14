import 'package:cluster_analysis/k_means/cluster_init/cluster_initialization_method.dart';
import 'package:cluster_analysis/k_means/cluster_init/random_cluster_initialization_method.dart';
import 'package:cluster_analysis/k_means/distance/distance_calculator.dart';
import 'package:cluster_analysis/k_means/distance/squared_euclidean_distance.dart';
import 'package:cluster_analysis/common/model/data_item.dart';

class KMeansConfig {
  final int maxIterations;
  final List<DataItem> data;
  final int clusterCount;
  final DistanceCalculator distanceMeasure;
  final ClusterInitializationMethod initMethod;

  KMeansConfig(
      {required this.maxIterations,
      required this.data,
      required this.clusterCount,
      required this.distanceMeasure,
      required this.initMethod});

  KMeansConfig.squaredEuclidean({
    required int maxIterations,
    required List<DataItem> data,
    required int clusterCount,
  }) : this(
            maxIterations: maxIterations,
            data: data,
            clusterCount: clusterCount,
            distanceMeasure: SquaredEuclideanDistance(),
            initMethod: RandomClusterInitializationMethod());
}
