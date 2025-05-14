import 'package:equatable/equatable.dart';
import '../model/service_model.dart';

abstract class ServiceState extends Equatable {
  const ServiceState();

  @override
  List<Object?> get props => [];
}

class ServiceInitial extends ServiceState {}

class ServiceLoading extends ServiceState {}

class ServiceLoadSuccess extends ServiceState {
  final List<ServiceModel> services;

  const ServiceLoadSuccess(this.services);

  @override
  List<Object> get props => [services];
}

class ServiceDetailLoaded extends ServiceState {
  final ServiceModel service;

  const ServiceDetailLoaded(this.service);

  @override
  List<Object> get props => [service];
}



class ServiceLoadFailure extends ServiceState {
  final String message;

  const ServiceLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
