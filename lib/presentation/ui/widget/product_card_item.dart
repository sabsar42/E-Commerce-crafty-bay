import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import '../utility/assets_path.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: 160,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  AssetsPath.dummyShoeImagePng,
                  width: 160,
                  height: 120,

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nike Sneaker v100 Onek Boro',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$120',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor),
                        ),
                        SizedBox(width: 8,),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.star_border,
                              size: 14,
                              color: Colors.orangeAccent,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                        SizedBox(width: 8,),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.favorite_border_outlined,
                              size: 12,
                              color: Colors.white70,
                            ),
                          ),
                          color: AppColors.primaryColor,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

