import 'dart:io';

import 'package:cluster_analysis/common/model/abstract_data_item.dart';

class DataImport {
  Future<List<AbstractDataItem>> importFromCsvFile(
      {required String filePath,
      required int startColumnIndex,
      required int endColumnIndex}) async {
    try {
      var file = File(filePath);
      List<String> fileContentLines = await file.readAsLines();

      return fileContentLines
          // skip header line
          .skip(1)
          .map((line) {
        var values = line
            .split(',')
            .sublist(startColumnIndex, endColumnIndex + 1)
            .map((textValue) {
          return double.parse(textValue);
        }).toList();

        return AbstractDataItem(values: values);
      }).toList();
    } catch (e) {
      print('Reading file: $filePath failed');
      rethrow;
    }
  }
}
