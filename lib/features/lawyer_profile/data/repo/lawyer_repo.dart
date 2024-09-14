import 'package:dartz/dartz.dart';
import 'package:evyx_test/core/error_handler/error_handler.dart';
import 'package:evyx_test/features/lawyer_profile/data/model/get_lawyer_response_model.dart';

abstract class LawyerRepo {
  Future<Either<Failure, GetLawyerResponseModel>> getLawyerData();
}