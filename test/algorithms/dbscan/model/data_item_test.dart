import 'dart:io';

import 'package:cluster_analysis/algorithms/dbscan/model/dbscan_config.dart';
import 'package:cluster_analysis/algorithms/dbscan/tools.dart';
import 'package:cluster_analysis/cluster_analysis.dart';
import 'package:cluster_analysis/data_processing/data_import.dart';
import 'package:test/test.dart';

import '../../../tools/test_tools.dart';

void main() {
  test('data item initialized with given data', () {
    //arrange
    final values = generateValues(dimension: 3);
    const noise = false;
    const clusterIndex = 1;

    //act
    final dataItem =
        DataItem(values: values, isNoise: noise, clusterIndex: clusterIndex);

    //assert
    expect(dataItem.values, values);
    expect(dataItem.isNoise, noise);
    expect(dataItem.clusterIndex, clusterIndex);
  });

  test('data item initialized with required data', () {
    //arrange
    final values = generateValues(dimension: 3);

    //act
    final dataItem = DataItem(values: values);

    //assert
    expect(dataItem.values, values);
    expect(dataItem.isNoise, isNull);
    expect(dataItem.clusterIndex, isNull);
  });

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
}
