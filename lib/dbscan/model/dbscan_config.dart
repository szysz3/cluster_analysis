import 'package:cluster_analysis/common/similarity_measure/similarity_measure.dart';
import 'package:cluster_analysis/dbscan/model/data_item.dart';

class DbscanConfig {
  /// min. number of neighbours to determine whether point is considered
  /// to be a part of cluster
  final int minPts;

  /// neighbour searching radius
  final double eps;

  final List<DataItem> data;

  final SimilarityMeasure similarityMeasure;

  DbscanConfig(
      {required this.minPts,
      required this.eps,
      required this.data,
      required this.similarityMeasure});
}
