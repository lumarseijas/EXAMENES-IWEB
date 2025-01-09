**PELÍCULAS**

1.4. Escriba el código de la vista que implementa la primera pantalla de la app. 
Esta vista debo mostrar un NavigationStack y una lista con la imagen y el nombre de todas las películas. 
La pantalla debe ser similar a la del ejemplo. 
Al pulsar sobre una película de la lista, la app debe navegar a una segunda pantalla, que desarrollaremos en la siguiente pregunta de este examen. 
1.5. Escriba el código de la segunda pantalla de la app. 
Debe mostrar "Responde:" como título de la pantalla, el nombre y la imagen de la película, la pregunta que se formula al usuario, y dos botones para que el usuario indique si la respuesta es Sí o No. 
Cuando el usuario pulse uno de los dos botones, debe mostrarse una alerta informando al usuario de si ha acertado o fallado la pregunta. 
Implemente la pantalla para que se ajuste a los diseños mostrados en las imágenes inferiores. 
1.6. Escriba los cambios que hay que realizar en la vista anterior para que al pulsa en cualquiera de los dos botones, la imagen de la película se presente casi sin color (saturación igual a 0.2). 
El color de la imagen debe restaurarse a su valor original cuando se oculte la alerta que aparece al pulsar los botones. 
El cambio de color debe realizarse usando una animación. 
•	La desaturación de la imagen se logra usando .saturation(). La saturación se cambia 0.2 cuando la alerta está activa y se restaura a 1 cuando desaparece. 
•	La animación se aplica con .animation() para suavizar la transición del cambio de color. 

**DICIEMBRE 2022 PARTIDOS**

Queremos desarrollar una app con SwiftUl para jugar a adivinar el resultado de los partidos de fútbol de las copas del mundo. Esta app debe descargar un JSON con los resultados de los partidos de un servidor web. La app mostrará una pantalla inicial con un listado de los partidos descargados. El usuario debe pulsar sobre uno de los partidos para pasar a una segunda pantalla donde jugará a adivinar quién ganó ese partido. 
La petición HTTP que hay que invocar para bajarse el JSON con la información de los partidos es de tipo GET y la URL es https://sitio.es/partidos.json. 
Donde: 
•	id: entero que identifica unívocamente a cada partido. Esta propiedad siempre está presente.  
•	phase: string que indica cuándo se jugó el partido. Esta propiedad siempre está presente. 
•	team1 y team2: objetos JSON con información sobre los dos equipos. 
o	name: string con el nombre del equipo. Esta propiedad siempre está presente. 
o	flag: URL de la imagen de la bandera del país. Esta propiedad puede no estar presente. 
•	winner: entero que vale 1 para indicar que el partido lo ganó el primer equipo, o 2 para indicar que lo ganó el segundo equipo. No hay empates. Esta propiedad siempre está presente. 
•	details: string describiendo el resultado del partido. Esta propiedad siempre está presente.

1.1. Se pide escribir una struct llamada MatchItem, que sea conforme con el protocolo Codable, y que sirva para decodificar los JSON descargados por la app. Esta estructura debe incluir todas las propiedades necesarias para representar un partido.
1.2. La app de la pregunta 1 usará como modelo una clase llamada MatchesModel, que debe derivar de ObservableObject. La clase MatchesModel debe: 
• tener y publicar una propiedad llamada matches de tipo MatchItem, donde se guardarán los datos del último partido descargado, y que será el que visualizará la vista de la app. 
• tener un método llamado download, usado para descargar un nuevo partido, y guardarlo en la propiedad matches anterior. 
Se pide escribir el código de la clase MatchesModel, con la propiedad matches y el método download. El método download se debe implementar usando uno de los métodos proporcionados por URLSession. Elija el método que prefiera. Este método debe programarse de forma que la app no se bloquee y funcione suavemente aunque haya problemas de red.
1.3. Vamos a modificar la clase MatchesModel desarrollada en el apartado anterior para añadir una propiedad MM llamada rightResponse, y un nuevo método check.
La propiedad llamada rightResponse, debe ser booleano. Si su valor es nil, indica que el usuario aún no ha pulsado ninguno de los dos botones asociados a los equipos del partido actual, si es true indica que el usuario acerto al pulsar el botón del equipo ganador, y si es false indica que el usuario pulso el botón del equipo perdedor. Esta propiedad debe publicarse para que la vista de la app se actualice cuando cambia de valor.
El método check se usa para comprobar si el usuario pulsó el botón correcto o no. Este método debe tomar dos parámetros:
•	el id del partido
•	el número 1 o 2 para indicar que el ganador del partido fue el equipo 1 o 2.
Este método debe hacer una petición HTTP de tipo GET a la url https://sitios.es/check?id=ID&winner=NUM, donde ID es el id del partido al que estamos jugando, y NUM es 1 o 2 para indicar cual es el equipo que creemos que ha ganado. La respuesta de esta petición es un objeto JSON con dos propiedades: el id del partido, y un booleano indicando si la respuesta es correcta o no. { "id": 1, "result": false }
1.4. Escriba el código de la primera pantalla de la app. Debe mostrar:
•	"Adivina el ganador" como título de la pantalla.
•	El título del partido (por ejemplo: "Octavos de final 2022").
•	Los nombres y las banderas de los dos equipos que participaron.
•	Dos botones para que el usuario elija uno de los equipos como ganador.
Suponga que el modelo MatchesModel se pasa a la vista en su environment.
Añada una alerta que indique si la respuesta introducida por el usuario es correcta o no.


