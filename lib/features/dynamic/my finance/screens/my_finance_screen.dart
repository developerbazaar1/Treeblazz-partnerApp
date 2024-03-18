import 'package:flutter/material.dart';
import 'package:tb_patner/features/dynamic/my%20finance/widgets/finance_history_card_widget.dart';
import 'package:tb_patner/res/constants/appList.dart';
import 'package:tb_patner/res/constants/app_colors.dart';

import '../../../../res/comman/my_appbar.dart';
import '../../../../res/comman/my_text.dart';

class MyFinanceScreen extends StatelessWidget {
  static const String routeName = '/myFinance';
  const MyFinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const MyAppBarWithoutButton(text: "My Finance"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.045,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total earning container
            Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.03,
                horizontal: width * 0.05,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.03),
                color: const Color(0xFFEFEFEF),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    size: width * 0.18,
                    color: AppColor.black.withOpacity(0.8),
                  ),
                  SizedBox(width: width * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextPoppines(
                        text: "\$5679.00",
                        fontSize: width * 0.055,
                        color: AppColor.redColor,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: height * 0.006),
                      MyTextSansPro(
                        text: "Total Orders",
                        fontSize: width * 0.045,
                        color: const Color(0xFF586E78),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            // List of Finance History
            MyTextSansPro(
              text: "Finance History",
              fontSize: width * 0.06,
              color: AppColor.black,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: height * 0.01),
            Expanded(
              child: ListView.builder(
                itemCount: AppList.financeList.length,
                itemBuilder: (context, index) {
                  String heading = AppList.financeList[index].title;
                  String finance = AppList.financeList[index].earning;
                  return FinanceHistoryCard(
                    headingText: heading,
                    earning: finance,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
