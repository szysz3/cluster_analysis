class DataItem {
  List<num> values;
  int? clusterIndex;

  DataItem({required this.values, this.clusterIndex});

  @override
  String toString() {
    return "[${values.join(',')}]";
  }
}
