import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HadithSlider extends StatelessWidget {
   HadithSlider({
    super.key,
  });

  final slider = [
    "রাসূল (সা:)বলেছেন আমার কথা (অন্যদের কাছে) পৌছিয়ে দাও, তা যদি একটি আয়াতও হয়। (সহীহ বুখারীঃ ৩২১৫)",
    "তিন ব্যক্তির দিকে কিয়ামতের দিন আল্লাহ্ তাদের দিকে করুণার দৃষ্টি দিবেন না ও তাদের জন্য কঠিন শাস্তি (ক) গিঁটের নিচে কাপড় পরিধানকারী পুরুষ (খ) খোঁটাদানকারী (গ) মিথ্যা কসমে পণ্য বিক্রয়কারী। (মুসলিম, মিশকাত হা/২৬৭৩)",
    "যে ব্যক্তি নিষ্ঠার সাথে শহীদি মৃত্যু কামনা করে, আল্লাহ্ তাকে শহীদদের মর্যাদায় পৌছিয়ে দিবেন, যদিও সে তার বিছানায় মৃত্যুবরণ করে। (সহীহ মুসলিমঃ ৪৭৭৮)",
    "রাসূল (সাঃ) ইরশাদ করেছেন, তোমাদের মধ্যে সে ব্যক্তি সর্বোত্তম যে শিখে এবং অন্যকে শিক্ষা দেয়। (সহীহ বুখারীঃ ৪৬৬১,৪৬৬২)",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 210.0, autoPlay: true, viewportFraction: 1),
      items: [0, 1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      slider[i],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13 ,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ));
          },
        );
      }).toList(),
    );
  }
}