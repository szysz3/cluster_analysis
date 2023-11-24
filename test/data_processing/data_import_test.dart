import 'dart:io';

import 'package:cluster_analysis/data_processing/data_import.dart';
import 'package:test/test.dart';

void main() {
  test('read data from csv file', () async {
    //arrange
    var filePath = '${Directory.current.path}/test/file_resources/Iris.csv';
    var dataImport = DataImport();

    //act
    var dataItems = await dataImport.importFromCsvFile(
        filePath: filePath, startColumnIndex: 1, endColumnIndex: 4);

    //assert
    expect(dataItems.length == 150, isTrue);
    for (var dataItem in dataItems) {
      expect(dataItem.values.isNotEmpty, isTrue);
    }
  });
}
