import 'package:cluster_analysis/common/model/abstract_data_item.dart';
import 'package:cluster_analysis/data_processing/tools.dart';
import 'package:data/data.dart';

class PrincipalComponentAnalysis {
  void calculate(List<AbstractDataItem> dataItems) {
    // Input: matrix with data items
    // Output: reduced mantrix with data items

    // 1. Calculate means for every row in matrix
    var meanValuesList = List.empty(growable: true);
    for (var dataRow in dataItems) {
      meanValuesList.add(calculateMeanValue(dataRow.values));
    }

    // 2. From every variable in row subtract mean of the whole row
    for (var i = 0; i < dataItems.length; i++) {
      for (var j = 0; j < dataItems[i].values.length; j++) {
        dataItems[i].values[j] /= meanValuesList[j];
      }
    }

    // 3. Calculate covariance matrix
    final dataMatrix = dataItems.map((dataItem) {
      return dataItem.values;
    }).toList();
    final covarianceMatrix = calculateCovarianceMatrix(dataMatrix);

    for (var row in covarianceMatrix) {
      print('covariance row: ${row.join(',')}');
    }

    // 4. Calculate eigen vectors and values of covariance matrix
    final eigen =
        Matrix.fromRows(DataType.float64, covarianceMatrix).eigenvalue;
    final eigenValues = eigen.realEigenvalues;
    final eigenVectors = List.generate(eigen.V.rowCount, (_) {
      return List.filled(eigen.V.colCount, 0.0);
    });
    eigen.V.forEach((row, col, value) {
      eigenVectors[row][col] = value;
    });

    print('eigen vals: ${eigenValues.join(',')}');
    for (var vec in eigenVectors) {
      print('eigen vecs: ${vec.join(',')}');
    }

    // 5. Rearrange eigen vectors and eigen values
    // 6. Choose principal components
    // 7. Project data
  }
}
