abstract interface class SimilarityMeasure<T extends num> {
  T calculate({required List<T> data1, required List<T> data2});
}
