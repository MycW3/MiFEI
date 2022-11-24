class DondeEstoy {
  final String name;
  final String image;

  const DondeEstoy({required this.name, required this.image});

  static final List<DondeEstoy> listaDondeEstoy = [
    const DondeEstoy(name: 'Entrada', image: 'imagenEn'),
    const DondeEstoy(name: 'Biblioteca', image: 'imagenBi'),
    const DondeEstoy(name: 'Aula 106', image: 'imagen106')

  ];
}

class DondeVoy {
  final String name;
  final String image;

  const DondeVoy({required this.name, required this.image});

  static final List<DondeVoy> listaDondeVoy = [
    const DondeVoy(name: 'Aula 107', image: 'imagen107'),
    const DondeVoy(name: 'Aula 101', image: 'imagen101'),
    const DondeVoy(name: 'Biblioteca', image: 'imagen101'),
    const DondeVoy(name: 'Entrada', image: 'imagen101')
  ];
}

class Ruta {
  final String image;
  final String rutaEstoy;
  final String rutaVoy;

  const Ruta({required this.image, required this.rutaEstoy, required this.rutaVoy});

static final List<Ruta> listaRuta = [
  const Ruta(image: 'assets/images/Entrada-107.png', rutaEstoy: 'Entrada', rutaVoy: 'Aula 107'),
  const Ruta(image: 'assets/images/Biblioteca-101.png', rutaEstoy: 'Biblioteca', rutaVoy: 'Aula 101'),
  const Ruta(image: 'assets/images/Entrada-Biblioteca.png', rutaEstoy: 'Entrada', rutaVoy: 'Biblioteca'),
  const Ruta(image: 'assets/images/106-101.png', rutaEstoy: 'Aula 106', rutaVoy: 'Aula 101'),
  const Ruta(image: 'assets/images/Entrada-Biblioteca.png', rutaEstoy: 'Biblioteca', rutaVoy: 'Entrada'),

];  
}
