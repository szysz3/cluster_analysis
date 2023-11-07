import 'package:equatable/equatable.dart';

class Cluster implements Equatable {
  final String label;
  final List<num> centroid;

  Cluster({required this.centroid, required this.label});

  @override
  List<Object?> get props => [label, centroid];

  @override
  bool? get stringify => false;

  Cluster copyWith({String? label, List<num>? centroid}) => Cluster(
        label: label ?? this.label,
        centroid: centroid ?? this.centroid,
      );
}
