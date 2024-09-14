import 'package:evyx_test/features/lawyer_profile/data/model/get_lawyer_response_model.dart';

class GetLawyerDataState {}

class GetLawyerDataInitial extends GetLawyerDataState {}

class GetLawyerDataLoading extends GetLawyerDataState {}
class GetLawyerDataSuccess extends GetLawyerDataState
{
  final GetLawyerResponseModel model;
  GetLawyerDataSuccess({required this.model});
}
class GetLawyerDataFailure extends GetLawyerDataState
{
  final String error;
  GetLawyerDataFailure({required this.error});
}
