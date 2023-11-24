import 'package:cluster_analysis/cluster_analysis.dart';
import 'package:cluster_analysis/common/model/abstract_data_item.dart';

extension DataItemExtension on AbstractDataItem {
  DataItem toDataItem() {
    return DataItem(values: values);
  }
}
