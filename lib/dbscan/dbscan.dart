import 'package:cluster_analysis/common/clustering_algorithm.dart';
import 'package:cluster_analysis/common/model/abstract_cluster.dart';
import 'package:cluster_analysis/dbscan/model/data_item.dart';
import 'package:cluster_analysis/dbscan/model/dbscan_config.dart';

/// DBSCAN (Density-Based Spatial Clustering of Application with Noise )
class Dbscan implements ClusteringAlgorithm {
  final DbscanConfig config;
  final List<AbstractCluster> _clusters = List.empty(growable: true);

  Dbscan({required this.config});

  @override
  List<AbstractCluster> clusterize() {
    var clusterIndex = 0;
    _clusters.add(AbstractCluster(label: clusterIndex.toString()));

    for (var dataItem in config.data) {
      if (dataItem.clusterIndex == null) {
        if (_extendCluster(dataItem: dataItem, cluserIndex: clusterIndex)) {
          clusterIndex++;
          _clusters.add(AbstractCluster(label: clusterIndex.toString()));
        }
      }
    }
    return _clusters;
  }

  bool _extendCluster({required DataItem dataItem, required int cluserIndex}) {
    List<DataItem> neighbours = _findNeighbours(dataItem: dataItem);
    if (neighbours.length < config.minPts) {
      // no enough neighbours, it means it is noise
      dataItem.clusterIndex = null;
      dataItem.isNoise = true;
      return false;
    } else {
      for (var neighbour in neighbours) {
        neighbour.clusterIndex = cluserIndex;
        neighbour.isNoise = false;

        var nextNeighbours = _findNeighbours(dataItem: neighbour);
        if (nextNeighbours.length >= config.minPts) {
          for (var nextNeighbour in nextNeighbours) {
            if (nextNeighbour.clusterIndex == null) {
              neighbours.add(nextNeighbour);
            }

            nextNeighbour.clusterIndex = cluserIndex;
            nextNeighbour.isNoise = false;
          }
        }
      }

      return true;
    }
  }

  List<DataItem> _findNeighbours({required DataItem dataItem}) {
    // TODO: implement
    return List.empty();
  }
}
