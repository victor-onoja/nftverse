import 'package:flutter/material.dart';
import 'package:nftverse/constants/colors.dart';

class MPITEMWidget extends StatelessWidget {
  String image;
  String title;
  MPITEMWidget({required this.image, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 345,
      width: 215,
      decoration: BoxDecoration(
        border: const Border(
            bottom: BorderSide(color: Colors.white),
            top: BorderSide(color: Colors.white),
            left: BorderSide(color: Colors.white),
            right: BorderSide(color: Colors.white)),
        borderRadius: BorderRadius.circular(12),
        color: AppColors.others2,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                  height: 200,
                  width: 200,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.monetization_on,
                    color: AppColors.others2,
                  ),
                  label: Text(
                    'BUY',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.button)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
