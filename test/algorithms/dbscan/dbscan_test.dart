// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cluster_analysis/algorithms/dbscan/tools.dart';
import 'package:cluster_analysis/cluster_analysis.dart';
import 'package:cluster_analysis/algorithms/dbscan/model/dbscan_config.dart';
import 'package:cluster_analysis/data_processing/data_import.dart';
import 'package:test/test.dart';

void main() {
  test('iris data set assigned to 2 clusters', () async {
    //arrange
    final filePath = '${Directory.current.path}/test/file_resources/Iris.csv';
    final irisAbstractDataItems = await DataImport().importFromCsvFile(
        filePath: filePath, startColumnIndex: 1, endColumnIndex: 4);
    final irisDataItems = irisAbstractDataItems
        .map((abstractDataItem) => abstractDataItem.toDataItem())
        .toList();

    final dbscanConfig =
        DbscanConfig.squaredEuclidean(minPts: 3, eps: 2, data: irisDataItems);
    final dbscan = Dbscan(config: dbscanConfig);

    //act
    final clusters = dbscan.clusterize();

    //assert
    expect(clusters.length == 2, isTrue);
    for (var dataItem in irisDataItems) {
      expect(dataItem.clusterIndex, isNotNull);
      expect(dataItem.isNoise, isFalse);
    }
  });

  test('particular data items assigned to 2 clusters', () {
    //arrange
    var minPts = 2;
    var eps = 2.0;
    var data = List<DataItem>.of([
      DataItem(values: List.of([0, 0])),
      DataItem(values: List.of([0.5, 0.5])),
      DataItem(values: List.of([1, 1])),
      DataItem(values: List.of([5, 5])),
      DataItem(values: List.of([5.5, 5.5])),
      DataItem(values: List.of([6, 6])),
      DataItem(values: List.of([100, 5])),
      DataItem(values: List.of([11, 10])),
    ]);

    var config =
        DbscanConfig.squaredEuclidean(minPts: minPts, eps: eps, data: data);
    var dbscan = Dbscan(config: config);

    //act
    var clusters = dbscan.clusterize();

    //assert
    expect(clusters.length == 2, isTrue);

    expect(data[0].clusterIndex == 0, isTrue);
    expect(data[1].clusterIndex == 0, isTrue);
    expect(data[2].clusterIndex == 0, isTrue);

    expect(data[3].clusterIndex == 1, isTrue);
    expect(data[4].clusterIndex == 1, isTrue);
    expect(data[5].clusterIndex == 1, isTrue);

    expect(data[6].clusterIndex, isNull);
    expect(data[6].isNoise, isTrue);
    expect(data[7].clusterIndex, isNull);
    expect(data[7].isNoise, isTrue);
  });

  test('particular data items assigned to 1 cluster', () {
    //arrange
    var minPts = 5;
    var eps = 50.0;
    var data = List<DataItem>.of([
      DataItem(values: List.of([0, 0])),
      DataItem(values: List.of([0.5, 0.5])),
      DataItem(values: List.of([1, 1])),
      DataItem(values: List.of([5, 5])),
      DataItem(values: List.of([5.5, 5.5])),
      DataItem(values: List.of([6, 6])),
      DataItem(values: List.of([100, 5])),
      DataItem(values: List.of([11, 10])),
    ]);

    var config =
        DbscanConfig.squaredEuclidean(minPts: minPts, eps: eps, data: data);
    var dbscan = Dbscan(config: config);

    //act
    var clusters = dbscan.clusterize();

    //assert
    expect(clusters.length == 1, isTrue);

    expect(data[0].clusterIndex == 0, isTrue);
    expect(data[1].clusterIndex == 0, isTrue);
    expect(data[2].clusterIndex == 0, isTrue);
    expect(data[3].clusterIndex == 0, isTrue);
    expect(data[4].clusterIndex == 0, isTrue);
    expect(data[5].clusterIndex == 0, isTrue);

    expect(data[6].clusterIndex, isNull);
    expect(data[6].isNoise, isTrue);
    expect(data[7].clusterIndex, isNull);
    expect(data[7].isNoise, isTrue);
  });
}
