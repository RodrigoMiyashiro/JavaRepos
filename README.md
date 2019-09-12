# JavaRepos
Repositórios Java - Lista os repositórios Java presentes no GitHub, a partir do mais popular.

Versão: 0.0.1<br>
Linguagem: Swift<br>

## Aplicativo

### 1 - Objetivo

Aplicativo consulta a API do GitHub para listar os repositórios Java mais popular.<br>

### 2 - Arquitetura

![alt text](https://blog.cleancoder.com/uncle-bob/images/2012-08-13-the-clean-architecture/CleanArchitecture.jpg)<br>
![alt text](https://herbertograca.files.wordpress.com/2018/11/070-explicit-architecture-svg.png)<br>
De forma bem resumida, está arquitetura foi pensada para criar um aplicativo inspirado no Clean Archicture. <br>
Contendo um Core, onde o conjunto de regras da aplicação fica disponível. Se eventualmente, precisar implementar
outra aplicação em Swift, o Core já estará pronto.<br>
Dentro da aplicação encontramos o Boundary, a Infrastructure e o Presentation.<br>
A Infrastructure é responsável por cuidar da camada externa da aplicação, como banco de
dados, serviços etc.<br> 
O Boundary é responsável por interligar as camadas externa com o Core.<br>
O Presentation cuida da apresentação das telas, da interação e de como os elementos visuais são montados.<br>
Os links para mais informações está presente nas referências.

### 3 - Libs

Segue a lista de libs usadas na atual versão do app:<br>
- **Kingfisher**: Biblioteca poderosa para baixar e armazenar em cache imagens da web. Muitos desenvolvedor contribuem com a melhoria e continuidade desta bibliote. Em relação a outra biblioteca popular o `SDWebImage`, o `Kingfisher` lida melhor com os avisos de memória. O `Kingfisher` foi criado em `Swift`;<br>
- **UIScrollView-InfiniteScroll**: Biblioteca simples para controlar o *scroll* inifinto.

### 4 - Melhorias

Algumas melhorias para fazer na próxima versão do app:<br>
- Ampliar os testes unitários e de UI;
- Trocar a dependência que cuida do *infinte scroll* ou criar algo similar e remover a dependência.

### 5 - Observações

Algumas observações referentes a está versão do app:<br>
- Há um *force cast* presente na classe `PullRequestSummaryDestination` apenas para forçar a existência da classe destino. Caso a classe destino, por algum motivo, não seja a esperada, a aplicação irá "quebrar", sinalizando ao desenvolvedor que há erros referentes a transição entre *views*. A ideia é informa ao desenvolvedor que há um erro e facilite a investigação. Algumas pessoas preferem não fazer esse *force cast*, no caso, está bem simples alterar e remover o *force cast*.

## Recursos

API GitHub<br>
https://developer.github.com

Lib Kingfisher<br>
https://github.com/onevcat/Kingfisher

Lib UIScrollView-InfiniteScroll<br>
https://github.com/pronebird/UIScrollView-InfiniteScroll

## Referências

herbertograca - DDD, Hexagonal, Onion, Clean, CQRS, … How I put it all together<br>
https://herbertograca.com/2017/11/16/explicit-architecture-01-ddd-hexagonal-onion-clean-cqrs-how-i-put-it-all-together/

Robert C Martin - Clean Archicture and Design<br>
https://www.youtube.com/watch?v=Nsjsiz2A9mg
https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
