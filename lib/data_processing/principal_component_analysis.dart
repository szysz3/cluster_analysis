import 'package:cluster_analysis/common/model/abstract_data_item.dart';
import 'package:cluster_analysis/data_processing/tools.dart';
import 'package:cluster_analysis/data_processing/z_score_normalization.dart';
import 'package:collection/collection.dart';
import 'package:data/data.dart';

class PrincipalComponentAnalysis {
  void reduceDimensionality(List<AbstractDataItem> dataItems) {
    // 1. Standarize data with z-score
    final zScore = ZScoreNormalization();
    zScore.calculate(dataItems);

    // 2. Calculate covariance matrix
    final dataMatrix = dataItems.map((dataItem) {
      return dataItem.values;
    }).toList();
    final covarianceMatrix = calculateCovarianceMatrix(dataMatrix);

    // 3. Calculate eigen vectors and eigen values of covariance matrix
    final eigen =
        Matrix.fromRows(DataType.float64, covarianceMatrix).eigenvalue;
    final sortedEigenValues = eigen.realEigenvalues;
    sortedEigenValues.sort((b, a) => a.compareTo(b));

    final eigenVectors = List.generate(eigen.V.rowCount, (_) {
      return List.filled(eigen.V.colCount, 0.0);
    });
    eigen.V.forEach((row, col, value) {
      eigenVectors[col][row] = value;
    });
    final sortedEigenVectors = eigenVectors.reversed;

    // 4. Reduce with chosen principal components
    final transformed = multiplyMatricies(
        dataMatrix, transposeMatrix(sortedEigenVectors.toList()));
    final reduced = extractColumnsFromMatrix(transformed, List.of([0, 1]));

    dataItems.forEachIndexed((index, element) {
      element.values = reduced[index];
    });
  }
}
