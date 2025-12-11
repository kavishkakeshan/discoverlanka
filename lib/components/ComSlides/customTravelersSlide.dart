import 'package:carousel_slider/carousel_slider.dart';
import 'package:discoverlanka/models/slideModel.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomTravelesSlides extends StatefulWidget {
  final List<Slide> slides;

  const CustomTravelesSlides({
    super.key,
    required this.slides,
  });

  @override
  State<CustomTravelesSlides> createState() => _CustomTravelesSlidesState();
}

class _CustomTravelesSlidesState extends State<CustomTravelesSlides> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 250,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) => setState(() {
              _currentIndex = index;
            }),
          ),
          itemCount: widget.slides.length,
          itemBuilder: (context, index, realIndex) {
            final slide = widget.slides[index];
            return Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white
                      ),
                    ),
                    Positioned(
                      top: 20,
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          slide.icon!,
                          Text(
                            slide.comment!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            slide.name!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          slide.ratingIcon!,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: widget.slides.length,
          effect: ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Colors.green.shade500,
            dotColor: Colors.grey.shade300,
          ),
          onDotClicked: (index) {
            _carouselController.animateToPage(index);
          },
        ),
      ],
    );
  }
}