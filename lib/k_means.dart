library k_means;

import 'package:collection/collection.dart';
import 'package:k_means/model/centroid_average.dart';
import 'package:k_means/model/cluster.dart';
import 'package:k_means/model/k_means_config.dart';

/// k-means clustering algorithm
class KMeans {
  final KMeansConfig config;

  late List<Cluster> _clusters;
  late int _dataDimension;
  late int _currentIterationCount;

  KMeans({required this.config});

  List<Cluster> clusterize() {
    _clusters = config.initMethod
        .initClusters(data: config.data, clusterCount: config.clusterCount);
    _dataDimension = _clusters.first.centroid.length;

    while (!_stopConditionReached()) {
      _assignDataToClusters();
      _recalculateCentroids();
    }

    return _clusters;
  }

  bool _stopConditionReached() {
    return config.maxIterations > _currentIterationCount;
  }

  void _assignDataToClusters() {
    for (var dataItem in config.data) {
      var minDistance = double.maxFinite.toInt();
      _clusters.forEachIndexed((index, cluster) {
        var dataDistanceToClusterCentroid = config.distanceMeasure
            .calculate(data1: dataItem.data, data2: cluster.centroid);
        if (dataDistanceToClusterCentroid < minDistance) {
          dataItem.clusterIndex = index;
        }
      });
    }
  }

  void _recalculateCentroids() {
    List<CentroidAverage> centroidList = List.generate(
        config.clusterCount,
        (index) => CentroidAverage(
            dataItemCount: 0,
            sumOfDataItems: List.generate(_dataDimension, (index) => 0)));

    for (var dataItem in config.data) {
      dataItem.data.forEachIndexed((index, dataElement) {
        var clusterIndex = dataItem.clusterIndex;
        if (clusterIndex != null) {
          var centroidAverage = centroidList[clusterIndex];
          centroidAverage.dataItemCount++;
          centroidAverage.sumOfDataItems[index] += dataElement;
        }
      });
    }

    centroidList.forEachIndexed((index, centroidAverage) {
      for (var element in centroidAverage.sumOfDataItems) {
        element / centroidAverage.dataItemCount;
      }

      _clusters[index].centroid = centroidAverage.sumOfDataItems;
    });
  }
}
