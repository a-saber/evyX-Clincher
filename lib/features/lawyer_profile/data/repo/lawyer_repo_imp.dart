import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evyx_test/core/dio_helper/dio_helper.dart';
import 'package:evyx_test/core/dio_helper/end_points.dart';

import 'package:evyx_test/core/error_handler/error_handler.dart';
import 'package:evyx_test/core/localization/translation_key_manager.dart';

import 'package:evyx_test/features/lawyer_profile/data/model/get_lawyer_response_model.dart';

import 'lawyer_repo.dart';

class LawyerRepoImp implements LawyerRepo {
  @override
  Future<Either<Failure, GetLawyerResponseModel>> getLawyerData() async {
    try
    {
      var response = await DioHelper.getDate(endPoint: EndPoints.getLawyer);
      if (response.statusCode == 200)
      {
        print(response. toString());
        final lawyerData = GetLawyerResponseModel.fromJson(response.data);
        print(lawyerData.data!.name);
        return Right(lawyerData);
      }
      else
      {
        final failure = ServerFailure.fromResponse(response.statusCode, response.data);
        return Left(failure);
      }
    }
    on DioException catch (dioError) {
      final failure = ServerFailure.fromDioError(dioError);
      return Left(failure);
    }
    catch(e)
    {
      return Left(DataFailure(TranslationKeyManager.unknownErrorMessage));
    }
  }

}