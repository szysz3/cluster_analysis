import 'package:cluster_analysis/common/model/abstract_data_item.dart';

class PrincipalComponentAnalysis {
  void calculate(List<AbstractDataItem> dataItems) {
    // TODO:
    // Input: matrix with data items
    // Output: reduced mantrix with data items
    //
    // 1. Calculate means for every row in matrix
    // 2. From every variable in row subtract mean of the whole row
    // 3. Calculate covariance matrix
    // 4. Calculate eigen vectors and values of covariance matrix
    // 5. Rearrange eigen vectors and eigen values
    // 6. Choose principal components
    // 7. Project data
  }
}
