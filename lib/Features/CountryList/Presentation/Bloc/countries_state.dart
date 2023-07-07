part of 'countries_bloc.dart';

@immutable
abstract class CountriesState extends Equatable {
  const CountriesState();

  @override
  List<Object?> get props => [];
}

class CountriesInitial extends CountriesState {}

class CountryLoading extends CountriesState {}

class CountryLoaded extends CountriesState {
  final List<CountryModel> countryModelList;

  const CountryLoaded(this.countryModelList);
}

class CountryError extends CountriesState {
  final String? message;

  const CountryError(this.message);
}

class UpdateListState extends CountriesState {
  List<CountryModel> countryList;

  UpdateListState(this.countryList);
}
