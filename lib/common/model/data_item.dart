class DataItem {
  List<num> data;
  int? clusterIndex;

  DataItem({required this.data, this.clusterIndex});

  @override
  String toString() {
    return "[${data.join(',')}]";
  }
}
