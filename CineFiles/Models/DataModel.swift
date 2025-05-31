import Foundation

class DataModel {
    let movies: [MovieModel] = [
        MovieModel(
            posterImage: "poster1",
            title: "Tudo em Todo o Lugar ao Mesmo Tempo",
            synopsis: "Uma imigrante chinesa de meia idade se envolve em uma aventura louca, onde só ela pode salvar o mundo explorando outros universos que se conectam com as vidas que ela poderia ter levado",
            director: "Daniel Kwan, Daniel Scheinert",
            screenWriters: "Daniel Kwan, Daniel Scheinert",
            releaseYear: "2022"
        ),
        MovieModel(
            posterImage: "poster2",
            title: "Cisne Negro",
            synopsis: "Uma esforçada bailarina luta para manter sua sanidade após obter o papel principal no Lago dos Cisnes de Tchaikovsky.",
            director: "Darren Aronofsky",
            screenWriters: "Mark Heyman, Andres Heinz, John J. McLaughlin",
            releaseYear: "2010"
        ),
        MovieModel(
            posterImage: "poster3",
            title: "Barbie: A Princesa e a Plebeia",
            synopsis: "Uma plebeia, moradora de um vilarejo, é muito parecida com a princesa do reino. Os destinos das duas se cruzam quando a princesa é sequestrada, e a moça humilde usa sua incrível semelhança com ela para tentar salvar das mãos do vilão.",
            director: "William Lau",
            screenWriters: "Cliff Ruby, Elana Lesser, Ruth Handler",
            releaseYear: "2004"
        ),
        MovieModel(
            posterImage: "poster4",
            title: "Show de Truman: O Show da Vida",
            synopsis: "Truman Burbank é um pacato vendedor de seguros que leva uma vida simples com sua esposa Meryl Burbank. Porém, algumas coisas ao seu redor fazem com que ele passe a estranhar sua cidade, seus supostos amigos e até sua mulher. Após conhecer a misteriosa Lauren, ele fica intrigado e acaba descobrindo que toda sua vida foi monitorada por câmeras e transmitida em rede nacional.",
            director: "Peter Weir",
            screenWriters: "Peter Weir, Andrew Niccol",
            releaseYear: "1998"
        ),
        MovieModel(
            posterImage: "poster5",
            title: "Spirit: O Corcel Indomável",
            synopsis: "Animação sobre a amizade entre um menino indígena e um cavalo indomável apaixonado por uma égua. Ambientada no Velho Oeste americano, mostra o impacto do processo civilizatório na vida dos três e também na amizade que construíram.",
            director: "Kelly Asbury, Lorna Cook",
            screenWriters: "John Fusco",
            releaseYear: "2002"
        ),
        MovieModel(
            posterImage: "poster6",
            title: "Labirinto do Fauno",
            synopsis: "Em 1944, na Espanha, a jovem Ofélia e sua mãe doente chegam ao posto do novo marido de sua mãe, um sádico oficial do exército que está tentando reprimir uma guerrilheira. Enquanto explorava um labirinto antigo, Ofélia encontra o Pan fauno, que diz que a menina é uma lendária princesa perdida e que ela precisa completar três tarefas perigosas a fim de se tornar imortal.",
            director: "Guillermo del Toro",
            screenWriters: "Guillermo del Toro",
            releaseYear: "2006"
        ),
        MovieModel(
            posterImage: "poster7",
            title: "O Predestinado",
            synopsis: "Um agente precisa viajar no tempo para impedir a ação de um criminoso responsável por um ataque que mata milhares de pessoas.",
            director: "Michael Spierig, Peter Spierig",
            screenWriters: "Michael Spierig, Peter Spierig, Robert A Heinlein (autor da obra original)",
            releaseYear: "2015"
        ),
        MovieModel(
            posterImage: "poster8",
            title: "Gigantes de Aço",
            synopsis: "Em um futuro próximo, as máquinas substituem os homens no ringue. As lutas de boxe acontecem entre robôs de alta tecnologia. Charlie, um ex-lutador frustrado, decide se juntar ao filho para construir um competidor imbatível.",
            director: "Shawn Levy",
            screenWriters: "Dan Gilroy, Les Bohem, Jeremy Leven, John Gatins, Richard Matheson (autor da obra original)",
            releaseYear: "2011"
        ),
        MovieModel(
            posterImage: "poster9",
            title: "A Vastidão da Noite",
            synopsis: "Duas crianças procuram a fonte de uma misteriosa frequência que surgiu em sua cidade.",
            director: "Andrew Patterson",
            screenWriters: "James Montague, Craig W. Sanger",
            releaseYear: "2019"
        ),
        MovieModel(
            posterImage: "poster10",
            title: "Parasita",
            synopsis: "Toda a família de Ki-taek está desempregada, vivendo em um porão sujo e apertado. Por obra do acaso, ele começa a dar aulas de inglês para uma garota de família rica. Fascinados com a vida luxuosa destas pessoas, pai, mãe e filhos bolam um plano para se infiltrar também na abastada família, um a um. No entanto, os segredos e mentiras necessários à ascensão social cobram o seu preço.",
            director: "Bong Joon-ho",
            screenWriters: "Bong Joon-ho, Jin Won Han",
            releaseYear: "2019"
        ),
        MovieModel(
            posterImage: "poster11",
            title: "Passivonas",
            synopsis: "Duass alunas não populares do último ano do ensino médio criam um clube da luta para tentar impressionar e conquistar líderes de torcida.",
            director: "Emma Seligman",
            screenWriters: "Emma Seligman, Rachel Sennott",
            releaseYear: "2023"
        ),
        MovieModel(
            posterImage: "poster12",
            title: "Turma da Mônica: Uma Aventura no Tempo",
            synopsis: "Franjinha está construindo uma máquina do tempo e precisa reunir moléculas dos quatro elementos: ar, água, fogo e terra. Mônica joga Sansão e, sem querer, acerta o aparelho, espalhando os elementos. Agora a turma precisa consertá-la.",
            director: "Mauricio de Sousa",
            screenWriters: "Mauricio de Sousa, Flávio de Souza, Didi Oliveira, Emerson Bernardo de Abreu",
            releaseYear: "2007"
        ),
        MovieModel(
            posterImage: "poster13",
            title: "Amnésia (Memento)",
            synopsis: "Leonard está caçando o homem que estuprou e matou sua esposa. Ele tem dificuldades em encontrar o assassino pois sofre de uma forma intratável de perda de memória. Mesmo que ele possa lembrar detalhes da vida antes do acidente, Leonard não consegue lembrar o que aconteceu quinze minutos atrás, onde está indo ou a razão.",
            director: "Christopher Nolan",
            screenWriters: "Christopher Nolan, Jonathan Nolan",
            releaseYear: "2001"
        ),
        MovieModel(
            posterImage: "poster14",
            title: "Os Excêntricos Tenenbaums",
            synopsis: "Royal e sua esposa Etheline tiveram três filhos muito diferentes entre si, mas igualmente bem-sucedidos. Quando Etheline resolve se casar com outro, o irresponsável e excêntrico Royal resolve lutar por seu amor reunindo toda a família.",
            director: "Wes Anderson",
            screenWriters: "Wes Anderson, Owen Wilson",
            releaseYear: "2002"
        ),
        MovieModel(
            posterImage: "poster15",
            title: "La La Land",
            synopsis: "O pianista Sebastian conhece a atriz Mia, e os dois se apaixonam perdidamente. Em busca de oportunidades para suas carreiras na competitiva Los Angeles, os jovens tentam fazer o relacionamento amoroso dar certo, enquanto perseguem fama e sucesso.",
            director: "Damien Chazelle",
            screenWriters: "Damien Chazelle",
            releaseYear: "2017"
        ),
        MovieModel(
            posterImage: "poster16",
            title: "Os Serviços de Entrega da Kiki",
            synopsis: "Por ordem de sua mãe, Kiki parte para um aprendizado de um ano, acompanhada por seu gato preto. A um comando de sua vassoura mágica, ela vai parar na charmosa cidadezinha de Moreoastal. Infelizmente, os hotéis locais não aceitam bruxas e a polícia a flagra fazendo algumas travessuras.",
            director: "Hayao Miyazaki",
            screenWriters: "Hayao Miyazaki, Jack Fletcher, John Semper",
            releaseYear: "1990"
        ),
        MovieModel(
            posterImage: "poster17",
            title: "O Feitiço de Áquila",
            synopsis: "O ladrão Gaston escapa da masmorra medieval de Aquila através da latrina. Os soldados estão prestes a matá-lo quando Navarra o salva. Navarra, viajando com seu falcão animado, planeja matar o bispo de Áquila com a ajuda de Gaston.",
            director: "Richard Donner",
            screenWriters: "Michael Thomas, Tom Mankiewicz",
            releaseYear: "1985"
        ),
        MovieModel(
            posterImage: "poster18",
            title: "Os Incríveis",
            synopsis: "Depois do governo banir o uso de superpoderes, o maior herói do planeta, o Sr. Incrível, vive de forma pacata com sua família. Apesar de estar feliz com a vida doméstica, o Sr. Incrível ainda sente falta dos tempos em que viveu como super-herói, e sua grande chance de entrar em ação novamente surge quando um velho inimigo volta a atacar. Só que agora ele precisa contar com a ajuda de toda a família para vencer o vilão.",
            director: "Brad Bird",
            screenWriters: "Brad Bird",
            releaseYear: "2004"
        )
    ]
}
