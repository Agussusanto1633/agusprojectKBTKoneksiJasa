import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_event.dart';
import 'service_state.dart';
import '../repositories/service_repository.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final ServiceRepository _serviceRepository;

  ServiceBloc({required ServiceRepository serviceRepository})
      : _serviceRepository = serviceRepository,
        super(ServiceInitial()) {
    on<LoadServices>(_onLoadServices);
    on<LoadServiceDetail>(_onLoadServiceDetail);
    on<LoadPromoServices>(_onLoadPromoServices);
  }

  Future<void> _onLoadServices(
      LoadServices event,
      Emitter<ServiceState> emit,
      ) async {
    emit(ServiceLoading());
    try {
      final services = await _serviceRepository.getServices();
      emit(ServiceLoadSuccess(services));
    } catch (e) {
      emit(ServiceLoadFailure(e.toString()));
    }
  }

  Future<void> _onLoadServiceDetail(
      LoadServiceDetail event,
      Emitter<ServiceState> emit,
      ) async {
    emit(ServiceLoading());
    try {
      final service = await _serviceRepository.getServiceById(event.serviceId);
      if (service != null) {
        emit(ServiceDetailLoaded(service));
      } else {
        emit(const ServiceLoadFailure('Service not found'));
      }
    } catch (e) {
      emit(ServiceLoadFailure(e.toString()));
    }
  }

  Future<void> _onLoadPromoServices(
      LoadPromoServices event,
      Emitter<ServiceState> emit,
      ) async {
    emit(ServiceLoading());
    try {
      final services = await _serviceRepository.getPromoServices();
      emit(ServicePromoLoaded(services));
    } catch (e) {
      emit(ServiceLoadFailure(e.toString()));
    }
  }
}