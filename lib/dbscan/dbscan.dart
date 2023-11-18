import 'package:cluster_analysis/common/clustering_algorithm.dart';
import 'package:cluster_analysis/common/model/abstract_cluster.dart';
import 'package:cluster_analysis/dbscan/model/data_item.dart';
import 'package:cluster_analysis/dbscan/model/dbscan_config.dart';

/// DBSCAN (Density-Based Spatial Clustering of Application with Noise )
class Dbscan implements ClusteringAlgorithm {
  final DbscanConfig config;
  final List<AbstractCluster> _clusters = List.empty(growable: true);
  var _clusterIndex = 0;

  Dbscan({required this.config});

  @override
  List<AbstractCluster> clusterize() {
    _clusterIndex = 0;

    for (var dataItem in config.data) {
      if (dataItem.clusterIndex == null) {
        if (_extendCluster(dataItem: dataItem)) {}
      }
    }
    return _clusters;
  }

  bool _extendCluster({required DataItem dataItem}) {
    List<DataItem> neighbours = _findNeighbours(dataItem: dataItem);
    if (neighbours.length < config.minPts) {
      // no enough neighbours, it means it is noise
      dataItem.clusterIndex = null;
      dataItem.isNoise = true;
      return false;
    } else {
      _clusters.add(AbstractCluster(label: _clusterIndex.toString()));

      for (var i = 0; i < neighbours.length; i++) {
        var neighbour = neighbours[i];
        neighbour.clusterIndex = _clusterIndex;
        neighbour.isNoise = false;

        var nextNeighbours = _findNeighbours(dataItem: neighbour);
        if (nextNeighbours.length >= config.minPts) {
          for (var nextNeighbour in nextNeighbours) {
            if (nextNeighbour.clusterIndex == null) {
              neighbours.add(nextNeighbour);
            }

            nextNeighbour.clusterIndex = _clusterIndex;
            nextNeighbour.isNoise = false;
          }
        }
      }

      _clusterIndex++;
      return true;
    }
  }

  /// Naive approach - calculate distance to each element
  List<DataItem> _findNeighbours({required DataItem dataItem}) {
    var neighbourList = List<DataItem>.empty(growable: true);
    for (var neighbour in config.data) {
      var similarity = config.similarityMeasure
          .calculate(data1: neighbour.values, data2: dataItem.values);
      if (similarity <= config.eps && similarity > 0) {
        neighbourList.add(neighbour);
      }
    }

    return neighbourList;
  }
}
