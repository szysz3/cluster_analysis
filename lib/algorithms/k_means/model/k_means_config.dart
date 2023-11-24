import 'package:cluster_analysis/common/model/abstract_data_item.dart';
import 'package:cluster_analysis/common/similarity_measure/similarity_measure.dart';
import 'package:cluster_analysis/common/similarity_measure/squared_euclidean_distance.dart';
import 'package:cluster_analysis/algorithms/k_means/cluster_init/cluster_initialization_method.dart';
import 'package:cluster_analysis/algorithms/k_means/cluster_init/random_partition_method.dart';

class KMeansConfig {
  final int maxIterations;
  final List<AbstractDataItem> data;
  final int clusterCount;
  final SimilarityMeasure similarityMeasure;
  final ClusterInitializationMethod initMethod;

  KMeansConfig(
      {required this.maxIterations,
      required this.data,
      required this.clusterCount,
      required this.similarityMeasure,
      required this.initMethod});

  KMeansConfig.squaredEuclidean({
    required int maxIterations,
    required List<AbstractDataItem> data,
    required int clusterCount,
  }) : this(
            maxIterations: maxIterations,
            data: data,
            clusterCount: clusterCount,
            similarityMeasure: SquaredEuclideanDistance(),
            initMethod: RandomPartitionMethod());
}
