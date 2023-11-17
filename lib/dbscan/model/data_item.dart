import 'package:cluster_analysis/common/model/data_item.dart';

class DataItem extends AbstractDataItem {
  bool? isNoise;

  DataItem({required super.values, super.clusterIndex, this.isNoise});
}
