import 'package:flutter/material.dart';
import 'package:slash_store/core/theme/app_color.dart';
import 'package:slash_store/core/widgets/form_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 15.0,
        start: 10.0,
        end: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                    //rgba(228, 228, 228, 0.52)
                    color: AppColor.searchColor,
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(10.0))),
                child: SlashFormField(
                    controller: TextEditingController(),
                    inputType: TextInputType.text,
                    fieldLabel: 'Search here.',
                    icon: const Icon(Icons.search_outlined),
                    validate: null),
              )),
          const SizedBox(width: 10.0,),
          Expanded(
              flex: 1,
              child: Container(
                width: 313.1,
                  height: 64.0,
                  decoration: const BoxDecoration(
                      //rgba(228, 228, 228, 0.52)
                      color: AppColor.searchColor,
                      borderRadius:
                          BorderRadiusDirectional.all(Radius.circular(10.0))),
                  child: Image.asset('assets/images/modify_slider.png')))
        ],
      ),
    );
  }
}
