import 'package:cached_network_image/cached_network_image.dart';
import 'package:evyx_test/core/resources_manager/assets_manager.dart';
import 'package:evyx_test/core/resources_manager/color_manager.dart';
import 'package:evyx_test/core/resources_manager/style_manager.dart';
import 'package:evyx_test/features/lawyer_profile/data/model/get_lawyer_response_model.dart';
import 'package:evyx_test/features/lawyer_profile/presentation/cubit/get_lawyer_data/get_lawyer_data_cubit.dart';
import 'package:evyx_test/features/lawyer_profile/presentation/cubit/get_lawyer_data/get_lawyer_data_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LawyerProfileView extends StatelessWidget {
  const LawyerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> icons =
    [
      AssetsManager.case1,
      AssetsManager.call,
      AssetsManager.messages,
      AssetsManager.chatQ,
    ];
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: ColorsManager.white,
        title: Text('المحامين'),
        leadingWidth: 38.82,
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 15.0),
          child: SvgPicture.asset(
            AssetsManager.drawerIcon,
            ),
        ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.5),
            child: Container(
              decoration: BoxDecoration(
                color: ColorsManager.blackOpacity10,
              ),
              height: 1.5, // Height of the shadow line
            ),
          ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: BlocConsumer<GetLawyerDataCubit, GetLawyerDataState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if(state is GetLawyerDataSuccess && state.model.data != null)
              {
                var lawyer = state.model;
                return Column(
                  children:
                  [
                    const SizedBox(height: 24.0,),
                    CustomFrame(
                        child: CachedNetworkImage(
                            height: MediaQuery.of(context).size.height*0.45,
                            errorWidget: (context, url, error) => Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.error),
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(error.toString()),
                                  ),
                                ],
                              ),
                            ),
                            errorListener: (obj)
                            {
                              print('errorListener ${obj.toString()}');
                              // can hide the whole img
                            },
                            imageUrl: 'https://firebasestorage.googleapis.com/v0/b/callson-cc7f9.appspot.com/o/users%2F14766.jpg?alt=media&token=a8ad3673-d98e-4dc5-9cd5-8946eb74b5cf'
                        )
                    ),
                    CustomFrame(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            children:
                            [
                              const SizedBox(height: 50.0,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      lawyer.data!.name??'',
                                      style: StyleManager.bold.copyWith(
                                          fontSize: 30,
                                          height: 1
                                      )
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(end: 10.0),
                                    child: SizedBox(
                                      width: 23.0, height: 23.0,
                                      child: Image.asset(
                                        AssetsManager.crown,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const CustomDivider(),
                              const SizedBox(height: 14.0,),
                              Row(
                                children:
                                [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(AssetsManager.star),
                                      const SizedBox(width: 5,),
                                      Text(
                                        '${lawyer.data!.rating??0.0}',
                                        style: StyleManager.extraBold.copyWith(
                                            fontSize: 18.0,
                                            color: ColorsManager.blackOpacity42,
                                            height: 1.2
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(end: 10.0),
                                    child: ActivityChartNo(count: lawyer.data!.questionNo??0,),
                                  ),


                                ],
                              ),
                              const SizedBox(height: 14.0,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                [
                                  SvgPicture.asset(AssetsManager.userCase),
                                  const SizedBox(width: 5,),
                                  Text(
                                    'العمل والتوظيف',
                                    style: StyleManager.bold.copyWith(
                                        fontSize: 18.0,
                                        color: ColorsManager.blackOpacity42
                                    ),
                                  ),
                                  const SizedBox(width: 5,),
                                  SvgPicture.asset(AssetsManager.case1),
                                  const SizedBox(width: 5,),
                                  Expanded(
                                    child: Text(
                                      lawyer.data!.jobTitle??'',
                                      style: StyleManager.bold.copyWith(
                                          fontSize: 18.0,
                                          color: ColorsManager.blackOpacity42
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              const SizedBox(height: 10.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:
                                [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(AssetsManager.global),
                                      const SizedBox(width: 5,),
                                      Text(
                                        lawyer.data!.lang??'',
                                        style: StyleManager.bold.copyWith(
                                            fontSize: 18.0,
                                            color: ColorsManager.blackOpacity42
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(AssetsManager.location),
                                      const SizedBox(width: 5,),
                                      Text(
                                        lawyer.data!.country??'',
                                        style: StyleManager.bold.copyWith(
                                            fontSize: 18.0,
                                            color: ColorsManager.blackOpacity42
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(AssetsManager.chat),
                                      const SizedBox(width: 5,),
                                      Text(
                                        'تواصل',
                                        style: StyleManager.bold.copyWith(
                                            fontSize: 18.0,
                                            color: ColorsManager.blackOpacity42
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                              const SizedBox(height: 10.0,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(AssetsManager.case1, width: 14, height: 14,),
                                  const SizedBox(width: 5,),
                                  Text(
                                    'الخدمات المصرفية والمالية،الشركات',
                                    style: StyleManager.bold.copyWith(
                                        fontSize: 14.0,
                                        color: ColorsManager.blackOpacity42
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14.0,),
                              Text(
                                'يمكنك طلب استشارة من محام من هنا. الخدمة مجانية وهويتك مخفاة. لا حاجة للتسجيل.اسأل سؤالك القانوني واحصل على إجابة بالمجان من أحد المحامين، من خلال قسم الأسئلة والأجوبة، الدردشة الحية، أو عن طريق الهاتف. فقط قم باختيار الوسيلة المناسبة لك:',
                                style: StyleManager.bold.copyWith(
                                    fontSize: 16.0,
                                    color: ColorsManager.greyBlue
                                ),
                              ),
                              const SizedBox(height: 5.0,)
                            ],
                          ),
                        )
                    ),
                    const SizedBox(height: 50.0,),
                    if(lawyer.data!.services != null )
                      if(lawyer.data!.services!.isNotEmpty)
                    CustomFrame(
                      child: Column(
                        children:
                        [
                          SectionTitle(text: lawyer.data!.name??'', fontSize: 18.0,),
                          Padding(
                            padding: const EdgeInsetsDirectional.symmetric(horizontal: 40.0, vertical: 30.0),
                            child: ListView.builder(
                              itemCount: lawyer.data!.services!.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index)=> ActionBuilder(
                                  assetName: index>=icons.length? null: icons[index],
                                  text: lawyer.data!.services![index] ?? ''
                              )
                            )
                            ),
                            const SizedBox(height: 30,),
                          ],
                        )
                    ),
                    const SizedBox(height: 45.0,),
                    CustomFrame(
                        child: Column(
                          children:
                          [
                            const SectionTitle(text: 'ملف المحامي', fontSize: 20.0,),
                            const SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 11.0),
                              child: Text(
                                lawyer.data!.file??'',
                                textAlign: TextAlign.start,
                                style: StyleManager.bold.copyWith(
                                    fontSize: 16.0,
                                    color: ColorsManager.grey2
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                    const SizedBox(height: 50.0,),
                    if(lawyer.data!.reviews != null)
                      if(lawyer.data!.reviews!.isNotEmpty)
                    CustomFrame(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:  MainAxisAlignment.center,
                            children: [
                              Text(
                                'مراجعات العملاء',
                                style: StyleManager.bold.copyWith(
                                    fontSize: 24.0,
                                    color: ColorsManager.black2
                                ),
                              ),
                              const SizedBox(height: 30.0,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children:
                                [
                                  SvgPicture.asset(AssetsManager.star,
                                    height: 24.0, width: 24.0,),
                                  const SizedBox(width: 5,),
                                  Text(
                                    '${lawyer.data!.rating??0}',
                                    style: StyleManager.bold.copyWith(
                                        fontSize: 20.0,
                                        color: ColorsManager.black2,
                                        height: 0.8
                                    ),),
                                  const SizedBox(width: 8,),
                                  Text(
                                    'بناءً على 24 من التقييمات',
                                    style: StyleManager.bold.copyWith(
                                        fontSize: 14.0,
                                        color: ColorsManager.grey3
                                    ),),


                                ],
                              ),
                              const SizedBox(height: 20.0,),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: lawyer.data!.reviews!.length,
                                itemBuilder: (context, index) =>
                                AgentRateItemBuilder(review: lawyer.data!.reviews![index])
                              )
                            ],
                          ),
                        )
                    ),
                    const SizedBox(height: 50.0,),
                    CustomFrame(
                        child: Column(
                          children:
                          [
                            SectionTitle(
                              text: 'النشاط',
                              fontSize: 20,
                              widget: Padding(
                                padding: const EdgeInsetsDirectional.only(end: 20.0),
                                child: ActivityChartNo(count: lawyer.data!.questionNo??0,),
                              ),
                            ),
                            const SizedBox(height: 60.0,),
                            const Padding(
                              padding: EdgeInsetsDirectional.only(start: 19.0),
                              child: ChartKeyBuilder(
                                  text: 'الاسئلة الغير مجاب عليها',
                                  color: ColorsManager.blackBlue
                              ),
                            ),
                            const SizedBox(height: 18.0,),
                            const Padding(
                              padding: EdgeInsetsDirectional.only(start: 19.0),
                              child: ChartKeyBuilder(
                                  text: 'الاسئلة المجاب عليها',
                                  color: ColorsManager.brown
                              ),
                            ),
                            const SizedBox(height: 35.0,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 22.0),
                              child: Column(
                                children: [
                                  Text(
                                    'تم تسليم الخدمات المدفوعة',
                                    style: StyleManager.medium.copyWith(
                                        fontSize: 16.0,
                                        color: ColorsManager.grey4
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 40.0,),
                                  Text(
                                    '250',
                                    style: StyleManager.bold.copyWith(
                                        fontSize: 60.0,
                                        color: ColorsManager.black2
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 25.0,),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:
                                    [
                                      NoIconAboveProgressBuilder(
                                        count: 1,
                                        assetName: AssetsManager.starEmpty,
                                        isPNG: true,
                                      ),
                                      NoIconAboveProgressBuilder(
                                        count: 5,
                                        assetName: AssetsManager.starEmpty,
                                        isPNG: true,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  const CustomProgressBar(progress: 0.8),
                                  const SizedBox(height: 25,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                    child: Column(
                                      children:
                                      [
                                        PiChartBuilder(
                                          upperTitle: ' إجراء المكالمات الهاتفية المطلوبة',
                                          title: 'مكالمات',
                                          answered: lawyer.data!.callRequests!.toDouble()/
                                              lawyer.data!.questionNo!.toDouble()*100,
                                          unanswered: 100-lawyer.data!.callRequests!.toDouble()/
                                              lawyer.data!.questionNo!.toDouble()*100,
                                        ),
                                        const SizedBox(height: 40.0,),
                                        PiChartBuilder(
                                          upperTitle: 'الرد على طلبات المحادثة',
                                          title: 'طلبات المحادثة',
                                          answered: lawyer.data!.messageRequests!.toDouble()/
                                              lawyer.data!.questionNo!.toDouble()*100,
                                          unanswered: 100-lawyer.data!.messageRequests!.toDouble()/
                                              lawyer.data!.questionNo!.toDouble()*100,
                                        ),
                                        const SizedBox(height: 40.0,),
                                        PiChartBuilder(
                                          upperTitle: 'إجابة الأسئلة العامة',
                                          title: 'اسئلة',
                                          answered: lawyer.data!.publicQuestions!.toDouble()/
                                              lawyer.data!.questionNo!.toDouble()*100,
                                          unanswered: 100-lawyer.data!.publicQuestions!.toDouble()/
                                              lawyer.data!.questionNo!.toDouble()*100,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 40.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:
                                    [
                                      NoIconAboveProgressBuilder(
                                        count: 200, assetName: AssetsManager.like,
                                        isPNG: false,
                                      ),
                                      NoIconAboveProgressBuilder(
                                        count: 50,
                                        assetName: AssetsManager.dislike,
                                        isPNG: false,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  CustomProgressBar(progress: 0.8),
                                  const SizedBox(height: 30.0,),
                                ],
                              ),
                            )
                          ],
                        )
                    ),
                    const SizedBox(height: 50,),
                    if(lawyer.data!.lastAnswers != null)
                      if(lawyer.data!.lastAnswers!.isNotEmpty)
                    CustomFrame(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            [
                              const SizedBox(height: 24.0,),
                              Text(
                                'اجوبة حديثة',
                                style: StyleManager.bold.copyWith(
                                    fontSize: 24.0,
                                    color: ColorsManager.black2
                                ),
                              ),
                              const SizedBox(height: 30.0,),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: lawyer.data!.lastAnswers!.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 30.0),
                                    child: Column(
                                      children:
                                      [
                                        Text(
                                          lawyer.data!.lastAnswers![index]??'',
                                          style: StyleManager.bold.copyWith(
                                              fontSize: 16.0,
                                              color: ColorsManager.grey4
                                          ),
                                        ),
                                        const SizedBox(height: 10.0,),
                                        const CustomDivider()
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        )
                    ),
                    const SizedBox(height: 40.0,),
                  ],
                );
              }
              else if(state is GetLawyerDataFailure)
              {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(state.error.tr,
                      textAlign: TextAlign.center,
                      style: StyleManager.bold.copyWith(
                        fontSize: 18,
                        color: ColorsManager.grey
                      ),),
                    ),
                    MaterialButton(
                      onPressed: ()
                      {
                        GetLawyerDataCubit.get(context).getLawyerData();
                      },
                    color: ColorsManager.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                      child: Text('تحديث',
                      style: StyleManager.bold.copyWith(
                        color: ColorsManager.white,
                        fontSize: 18,
                      ),),
                    ),)
                  ],
                );
              }
              else if(state is GetLawyerDataLoading)
              {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.black,
                  ),
                );
              }
              else
              {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}


class PiChartBuilder extends StatelessWidget {
  const PiChartBuilder({super.key, required this.title, required this.unanswered, required this.answered, required this.upperTitle});

  final String upperTitle;
  final String title;
  final double unanswered;
  final double answered;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      [
        Text(
          upperTitle,
          style: StyleManager.medium.copyWith(
              fontSize: 16.0,
              color: ColorsManager.grey4
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 35,),
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              sections: [
                PieChartSectionData(
                  color: ColorsManager.brown,
                  value: answered,
                  title: '${answered.round()}% $title \nمجاب عليها',
                  radius: 100,
                  titleStyle: StyleManager.regular.copyWith(
                    fontSize: 12.0,
                    color: ColorsManager.white,
                    height: 1.2
                  )
                ),
                PieChartSectionData(
                  color: ColorsManager.blackBlue,
                  value: unanswered,
                  title: ' ${unanswered.round()}% $title\n غير مجاب عليها',
                  radius: 100,
                  titleStyle: StyleManager.regular.copyWith(
                    fontSize: 12.0,
                    color: ColorsManager.white,
                    height: 1.2
                  )
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({super.key, required this.progress});

  final double progress;
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      color: ColorsManager.brown,
      backgroundColor: ColorsManager.grey5,
      borderRadius: BorderRadius.circular(30),
    );
  }
}

class NoIconAboveProgressBuilder extends StatelessWidget {
  const NoIconAboveProgressBuilder({super.key, required this.count, required this.assetName, required this.isPNG});

  final int count;
  final String assetName;
  final bool isPNG;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
        Text(
          '$count',
          style: StyleManager.regular.copyWith(
              fontSize: 14.0,
              color: ColorsManager.black2
          ),
        ),
        const SizedBox(width: 5,),
        isPNG?
        Image.asset(assetName)
            :
        SvgPicture.asset(assetName),
      ],
    );
  }
}

class ChartKeyBuilder extends StatelessWidget {
  const ChartKeyBuilder({super.key, required this.text, required this.color});

  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
        Text(
          text,
          style: StyleManager.regular.copyWith(
            fontSize: 12.0,
          ),
        ),
        const SizedBox(width: 5,),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          height: 14.13,
          width: 8.59,
          color: color,
        )
      ],
    );
  }
}

class ActivityChartNo extends StatelessWidget {
  const ActivityChartNo({super.key, required this.count});

  final int count ;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SvgPicture.asset(AssetsManager.chart),
        const SizedBox(width: 5,),
        Text(
          '$count',
          style: StyleManager.extraBold.copyWith(
              fontSize: 14.0,
              color: ColorsManager.blackOpacity42,
              height: 0.8
          ),
        ),
      ],
    );
  }
}

class AgentRateItemBuilder extends StatelessWidget {
  const AgentRateItemBuilder({super.key, required this.review,});

  final Reviews review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        children:
        [
          Row(
            children:
            [
              SvgPicture.asset(AssetsManager.buildings),
              const SizedBox(width: 5,),
              Text(
                review.name ?? '',
                style: StyleManager.bold.copyWith(
                  fontSize: 20.0,
                  color: ColorsManager.black2,
                  height: 1.2
                ),
              ),
              const Spacer(),

              RateStarsBuilder(rate: review.rate??0.0),
            ]
          ),
          const SizedBox(height: 15.0,),
          Text(
            review.comment ?? '',
            style: StyleManager.bold.copyWith(
              fontSize: 16.0,
              color: ColorsManager.grey4
            ),),

          const SizedBox(height: 10.0,),
          const CustomDivider(),

        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(color: ColorsManager.greyWhite, thickness: 1.0, height: 1,);
  }
}

class RateStarsBuilder extends StatelessWidget {
  const RateStarsBuilder({super.key, required this.rate});

  final double rate ;
  @override
  Widget build(BuildContext context) {

    int fullStars = rate.floor();
    bool hasHalfStar = (rate - fullStars) >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        // Empty stars
        for (int i = 0; i < emptyStars; i++)
          Image.asset(AssetsManager.starEmpty),

        // Half star
        if (hasHalfStar)
          Image.asset(AssetsManager.halfStar),

        // Full stars
        for (int i = 0; i < fullStars; i++)
          SvgPicture.asset(AssetsManager.star),

      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.text, required this.fontSize, this.widget});

  final String text;
  final double fontSize;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: double.infinity,
      color: ColorsManager.whiteGrey,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: StyleManager.bold.copyWith(
                    fontSize: fontSize,
                  ),
                ),
              ),
              if(widget != null)
                widget!,
            ],
          ),
        ],
      ),
    );
  }
}

class ActionBuilder extends StatelessWidget {
  const ActionBuilder({super.key, required this.assetName, required this.text});

  final String? assetName;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        children:
        [
          Builder(
            builder: (context) {
              if(assetName != null) {
                return SvgPicture.asset(
                assetName!,
                width: 40,
                height: 40,
                color: ColorsManager.brown,
              );
              } else {
                return const SizedBox(
                width: 40,
                height: 40,
              );
              }
            }
          ),
          const SizedBox(width: 32.0,),
          Text(
            text,
            style: StyleManager.bold.copyWith(
                fontSize: 20.0,
                color: ColorsManager.blackOpacity42
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFrame extends StatelessWidget {
  const CustomFrame({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white, // Set the background color of the container
          boxShadow: [
            BoxShadow(
              color: ColorsManager.blackOpacity10, // Shadow color and opacity
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: child
    );
  }
}
