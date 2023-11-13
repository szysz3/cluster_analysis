class Cluster {
  String label;
  List<num> centroid;

  Cluster({required this.centroid, required this.label});

  @override
  String toString() {
    return "[${centroid.join(',')}]";
  }
}
