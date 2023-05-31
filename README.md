# Pokedex

Criado um aplicativo Dart/Flutter utilizando a API pública POKEAPI para realizar a busca de Pokemons e apresentação na tela.

## Documentação

- Criado estutura inicial(Tela inicial e tela com detalhes);
- Criado repository com acesso ao POKEMON API;
- Bliblioteca de requisição utiliza foi o package http.

## Funcionalidades

Tela inicial:
Contem uma lista de 30 pokemons, mostrando nome e imagem em miniatura.

Ao tocar em um Pokémon da lista, o aplicativo navega para a tela de detalhes do Pokémon.

Tela de detalhes do Pokémon:

Exibe informações detalhadas sobre o Pokémon selecionado, como nome, tipos, número, peso, altura, habilidades e estatísticas.
Também é mostrado uma imagem do Pokémon em tamanho maior.

## Documentação da API

https://pokeapi.co/

## Melhorias

- Necessário realizar a paginação para buscar outros Pokemons. Ficou limitado em 30 pois com uma quantidade grande a rotorno da API fica muito lento;
- ALteração da cor baseado no tipo de pokemon na tela de detalhes de cada pokemon;
- Organizar repository;
- Organizar Style (Text e Colors);
- Acertar nomenclaturas de peso e altura
