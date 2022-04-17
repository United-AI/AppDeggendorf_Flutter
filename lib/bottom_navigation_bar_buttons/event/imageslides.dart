
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class ImageSlides extends StatefulWidget {
  const ImageSlides({Key? key}) : super(key: key);

  @override
  State<ImageSlides> createState() => _ImageSlidesState();
}

class _ImageSlidesState extends State<ImageSlides> {
  final List<String> hrefList = [
    "https://www.brunner-hof.de/wAssets/img/bayerischer-wald/staedtereisen/deggendorf/4-zu-3/DEG-Luitpoldplatz-neu.jpg",
    "https://imgs.search.brave.com/UaQJQq8IFdqgaRMf9d3QfX_VLrVR2N3rpaXlbIPQKBE/rs:fit:1200:1175:1/g:ce/aHR0cHM6Ly9kZWdn/ZW5kb3JmLnRyYXZl/bC9tZWRpYS9kZWdn/ZW5kb3JmLXRyYXZl/bC1zdGFkdGZ1ZWhy/dW5nLW1pdC1tdXNl/dW0uanBn",
    "https://imgs.search.brave.com/PtWgLI_rVxR-TrRrX5UnK7YsxRblWOCmTg1t1AulsqU/rs:fit:1200:908:1/g:ce/aHR0cHM6Ly9kZWdn/ZW5kb3JmLnRyYXZl/bC9tZWRpYS9kZWdn/ZW5kb3JmLXRyYXZl/bC1zdGFkdGZ1ZWhy/dW5nLXBhbm9yYW1h/LXJ1bmRmYWhydC5q/cGVn",
    "https://imgs.search.brave.com/XrtSLROJB85b4abN9IGzVRSbt2fk1UaTWu92yKBEA0M/rs:fit:1200:1127:1/g:ce/aHR0cHM6Ly93d3cu/ZGVnZ2VuZG9yZi5k/ZS9tZWRpYS9kZWdn/ZW5kb3JmLXJpZXNl/bnJhZC1nZXdpbm5z/cGllbC1nZXdpbm5l/cmZvdG9zLTEuanBn",
  ];

  final List<String> assetsImages = [
    "assets/defaultProfilePicture.png",
    "assets/degg.png",
    "assets/deggwappen.png"
  ];

  @override
  Widget build(BuildContext context) {
    return
      CarouselSlider(
        options: CarouselOptions(
          height: 180.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(seconds: 5),
          viewportFraction: 0.8,
        ),
        items: assetsImages.map((item) =>
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightGreen, width: 10,),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              //image: DecorationImage(image: AssetImage(item), fit: BoxFit.contain, alignment: Alignment.center)
            ),
            //child: Image.network(item, fit: BoxFit.cover, width: 1000,)
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(item), fit: BoxFit.contain, alignment: Alignment.center)
              ),
            )
          )
        ).toList()
      );
  }
}


// options: CarouselOptions(
// height: 180.0,
// enlargeCenterPage: true,
// autoPlay: true,
// aspectRatio: 16 / 9,
// autoPlayCurve: Curves.fastOutSlowIn,
// enableInfiniteScroll: true,
// autoPlayAnimationDuration: Duration(milliseconds: 8000),
// viewportFraction: 0.8,