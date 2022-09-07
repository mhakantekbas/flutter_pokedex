import 'package:flutter/cupertino.dart';
import 'package:flutter_pokedex/constants/constants.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTitle extends StatelessWidget {
  final String pokeballImageUrl = 'images/pokeball.png';
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  Constants.title,
                  style: Constants.getTitleTextStyle(),
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              pokeballImageUrl,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh // height a göre oranla
                  : 0.2.sw, //weight e göre oranla
              height: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sh,
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}
