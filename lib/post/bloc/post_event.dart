import 'package:equatable/equatable.dart';

sealed class PostEvent extends Equatable{

  @override
  List<Object> get props => [];
}

final class PostFetch extends PostEvent{}