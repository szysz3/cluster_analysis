import 'dart:io';

import 'package:cluster_analysis/data_processing/data_import.dart';
import 'package:cluster_analysis/data_processing/principal_component_analysis.dart';
import 'package:collection/collection.dart';
import 'package:test/test.dart';

void main() {
  test('reduce iris data set dimensionality', () async {
    //arrange
    var filePath = '${Directory.current.path}/test/file_resources/Iris.csv';
    var reducedFilePath =
        '${Directory.current.path}/test/file_resources/Iris_reduced.txt';
    var dataImport = DataImport();

    var dataItems = await dataImport.importFromCsvFile(
        filePath: filePath, startColumnIndex: 1, endColumnIndex: 4);

    var expectedDataItems = await dataImport.importFromCsvFile(
        filePath: reducedFilePath, startColumnIndex: 0, endColumnIndex: 1);

    // act
    var pca = PrincipalComponentAnalysis();
    pca.reduceDimensionality(dataItems);

    // assert
    dataItems.forEachIndexed((dataItemIndex, dataItem) {
      dataItem.values.forEachIndexed((valueIndex, value) {
        expect(
            value.toStringAsPrecision(5),
            expectedDataItems[dataItemIndex]
                .values[valueIndex]
                .toStringAsPrecision(5));
      });
    });
  });
}
