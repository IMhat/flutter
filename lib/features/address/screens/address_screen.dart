import 'package:smiley_app/common/widgets/bottom_bar.dart';
import 'package:smiley_app/common/widgets/custom_button.dart';
import 'package:smiley_app/common/widgets/custom_textField.dart';
import 'package:smiley_app/constants/global_variables.dart';
import 'package:smiley_app/constants/utils.dart';
import 'package:smiley_app/features/account/services/account_services.dart';
import 'package:smiley_app/features/address/services/address_services.dart';

import 'package:smiley_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final String totalAmount;

  const AddressScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final AccountServices accountServices = AccountServices();

  final _addressFormKey = GlobalKey<FormState>();

  String addressToBeUsed = "";

  List<PaymentItem> paymentItems = [];

  final AddressServices addressServices = AddressServices();

  @override
  void initState() {
    super.initState();
    paymentItems.add(
      PaymentItem(
        amount: widget.totalAmount,
        label: 'Total Amount',
        status: PaymentItemStatus.final_price,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }

  void exchangeProduct(user) {
    if (widget.totalAmount.isNotEmpty) {
      accountServices.exchange(
        context: context,
        fromUsername: user,
        amount: double.parse(widget.totalAmount),
        summary: 'Exchange',
      );
    }
  }
  // void exchangeProduct(user) {

  //   try{
  //       accountServices.exchange(
  //       context: context,
  //       fromUsername: user,
  //       amount: double.parse(widget.totalAmount),
  //       summary: 'Exchange',
  //     );
  //     onSuccess: () {

  //      },

  //   } catch(e){

  //   }

  //   if (widget.totalAmount.isNotEmpty) {
  //     accountServices.exchange(
  //       context: context,
  //       fromUsername: user,
  //       amount: double.parse(widget.totalAmount),
  //       summary: 'Exchange',

  //     );

  //   }
  // }

// REQUIRES IOS 11+

  // void onApplePayResult(res) {
  //   if (Provider.of<UserProvider>(context, listen: false)
  //       .user
  //       .address
  //       .isEmpty) {
  //     addressServices.saveUserAddress(
  //         context: context, address: addressToBeUsed);
  //   }
  //   addressServices.placeOrder(
  //     context: context,
  //     address: addressToBeUsed,
  //     totalSum: double.parse(widget.totalAmount),
  //   );
  // }

  void onGooglePayResult(res) {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveUserAddress(
          context: context, address: addressToBeUsed);
    }
    addressServices.placeOrder(
      context: context,
      address: addressToBeUsed,
      totalSum: double.parse(widget.totalAmount),
    );
  }

  void onCashPaymentResult(address) {
    try {
      payPressed(address);

      if (Provider.of<UserProvider>(context, listen: false)
          .user
          .address
          .isEmpty) {
        addressServices.saveUserAddress(
            context: context, address: addressToBeUsed);
      }
      addressServices.placeOrder(
        context: context,
        address: addressToBeUsed,
        totalSum: double.parse(widget.totalAmount),
      );

      // accountServices.exchange(
      //   context: context,
      //   fromUsername: user,
      //   amount: double.parse(widget.totalAmount),
      //   summary: 'Exchange',
      // );
    } catch (e) {}

    // payPressed(address);

    // if (Provider.of<UserProvider>(context, listen: false)
    //     .user
    //     .address
    //     .isEmpty) {
    //   addressServices.saveUserAddress(
    //       context: context, address: addressToBeUsed);
    // }
    // addressServices.placeOrder(
    //   context: context,
    //   address: addressToBeUsed,
    //   totalSum: double.parse(widget.totalAmount),
    // );
  }

  void payPressed(String addressFromProvider) {
    addressToBeUsed = "";

    bool isForm = flatBuildingController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        cityController.text.isNotEmpty;

    if (isForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}';
      } else {
        throw Exception('Please enter all the values!');
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      showSnackBar(context, 'Incorrect address provided.');
    }
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    var user = context.watch<UserProvider>().user.email;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: flatBuildingController,
                      hintText: 'Flat, House no, Building',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: areaController,
                      hintText: 'Area, Street',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: pincodeController,
                      hintText: 'Pincode',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: cityController,
                      hintText: 'Island/City',
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              // ApplePayButton(
              //   width: double.infinity,
              //   style: ApplePayButtonStyle.whiteOutline,
              //   type: ApplePayButtonType.buy,
              //   paymentConfigurationAsset: 'applepay.json',
              //   onPaymentResult: onApplePayResult,
              //   paymentItems: paymentItems,
              //   margin: const EdgeInsets.only(top: 15),
              //   height: 50,
              //   onPressed: () => payPressed(address),
              // ),
              const SizedBox(height: 10),
              // GooglePayButton(
              //   onPressed: () => payPressed(address),
              //   paymentConfigurationAsset: 'gpay.json',
              //   onPaymentResult: onGooglePayResult,
              //   paymentItems: paymentItems,
              //   height: 50,
              //   width: double.infinity,
              //   style: GooglePayButtonStyle.black,
              //   type: GooglePayButtonType.buy,
              //   margin: const EdgeInsets.only(top: 15),
              //   loadingIndicator: const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // ),
              const SizedBox(height: 10),
              CustomButton(
                text: 'Pay With points',
                onTap: () {
                  exchangeProduct(user);

                  onCashPaymentResult(address);

                  Navigator.pushNamed(context, BottomBar.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