**JUNIO 2024**

Queremos desarrollar una app SwiftUl para jugar a responder preguntas sobre un determinado libro. 
La app debe mostrar una pantalla inicial con una lista de libros. Entonces, el usuario debe pulsar sobre un libro de la lista, pasando a una segunda pantalla donde se mostrará la pregunta a contestar. La segunda pantalla mostrará un texto con la pregunta, y dos botones para las respuestas. El usuario debe pulsar uno de los dos botones, y la app informará de si la respuesta fue correcta o no. Las imágenes de la derecha muestran estas pantallas 
Antes de empezar a jugar, la app debe descargar un JSON con las preguntas del juego. Debe hacer una petición HTTP a la url https://ibros.core.upm.es usando el método GET.
Donde: 
•	Id: entero que identifica unívocamente a cada pregunta. 
•	book: string con el título del libro 
•	question: string con la pregunta  
•	answer1: datos de una de las posibles respuestas 
o	answer: string con el texto de la respuesta 1 
o	photo: URL de la imagen que ilustra la respuesta 1 
•	 answer2: datos de una de las posibles respuestas 
o	answer: string con el texto de la respuesta 2 
o	photo: URL de la imagen que ilustra la respuesta 2 
•	solution: entero 1 ó 2 indicando cual es la respuesta correcta. 
1.1. Se pide escribir una struct llamada BookItem, que sea conforme con los protocolos Codable y Identificable y que sirva para descodificar el JSON descargado por la app. 
1.2. Implemente un model llamado BooksModel que permita gestionar las preguntas y respuestas del juego sobre libros. El modelo debe cumplir las siguientes especificaciones: 
1) Debe ser una clase conforme al protocolo Observable para que pueda integrarse con SwiftUI. 
2) Debe contener una propiedad que almacene un array de objetos, BookItem, que será utilizada por las vistas de la app para mostrar la lista de libros  y preguntas.  
3) Debe incluir un método llamado download que permita descargar las preguntas desde un servidor remoto. este metodo debe: 
-Realizar una petición HTTP GET a la URL https://ibros.core.upm.es  
para obtener un JSON con las preguntas. 
-Decodificar el JSON recibido en un array de objetos BookItem. 
-Actualizar la propiedad publicada con los datos descargados 
4) Manejar errores si ocurre un fallo 

1.3. Escriba el código que hay que añadir en el struct de la app para añadir una instancia del modelo BooksModel al environment de la app. Se pretende que una instancia esté disponible en todas las vistas de la app. 
1.4. Escriba el código de la vista que implementa la primera pantalla de la app. Esta debe contenter un NavigationStack y una lista con el nombre de todos los libros. La pantalla debe ser similar a la del ejemplo de la primera página de este examen. 
Al pulsar sobre un libro de la lista, la app debe navegar a una segunda pantalla que desarrollaremos en la siguiente pregunta de este examen. 
1.5. Escriba el código de la segunda pantalla de la app. Debe mostrar: 
- “Respuesta sobre:” como título de la pantalla 
- El nombre del libro 
-la pregunta que se formula al usuario 
-las imágenes de las dos respuestas propuestas 
-y dos botones para que el usuario elija una de las dos respuestas 
Cuando el usuario pulse uno de los dos botones debe mostrarse una alerta informando al usuario de si ha acertado o fallado la pregunta. 
Implemente la pantalla para que se adjunte el diseño mostrado en la imagen. 

**JUNIO 2022**

Suponga que queremos desarrollar una aplicación SwiftUl que descargue quizzes de uno en uno, y permita jugar a adivinarlos. Esta app tendrá una única vista donde se muestra el quiz al que se está jugando en cada momento. El usuario escribirá la respuesta en el campo de texto, y pulsará el botón Comprobar para ver si su respuesta es correcta o no. 
Para descargar cada uno de los quizzes con los que se va a jugar, hay que hacer una petición HTTP a la url https:/core.dit.upm.es/api/ quizzes/random?token=1234 usando el método GET. Esta petición devuelve un objeto JSON que tiene las siguientes propiedades:  
1. id: es un entero que identifica unívocamente al quiz. Esta propiedad siempre estará presente en todos los JSON. 
2. question: es un string con el texto de la pregunta. Está propiedad siempre está presente en el JSON. 
3. author: es un objeto JSON anidado con información sobre el autor del quiz, y que puede no estar presente en algunos de los objetos JSON, es decir, es opcional. Este objeto tiene las siguientes propiedades: 
  1. username: un string con el nombre del autor. Está propiedad siempre está presente. 
  2. photo: un URL con la dirección da la fotografía del autor. Está propiedad puede no estar presente, es decir, es opcional. 
4. attachment un URL con la dirección de la fotografía que ilustra el quiz. Está propiedad puede no estar presente, es decir, es opcional. 

1.1. Se pide escribir una struct llamada QuizItem, que sea conforme con el protocolo Codable, y que sirva para decodificar los JSON descargados por la app.
1.2. Implemente un modelo llamado QuizModel que permita gestionar los datos del quiz descargado desde el servidor.
