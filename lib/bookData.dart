class Book {
  final String title;
  final String author;
  final String imagePath;
  final String categorie;
  final String synopsis; // Adicione a sinopse

  Book({
    required this.title,
    required this.author,
    required this.imagePath,
    required this.categorie,
    required this.synopsis, // Inicialize a sinopse
  });
}

// Atualize a lista de livros para incluir sinopses
final List<Book> books = [
  Book(
    title: 'Dom Casmurro',
    author: 'Machado de Assis',
    imagePath: 'assets/books/domcasmurro.png',
    categorie: 'Romance',
    synopsis: 'Sinopse de Dom Casmurro aqui...',
  ),
  Book(
    title: 'It a Coisa',
    author: 'Stephen King',
    imagePath: 'assets/books/itacoisa.png',
    categorie: 'Terror',
    synopsis: 'Sinopse de It a Coisa aqui...',
  ),
  Book(
    title: 'Harry Potter e a Pedra Filosofal',
    author: 'J. K. Rowling',
    imagePath: 'assets/books/pedrafilosofal.png',
    categorie: 'Aventura',
    synopsis: 'Sinopse de Harry Potter e a Pedra Filosofal aqui...',
  ),
  // Adicione mais livros aqui
];
