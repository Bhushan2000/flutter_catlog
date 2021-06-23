import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catlog/core/store.dart';
import 'package:flutter_catlog/models/cart.dart';
 
 
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      backgroundColor: context.canvasColor,
      body: Column(
        children: [_CartList().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final CartModel? _cart = (VxState.store as MyStore).cart;
  // final _paymentItems = <PaymentItem>[];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {ReomveMutation},
            builder: (context, s, _) {
              // _paymentItems.add(PaymentItem(
              //   amount: _cart!.totalPrice.toString(),
              //   label: "Course",
              //   status: PaymentItemStatus.final_price,
              // ));
              return "\$${_cart!.totalPrice}"
                  .text
                  .color(context.accentColor)
                  .xl5
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet !!".text.make()));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor)),
                  child: "Buy".text.white.make())
              .w32(context)

          // Row(
          //   children: [
          //     ApplePayButton(
          //       paymentConfigurationAsset: 'applepay.json',
          //       paymentItems: _paymentItems,
          //       width: 200,
          //       height: 50,
          //       style: ApplePayButtonStyle.black,
          //       type: ApplePayButtonType.buy,
          //       margin: const EdgeInsets.only(top: 15.0),
          //       onPaymentResult: (data) {
          //         print(data);
          //       },
          //       loadingIndicator: const Center(
          //         child: CircularProgressIndicator(),
          //       ),
          //     ),
          //     GooglePayButton(
          //       paymentConfigurationAsset: 'gpay.json',
          //       paymentItems: _paymentItems,
          //       width: 200,
          //       height: 50,
          //       style: GooglePayButtonStyle.black,
          //       type: GooglePayButtonType.pay,
          //       margin: const EdgeInsets.only(top: 15.0),
          //       onPaymentResult: (data) {
          //         print(data);
          //       },
          //       loadingIndicator: const Center(
          //         child: CircularProgressIndicator(),
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel? _cart = (VxState.store as MyStore).cart;

    // VxState.listen(context, to: [ReomveMutation]);

    /// "VxState.listen" change to "VxState.watch"

    VxState.watch(context, on: [ReomveMutation]);

    return _cart!.items.isEmpty
        ? "Noting to Show".text.xl3.makeCentered()
        : ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.done_outline),
                trailing: IconButton(
                  onPressed: () {
                    ReomveMutation(_cart.items[index]);
                  },
                  icon: Icon(Icons.remove_circle_outline),
                ),
                title: _cart.items[index].name!.text.make(),
              );
            },
            itemCount: _cart.items.length,
          );
  }
}
