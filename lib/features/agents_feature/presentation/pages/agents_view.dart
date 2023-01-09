import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/widgets/app_widgets.dart';
import 'package:final_project/features/home_feature/presentation/widgets/home_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AgentsScreen extends StatelessWidget {
  const AgentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
          title: Text(AppTexts.realEstateAgents.tr),
          backgroundColor: context.theme.scaffoldBackgroundColor,


      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(AppSizes.height10.w.h),
          child: Column(
            children: [
            Text(AppTexts.findWithAgents.tr,
            style: context.theme.textTheme.headline4?.copyWith(
                fontSize: 18.sp
            ),),
              Expanded(child:
              GridView.builder(
                itemCount: 14,
                itemBuilder: (context, index) =>  InkWell(
                  onTap: ()=>Get.toNamed(AppRoutes.getagentDetailsRout()),
                  child: Card(
                    child: Padding(
                      padding:   EdgeInsets.all(AppSizes.height10.w.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,

                        children: [
                          Card(
                            elevation: 0,
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: AppSizes.height10.w,vertical: AppSizes.height10/2.h),
                              child: Text(AppTexts.percent.tr+" "+'2%',
                                style: context.theme.textTheme.headline2?.copyWith(
                                    fontSize: 12
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage: ExactAssetImage(
                              AppImages.agentImage,


                            ),
                            radius: AppSizes.radius40*2,
                          ),

                          Center(
                            child: Text(AppTexts.userName.tr,
                              style: context.theme.textTheme.headline1?.copyWith(
                                  fontSize: 18.sp
                              ),
                            ),
                          ),
                          Row(

                            children: [
                              Text(AppTexts.sell.tr+" "+"15",
                                style: context.theme.textTheme.headline1?.copyWith(
                                    fontSize: 18.sp
                                ),
                              ),
                              Spacer(),
                              Text('5',
                                style: context.theme.textTheme.headline1?.copyWith(
                                    fontSize: 18.sp
                                ),
                              ),
                              Icon(Icons.star,color: Colors.yellow,)

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                shrinkWrap: true, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.59.w.h,


              ),


              ))





            ],
          ),
        ),
      ),
    );
  }
}
