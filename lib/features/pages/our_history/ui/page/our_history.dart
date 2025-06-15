import 'package:flutter/cupertino.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';

class OurHistory extends StatelessWidget {
  const OurHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: SizedBox(
          height: 36,
          child: CupertinoSearchTextField(placeholder: 'Search'),
        ),
        trailing: CupertinoButtonComponent(
          child: const Icon(CupertinoIcons.camera, size: AppConstants.iconSize),
          onPressed: () {},
        ),
        backgroundColor: CupertinoColors.systemGroupedBackground,
        padding: const EdgeInsetsDirectional.only(end: 8.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingHalf),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppConstants.outBorderRadius),
                    child: Image.asset(
                      AppConstants.mohammedbinSalmanAlSaudPNG,
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Spacer(),
                  Text('Qissat Hirfati'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
