import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tb_patner/utils/utils.dart';

import '../../../../../res/constants/app_colors.dart';
import '../../../../../res/comman/my_text.dart';

class CustomDropdownButton extends StatefulWidget {
  final String heading;
  final List<String> itemList;
  const CustomDropdownButton({
    super.key,
    required this.heading,
    required this.itemList,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  late String _defaultVal;

  @override
  void initState() {
    _defaultVal = widget.itemList.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.02),
        MyTextPoppines(
          text: widget.heading,
          fontSize: width * 0.038,
          color: Colors.black.withOpacity(0.4),
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: height * 0.01),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.0085,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(width * 0.01),
            border: Border.all(
              width: width * 0.002,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Theme(
                  data: Utils.noSplashEffect(context),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _defaultVal,
                      icon: const Icon(
                        CupertinoIcons.chevron_down,
                        color: AppColor.black,
                      ),
                      iconSize: width * 0.05,
                      onChanged: (String? newValue) {
                        setState(() {
                          _defaultVal = newValue!;
                        });
                      },
                      items: widget.itemList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: MyTextPoppines(
                              text: value,
                              fontSize: width * 0.038,
                              color: Colors.black.withOpacity(0.9),
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
