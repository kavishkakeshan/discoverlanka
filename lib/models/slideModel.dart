import 'package:flutter/material.dart';


class Slide {
  final String? image;
  final String? title;
  final String? desc;
  final Icon? icon;
  final String? comment;
  final String? name;
  final Widget? ratingIcon;
  final Widget? location;
  final ElevatedButton? button; 

  Slide({
    this.image,
    this.title,
    this.desc,
    this.icon,
    this.comment,
    this.name,
    this.ratingIcon,
    this.location,
    this.button,
  });
}