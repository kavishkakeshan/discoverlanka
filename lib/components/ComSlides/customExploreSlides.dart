import 'package:carousel_slider/carousel_slider.dart';
import 'package:discoverlanka/models/slideModel.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomExploreSlides extends StatefulWidget {
  final List<Slide> slides;

  const CustomExploreSlides({super.key, required this.slides});

  @override
  State<CustomExploreSlides> createState() => _CustomExploreSlidesState();
}

class _CustomExploreSlidesState extends State<CustomExploreSlides> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

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
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 62, 255, 72),
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
                    if (slide.image != null)
                      Image.network(
                        slide.image!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                      ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            const Color.fromARGB(255, 0, 0, 0), // Updated for clarity
                            Colors.black26,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (slide.title != null) ...[
                            Text(
                              slide.title!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          const SizedBox(height: 5),
                          if (slide.desc != null) ...[
                            Text(
                              slide.desc!,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                          const SizedBox(height: 10),

                          if (slide.location != null) ...[
                            const SizedBox(height: 10),
                            slide.location!,
                          ],
                          const SizedBox(height: 10),
                          if (slide.button != null) ...[
                            const SizedBox(height: 10),
                            slide.button!,
                          ],
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
