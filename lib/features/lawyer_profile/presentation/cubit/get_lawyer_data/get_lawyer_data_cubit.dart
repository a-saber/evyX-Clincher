import 'package:evyx_test/features/lawyer_profile/data/repo/lawyer_repo_imp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_lawyer_data_state.dart';

class GetLawyerDataCubit extends Cubit<GetLawyerDataState> {
  final LawyerRepoImp lawyerRepoImp;
  static GetLawyerDataCubit get(context) => BlocProvider.of(context);
  GetLawyerDataCubit(this.lawyerRepoImp) : super(GetLawyerDataInitial());

  void getLawyerData() async
  {
    emit(GetLawyerDataLoading());
    var response = await lawyerRepoImp.getLawyerData();
    response.fold(
      (l) => emit(GetLawyerDataFailure(error: l.errorMessage)),
      (r) => emit(GetLawyerDataSuccess(model: r))
    );
  }
}
