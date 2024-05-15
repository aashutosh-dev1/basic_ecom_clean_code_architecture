import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shoesly/data/network/firestore_db.dart';
import 'package:shoesly/presentation/widgets/cart_item_widget.dart';
import 'package:shoesly/utils/colors.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xffD7D7D7),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ) // changes position of shadow)
          ],
          color: Colors.white,
        ),
        height: 90,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Grand Total"),
                  const Gap(5),
                  Text(
                    "\$235.00",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => FirestoreDB().uploadData(),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20.0, 18.0, 24.0, 20.0),

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.primaryColor),
                //  13px, 24px, 13px, 24px
                child: const Text(
                  "CHECKOUT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: CartItemWidget(),
            ),
          )),
    );
  }
}
