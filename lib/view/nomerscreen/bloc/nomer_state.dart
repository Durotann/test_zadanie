part of 'nomer_bloc.dart';

@immutable
sealed class NomerState {}

final class NomerInitial extends NomerState {}

final class NomerScreen extends NomerState {}

class NomerScreenLoadInf extends NomerState {
  NomerScreenLoadInf({
    required this.data1,
  });
  final List<RoomModel> data1;
}

class NomerScreenLoading extends NomerState {}

class NomerScreenLoadingFailed extends NomerState {}
