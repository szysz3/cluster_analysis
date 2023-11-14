library k_means;

import 'package:collection/collection.dart';
import 'package:cluster_analysis/k_means/model/centroid_average.dart';
import 'package:cluster_analysis/k_means/model/cluster.dart';
import 'package:cluster_analysis/k_means/model/k_means_config.dart';

/// k-means clustering algorithm
class KMeans {
  final KMeansConfig config;

  late List<Cluster> _clusters;
  late int _dataDimension;
  late int _currentIterationCount;

  KMeans({required this.config});

  List<Cluster> clusterize() {
    _currentIterationCount = 0;
    _clusters = config.initMethod
        .initClusters(data: config.data, clusterCount: config.clusterCount);
    _dataDimension = _clusters.first.centroid.length;

    while (!_stopConditionReached()) {
      _assignDataToClusters();
      _recalculateCentroids();
      _currentIterationCount++;
    }
    return _clusters;
  }

  bool _stopConditionReached() {
    return config.maxIterations <= _currentIterationCount;
  }

  void _assignDataToClusters() {
    for (var dataItem in config.data) {
      var minDistance = double.maxFinite.toInt();
      _clusters.forEachIndexed((index, cluster) {
        var dataDistanceToClusterCentroid = config.similarityMeasure
            .calculate(data1: dataItem.values, data2: cluster.centroid);
        if (dataDistanceToClusterCentroid < minDistance) {
          dataItem.clusterIndex = index;
          minDistance = dataDistanceToClusterCentroid.toInt();
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
      // this happens once data is assigned to cluster
      // so we are sure clusterIndex is NOT null
      // hence we can use '!' operator safely
      var centroidAverage = centroidList[dataItem.clusterIndex!];
      dataItem.values.forEachIndexed((index, dataElement) {
        centroidAverage.sumOfDataItems[index] += dataElement;
      });

      centroidAverage.dataItemCount++;
    }

    centroidList.forEachIndexed((index, centroidAverage) {
      if (centroidAverage.dataItemCount == 0) {
        return;
      }

      var centroid = centroidAverage.sumOfDataItems.map((element) {
        return element / centroidAverage.dataItemCount;
      }).toList();
      _clusters[index].centroid = centroid;
    });
  }
}
