class Book {
  final String title;
  final String author;
  final String imagePath;
  final String categorie;
  final String synopsis;
  // Define a classe 'Book' com propriedades para título, autor, caminho da imagem, categoria e sinopse.

  Book({
    required this.title,
    required this.author,
    required this.imagePath,
    required this.categorie,
    required this.synopsis,
  });
  // Construtor para  propriedades com valores obrigatórios.
}

final List<Book> books = [
  Book(
    title: 'Dom Casmurro',
    author: 'Machado de Assis',
    imagePath: 'assets/books/domcasmurro.png',
    categorie: 'Romance',
    synopsis:
        'Dom Casmurro, de Machado de Assis, é um romance clássico da literatura brasileira que narra a vida de Bento Santiago, conhecido como Bentinho. Desde a infância, Bentinho vive uma história de amor com sua vizinha Capitu, uma garota de olhos enigmáticos. Prometido ao seminário por sua mãe, Bentinho enfrenta obstáculos para viver seu amor. Anos depois, casados, Bentinho é consumido pelo ciúme e desconfia da traição de Capitu com seu melhor amigo, Escobar. A narrativa introspectiva e ambígua de Bentinho leva o leitor a questionar a veracidade dos eventos e a verdadeira natureza dos personagens, fazendo de Dom Casmurro uma obra-prima sobre o ciúme e a dúvida.',
  ),
  // Adiciona um livro com detalhes específicos para 'Dom Casmurro'.

  Book(
    title: 'IT: A Coisa',
    author: 'Stephen King',
    imagePath: 'assets/books/itacoisa.png',
    categorie: 'Terror',
    synopsis:
        'IT: A Coisa, de Stephen King, é um romance de terror que se passa na pequena cidade de Derry, Maine, onde um grupo de sete crianças, conhecido como o Clube dos Otários, enfrenta um ser malévolo que assume a forma de um palhaço chamado Pennywise. A história alterna entre dois períodos, 1958 e 1985, quando os mesmos personagens, agora adultos, retornam à sua cidade natal para combater a entidade maligna mais uma vez. Pennywise, que emerge a cada 27 anos para se alimentar do medo das crianças, cria uma série de eventos aterrorizantes e inexplicáveis. A narrativa explora temas de amizade, coragem e a luta entre o bem e o mal, enquanto os membros do Clube dos Otários enfrentam seus piores medos para derrotar a Coisa de uma vez por todas.',
  ),
  // Adiciona um livro com detalhes específicos para 'IT: A Coisa'.

  Book(
    title: 'Harry Potter e a Pedra Filosofal',
    author: 'J. K. Rowling',
    imagePath: 'assets/books/pedrafilosofal.png',
    categorie: 'Aventura',
    synopsis:
        'Harry Potter e a Pedra Filosofal, de J.K. Rowling, é o primeiro livro da série Harry Potter. Ele conta a história de um garoto órfão de 11 anos que descobre ser um bruxo e é convidado a estudar na Escola de Magia e Bruxaria de Hogwarts. Harry é famoso no mundo bruxo por ter sobrevivido a um ataque do poderoso bruxo das trevas Voldemort quando era bebê. Na escola, ele faz amigos leais como Hermione Granger e Ron Weasley, e enfrenta desafios mágicos. Juntos, eles descobrem os segredos da Pedra Filosofal, um objeto lendário que confere imortalidade, e enfrentam o retorno iminente de Voldemort. O livro é uma introdução encantadora ao mundo mágico de Hogwarts, cheio de aventuras, mistérios e lições sobre amizade e coragem.',
  ),
  // Adiciona um livro com detalhes específicos para 'Harry Potter e a Pedra Filosofal'.

  Book(
      title: 'Frankenstein',
      author: 'Mary Shelley',
      imagePath: 'assets/books/frank.png',
      categorie: 'Terror',
      synopsis:
          'Frankenstein, de Mary Shelley, é um romance gótico que conta a história de Victor Frankenstein, um jovem cientista que, obcecado pelo desejo de criar vida, constrói uma criatura a partir de partes de corpos mortos. No entanto, a experiência dá errado e a criatura se torna um ser monstruoso, rejeitado e isolado, que busca vingança contra seu criador e a sociedade que o excluiu. A obra explora temas de ambição desmedida, responsabilidade moral e as consequências da interferência humana na natureza. A busca de Victor por redenção e a luta da criatura por aceitação revelam os horrores e as complexidades da criação e da rejeição.'),
  // Adiciona um livro com detalhes específicos para 'Frankenstein'.
];
