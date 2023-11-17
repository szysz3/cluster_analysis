class AbstractDataItem {
  List<num> values;
  int? clusterIndex;

  AbstractDataItem({required this.values, this.clusterIndex});

  @override
  String toString() {
    return "[${values.join(',')}]";
  }
}
