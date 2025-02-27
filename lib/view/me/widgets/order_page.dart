import 'package:flutter/material.dart';
import 'package:fomoplay/constants/gradient_app_bar.dart';
import 'package:fomoplay/constants/app_colors.dart';
import 'package:fomoplay/constants/constant_widgets/container_constant.dart';
import 'package:fomoplay/constants/text_widget.dart';
import 'package:fomoplay/generated/assets.dart';
import 'package:fomoplay/main.dart';
import 'package:fomoplay/view_modal/deposit_view_modal.dart';
import 'package:fomoplay/view_modal/withdraw_view_modal.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  final int initialIndex;
  const OrderScreen({super.key, required this.initialIndex});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int selectedIndex = 0;

  void selectContainer(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final depositViewModel =
          Provider.of<DepositViewModel>(context, listen: false);
      depositViewModel.depositHistoryApi(context,depositViewModel.selectedCard);
      final withdrawViewModel =
          Provider.of<WithdrawViewModel>(context, listen: false);
      withdrawViewModel.withdrawHistoryApi(context, withdrawViewModel.selectedCard);
      selectedIndex = widget.initialIndex;
    });
  }
  // int selectedCard = 0;

  List<Map<String, String>> items = [
    {'title': 'E-Wallet', 'image': Assets.iconsUpiIcon},
    // {'title': 'USDT-TRC20', 'image': Assets.iconsUsdtIcon},
  ];
  @override
  Widget build(BuildContext context) {
    final depositViewModel = Provider.of<DepositViewModel>(context);
    final withdrawViewModel = Provider.of<WithdrawViewModel>(context);
    return Scaffold(
      appBar: GradientAppBar(
        elevation: 10,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 15,
              color: AppColors.whiteColor,
            )),
        centerTitle: true,
        title: const TextWidget(
            title: 'Order',
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: AppColors.whiteColor),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesAppBg),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: height * 0.03),
                width: width * 0.82,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: AppColors.whiteColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SelectableContainer(
                      height: height * 0.05,
                      width: width * 0.4,
                      name: 'Withdrawal',
                      isSelected: selectedIndex == 0,
                      onTap: () => selectContainer(0),
                    ),
                    SelectableContainer(
                      height: height * 0.05,
                      width: width * 0.4,
                      name: 'Deposit',
                      isSelected: selectedIndex == 1,
                      onTap: () => selectContainer(1),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Payment Channel',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.lightWhite,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: height * 0.12,
                width: width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   selectedCard = index;
                        // });
                        withdrawViewModel.setSelectCard(index);
                         depositViewModel.setSelectCard(index);
                        withdrawViewModel.withdrawHistoryApi(context, withdrawViewModel.selectedCard);
                        depositViewModel.depositHistoryApi(context,depositViewModel.selectedCard);
                        print('Selected Card: ${withdrawViewModel.selectedCard}');
                      },
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: withdrawViewModel.selectedCard == index
                                ? AppColors.appButton
                                : null,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: height * 0.15,
                          width: width * 0.25,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                  height: height * 0.05,
                                  child: Image.asset(
                                    items[index]['image']!,
                                    fit: BoxFit.fill,
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                items[index]['title']!,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: withdrawViewModel.selectedCard == index
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            if (withdrawViewModel.withdrawHistoryData != null)
              if (selectedIndex == 0)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      withdrawViewModel.withdrawHistoryData!.data!.length,
                  itemBuilder: (context, index) {
                    final withdrawData =
                        withdrawViewModel.withdrawHistoryData!.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 2,
                        color: AppColors.greyLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextWidget(
                                title: withdrawData.status == 1
                                    ? "Pending"
                                    : withdrawData.status == 2
                                        ? "Success"
                                        : "Failed",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: withdrawData.status == 1
                                    ? AppColors.orange
                                    : withdrawData.status == 2
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                            walletHistoryInfo(
                              context,
                              "Withdrawal Amount",
                              "Rs ${withdrawData.actualAmount}",
                              width,
                              height,
                            ),
                            walletHistoryInfo(
                              context,
                              "Type",
                              withdrawData.type.toString()== "0"?"INR":"USDT",
                              width,
                              height,
                            ),
                            walletHistoryInfo(
                              context,
                              "Order ID",
                              withdrawData.orderId.toString(),
                              width,
                              height,
                            ),
                            walletHistoryInfo(
                              context,
                              "Date",
                              withdrawData.createdAt.toString(),
                              width,
                              height,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              else

                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: depositViewModel.depositHistoryData!.data!.length,
                  itemBuilder: (context, index) {
                    final depositData =
                        depositViewModel.depositHistoryData!.data![index];
                    return Card(
                      elevation: 2,
                      color: AppColors.greyLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextWidget(
                              title: depositData.status == 1
                                  ? "Pending"
                                  : depositData.status == 2
                                      ? "Success"
                                      : "Failed",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: depositData.status == 1
                                  ? AppColors.orange
                                  : depositData.status == 2
                                      ? Colors.green
                                      : Colors.red,
                            ),
                          ),
                          walletHistoryInfo(
                            context,
                            "Deposit Amount",
                            "Rs ${depositData.cash}",
                            width,
                            height,
                          ),
                          walletHistoryInfo(
                            context,
                            "Type",
                            depositData.type.toString() == "0"?"INR":"USDT",
                            width,
                            height,
                          ),
                          walletHistoryInfo(
                            context,
                            "Order ID",
                            depositData.orderId.toString(),
                            width,
                            height,
                          ),
                          walletHistoryInfo(
                            context,
                            "Date",
                            depositData.createdAt.toString(),
                            width,
                            height,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                        ],
                      ),
                    );
                  },
                )
          ],
        ),
      ),
    );
  }

  Widget walletHistoryInfo(BuildContext context, String label, String value,
      double width, double height) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            title: label,
            fontSize: width * 0.035,
            fontWeight: FontWeight.w500,
            color: AppColors.lightBlack,
          ),
          TextWidget(
            title: value,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ],
      ),
    );
  }
}
