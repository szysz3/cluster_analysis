import 'package:equatable/equatable.dart';

class DataItem implements Equatable {
  final List<num> data;
  final int? clusterIndex;

  DataItem({required this.data, this.clusterIndex});

  @override
  List<Object?> get props => [data, clusterIndex];

  @override
  bool? get stringify => false;

  DataItem copyWith({List<num>? data, int? clusterIndex}) => DataItem(
        data: data ?? this.data,
        clusterIndex: clusterIndex ?? this.clusterIndex,
      );
}
