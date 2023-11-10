import 'package:k_means/distance/distance_calculator.dart';
import 'package:k_means/distance/squared_euclidean_distance.dart';
import 'package:k_means/model/data_item.dart';

class KMeansConfig {
  final int maxIterations;
  final List<DataItem> data;
  final int clusterCount;
  final DistanceCalculator distanceMeasure;

  KMeansConfig(
      {required this.maxIterations,
      required this.data,
      required this.clusterCount,
      required this.distanceMeasure});

  KMeansConfig.squaredEuclidean({
    required int maxIterations,
    required List<DataItem> data,
    required int clusterCount,
  }) : this(
            maxIterations: maxIterations,
            data: data,
            clusterCount: clusterCount,
            distanceMeasure: SquaredEuclideanDistance());
}
