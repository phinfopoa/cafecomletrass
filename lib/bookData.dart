class Book {
  final String title;
  final String author;
  final String imagePath;
  final String categorie;

  Book({
    required this.title,
    required this.author,
    required this.imagePath,
    required this.categorie,
  });
}

final List<Book> books = [
  Book(
    title: 'Dom Casmurro',
    author: 'Machado de Assis',
    imagePath: 'assets/books/domcasmurro.png', // Adicione a imagem ao seu projeto
    categorie: 'Romance',
  ),

   Book(
    title: 'It a Coisa',
    author: 'Stephen King',
    imagePath: 'assets/books/itacoisa.png', // Adicione a imagem ao seu projeto
    categorie: 'Terror',
  ),

   Book(
    title: 'Harry Potter e a Pedra Filosofal',
    author: 'J. K. Rowling',
    imagePath: 'assets/books/pedrafilosofal.png', // Adicione a imagem ao seu projeto
    categorie: 'Aventura',
  ),
  // Adicione mais livros aqui
];
