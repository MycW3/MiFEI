import 'package:flutter/material.dart';

class Slide {
  final String imageurl;
  final String titulo;
  final String descripcion;

  Slide({
    required this.imageurl,
    required this.titulo,
    required this.descripcion,
  });
}

final slideList = [
  Slide(
      imageurl: 'assets/images/uv.png',
      titulo: 'Tecnologias Computacionales',
      descripcion: ''),
  Slide(
      imageurl: 'assets/images/avatar.jpeg',
      titulo: 'Alan',
      descripcion: 'Product Owner(Estudiante en TC)'),
  Slide(
    imageurl: 'assets/images/avatar.png',
    titulo: 'Eduardo',
    descripcion: 'Equipo de desarrollo(Estudiante en TC)',
  ),
  Slide(
      imageurl: 'assets/images/avatar.jpeg',
      titulo: 'Omar',
      descripcion: 'Equipo de desarrollo(Estudiante en TC)'),
  Slide(
      imageurl: 'assets/images/avatar.png',
      titulo: 'Mari',
      descripcion: 'Scrum master(Estudiante en TC)'),
  Slide(
      imageurl: 'assets/images/avatar.jpeg',
      titulo: 'Christian',
      descripcion: 'Equipo de desarrollo(Estudiante en TC'),
];
