import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_images/app_images.dart';
import 'package:final_project/core/app_routes/app_routes.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/core/app_themes/app_themes.dart';
import 'package:final_project/features/home_feature/domain/entities/home_item_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';


class EstateCard extends StatelessWidget {
 HomeEntity homeEntity;
 late DateTime dateTime;


  EstateCard({required this.homeEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15.h.w),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 315.w,
                  height: 165.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    image: DecorationImage(
                      image: ExactAssetImage( homeEntity.image,
                       ), fit: BoxFit.cover,
                    )
                  ),
                  // child: Image.asset(
                  //   homeEntity.image,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.headLine1Color,
                        radius: 16,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){},
                          icon: Icon(Icons.favorite,color: Colors.white,size: 16,),
                        ),
                      ), SizedBox(
                        width: AppSizes.height10.w,
                      ),CircleAvatar(
                        backgroundColor: AppColors.headLine1Color,
                        radius: 16,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){
                            Share.share(homeEntity.image);
                          },
                          icon: Icon(Icons.share,color: Colors.white,size: 16,),
                        ),
                      ),SizedBox(
                        width: AppSizes.height10.w,
                      ), CircleAvatar(
                        backgroundColor: AppColors.headLine1Color,
                        radius: 16,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: ()async {
                      dateTime = (await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.utc(2031)))!;

                          },
                          icon: Icon(Icons.calendar_month,color: Colors.white,size: 16,),
                        ),

                      ),
                      SizedBox(
                        width: AppSizes.height10.w,
                      ),
                      CircleAvatar(
                        backgroundColor: AppColors.headLine1Color,
                        radius: 16,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){
                            launch("tel://0597786890");
                          },
                          icon: Icon(Icons.call,color: Colors.white,size: 16,),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: AppSizes.height10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  homeEntity.location.tr +
                      " ," +
                      homeEntity.subLocation1.tr +
                      ", " +
                      homeEntity.subLocation2.tr,
                  style: context.theme.textTheme.headline3?.copyWith(
                    color: AppColors.headLine3Color
                  ),
                ),
                TextButton(

                    onPressed: () {
                  Get.toNamed(AppRoutes.getdetailsRout());
                }, child: Text(AppTexts.detailes.tr,style: context.theme.textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.w700,

                ),))
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [

                    Text(
                      homeEntity.bathrooms
                     ,
                      style: context.theme.textTheme.headline3?.copyWith(
                          color: AppColors.headLine3Color
                      ),
                    ),
                    Image.asset(AppImages.bathIcon,

                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(

                          homeEntity.bedrooms ,

                      style: context.theme.textTheme.headline3?.copyWith(
                          color: AppColors.headLine3Color
                      ),
                    ),
                    Image.asset(AppImages.bedIcon,

                    ),
                  ],
                ),Row(
                  children: [
                    Text(
                          homeEntity.area,
                      style: context.theme.textTheme.headline3?.copyWith(
                          color: AppColors.headLine3Color
                      ),
                    ),
                    Image.asset(AppImages.areaIcon,

                    ),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
