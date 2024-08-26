import 'package:get/get.dart';
import 'package:weather_prediction/exports.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final double? borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? image;
  final Color? bgColor;
  final Color? fontColor;
  final BoxShadow? boxShadow;
  final Border? border;
  final double? width;
  final double? height;
  final double? padding;
  final double imageHeight;
  final double imageWidth;
  final double imageRightPadding;
  final TextAlign? textAlign;

  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.borderRadius,
      this.fontSize,
      this.fontWeight,
      this.imageRightPadding = 10,
      this.image,
      this.bgColor,
      this.fontColor,
      this.boxShadow,
      this.border,
      this.width,
      this.height,
      this.padding,
      this.textAlign,
      this.imageHeight = 30.01,
      this.imageWidth = 30.09});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: width,
          height: height ?? 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              color: bgColor ?? AppColors.backgroundColor,
              boxShadow: boxShadow != null
                  ? [boxShadow!]
                  : [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
              border: border),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image != null
                    ? Image.asset(
                        image ?? '',
                        height: imageHeight,
                        width: imageWidth,
                      ).paddingOnly(right: imageRightPadding)
                    : const SizedBox(),
                Text(
                  buttonText,
                  textAlign: textAlign,
                  style: AppFonts.ubuntuFont(
                    TextStyle(
                      fontWeight: fontWeight ?? FontWeight.w700,
                      color: fontColor ?? AppColors.textBlackColor,
                      fontSize: fontSize ?? 16,
                    ),
                  ),
                ),
              ],
            ),
          ).paddingSymmetric(horizontal: padding ?? 30),
        ),
      ),
    );
  }
}
