part of 'bron_bloc.dart';

@immutable
sealed class BronState {}

final class BronInitial extends BronState {}

class BronLoadInf extends BronState {
  BronLoadInf({
    required this.data,
  });
  final BronModel data;
}

class BronLoading extends BronState {}

class HomeScreenLoadingFailed extends BronState {}
