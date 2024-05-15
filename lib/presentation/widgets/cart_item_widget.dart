import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 88,
            width: 88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.amberAccent,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Jordan 1 Retro High Tie Dye',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16.0),
                ),
                const Text('Nike . Red Grey . 40',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('\$203',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon:
                              const Icon(Icons.remove_circle_outline),
                        ),
                        const Text('1'),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                              Icons.add_circle_outline_sharp),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
