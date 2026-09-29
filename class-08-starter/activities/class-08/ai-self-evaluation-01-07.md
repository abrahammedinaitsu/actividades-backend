# Autoevaluación asistida por IA — checkpoint 1-7

Guarda aquí la salida COMPLETA y SIN EDITAR de tu única ejecución del
prompt ITSU-CHECKPOINT-01-07-1.0.

> Este reporte es un insumo de la evaluación del curso: el docente lo
> revisa junto con tu evidencia y puede verificarlo oralmente. Si no
> estás de acuerdo con algo, cuestiónalo con argumentos en la
> metacognición.

## Metadata de mi ejecución

* Modelo utilizado: gemini
* Fecha: 29/09/2026
* Commit evaluado: [COMPLETAR]
* ¿Necesité el prompt de reparación?: [no / sí, una vez / MODEL_FORMAT_FAILURE]

## BLOQUE 1 — RESULT_CODE

ITSU-KNOWLEDGE|V=1.0|R=BACKEND-01-07-K1|C01=1|C02=2|C03=3|C04=3|C05=3|C06=3|C07=2|ACTION=SUPPORT

## BLOQUE 2 — JSON

```
{
  "resultCode": "ITSU-KNOWLEDGE|V=1.0|R=BACKEND-01-07-K1|C01=1|C02=2|C03=3|C04=3|C05=3|C06=3|C07=2|ACTION=SUPPORT",
  "studentId": "abraham",
  "action": "SUPPORT",
  "signals": ["NONE"],
  "classes": [
    {
      "classId": "01",
      "level": 1,
      "question": "Describe el viaje completo que realiza la petición desde que el usuario hace clic o ingresa la URL hasta que ve la información en pantalla, detallando qué ocurre en la red, en el servidor backend y de vuelta en el cliente.",
      "evidence": "al cliente darle click a la url esa peiticion llega a servidor donde esta alojada esa base de datos si el servidor esta encendido muestra la pagina completa"
    },
    {
      "classId": "02",
      "level": 2,
      "question": "En nuestra API de solicitudes, cuando un cliente necesita actualizar los datos de una solicitud existente (por ejemplo, cambiar su descripción o su estado), enviamos cierta información. ¿Dónde debe viajar cada dato en la petición HTTP —entre el path, la query, el body y los headers— y por qué elegimos cada lugar según el tipo de información?",
      "evidence": "si acepta ignora silenciosamente la peticion y si la rechaza manda un error 404"
    },
    {
      "classId": "03",
      "level": 3,
      "question": "En la API de solicitudes, una solicitud pasa por distintos estados a lo largo de su ciclo de vida (por ejemplo, de DRAFT a SUBMITTED, o de SUBMITTED a APPROVED). ¿Qué diferencia existe entre un error 400 (dato inválido), un 404 (no existe) y un 409 (incompatible con el estado) cuando un cliente intenta cambiar el estado de una solicitud, y por qué una transición de estado no permitida debe responder con 409?",
      "evidence": "un error 400 es para un dato inválido, un 404 es para un dato no existente y un 409 es para un dato incompatible con el estado... se cancela porque ya no quieres hacer esa solicitud ya que al eliminarla eliminaras todos los datos que tenga dentro de ella sin posibilidad de recuperar"
    },
    {
      "classId": "04",
      "level": 3,
      "question": "En el desarrollo de la API con PostgreSQL, utilizamos migraciones, seeds y transacciones. Explica cuál es la función específica de cada una en la base de datos y por qué una migración que ya fue aplicada en un entorno jamás debe editarse directamente.",
      "evidence": "Migraciones: Son scripts versionados DDL... Seeds: Son scripts encargados de poblar la base de datos... Transacciones: Son bloques de operaciones ejecutadas como una única unidad lógica... es importante para una mayor seguridad para evitar ataques de inyeccion de SQL... ejecuta un rollback"
    },
    {
      "classId": "05",
      "level": 3,
      "question": "En la API de solicitudes, la identidad del usuario se maneja mediante un token JWT. Explica la diferencia entre autenticación (401) y autorización (403), por qué el servidor debe derivar la identidad del usuario a partir del token y jamás de un parámetro en el body, y qué contiene un JWT por dentro.",
      "evidence": "401 el servidor sabe que estas mas no sabe quien eres... 403 el servidor te conoce pero no tienes permisos... 404 Not Found le dice al cliente: 'No tengo idea de qué estás hablando; aquí no hay nada'. y 403 Forbidden le dice al cliente: 'Sé exactamente lo que buscas y el recurso existe, pero tú no tienes permiso para verlo'."
    },
    {
      "classId": "06",
      "level": 3,
      "question": "En el proyecto del curso, la arquitectura está dividida en distintas capas (como routes, service, store, policy, mapper). Describe cuál es la responsabilidad específica de la capa service frente a la capa store, y explica brevemente cuáles son las tres partes o fases que componen una prueba unitaria o de integración (Arrange, Act, Assert).",
      "evidence": "La capa Service es responsable de la lógica de negocio, mientras que la capa Store es responsable de la persistencia de datos... La razón principal es garantizar que la prueba realmente está evaluando el error detectado y que el arreglo posterior es lo que verdaderamente lo soluciona."
    },
    {
      "classId": "07",
      "level": 2,
      "question": "Cuando ocurre una falla en el servidor en producción, se sigue un proceso ordenado para diagnosticarla (reporte, síntoma, hipótesis, evidencia, causa, corrección). ¿Por qué se debe buscar reproducir la falla antes de intentar corregirla en el código, y cuál es la diferencia entre un error esperado (de contrato) y un error inesperado (500) en términos de lo que se le devuelve al cliente frente a lo que se registra en los logs?",
      "evidence": "se debe buscar reproducirla para saber exatamente que es lo que la ocaciona para poder corregir la raiz del fallo... sirve para garantizar la estabilidad, la seguridad y la mantenibilidad de la aplicación."
    }
  ],
  "reviewTopics": [
    "Ciclo de vida de una petición HTTP (Cliente - Servidor - Base de Datos)",
    "Contratos HTTP e ignorar/rechazar campos no permitidos en el body",
    "Uso de Request ID y Middleware de errores centralizado"
  ],
  "teacherDigest": "El estudiante demuestra buena comprensión de conceptos de persistencia, autenticación y capas de servicio/store. Requiere reforzar la secuencia del viaje de una petición en red y el rol del Request ID en el diagnóstico de errores."
}
```

## BLOQUE 3 — Reporte del estudiante

Explicaste muy bien la distinción conceptual de códigos de estado HTTP (400, 404, 409), comprendes adecuadamente la división de responsabilidades entre la capa de negocio (service) y persistencia (store), así como la diferencia técnica entre autenticación (401) y autorización (403). Asimismo, fundamentaste correctamente la importancia de las pruebas que fallan antes de corregir una regresión y el uso de un rollback en transacciones.

Sin embargo, las repreguntas mostraron ciertos huecos en la precisión del flujo de red (confundir la llegada de la petición al servidor con un acceso directo a la base de datos), el manejo de campos adicionales en el body (asociar un rechazo con un 404 en lugar de un 400/422), y la función específica del Request ID en el rastreo de registros.

Temas prioritarios de repaso:

El viaje de una petición (Clase 1): Revisa el flujo desde la resolución DNS hasta el procesamiento en el Servidor Web/API y su posterior consulta a la BD. Encuéntralo en los diagramas de la Clase 1 del proyecto.

Contratos HTTP y payloads (Clase 2): Repasa la validación de esquemas e ignorado/rechazo de atributos no permitidos. Revisa las validaciones de entrada en los controladores/rutas del repositorio.

Diagnóstico y Request ID (Clase 7): Estudia el rol del Request ID para correlacionar solicitudes en los registros de log de producción. Revisa la implementación del error middleware en el servidor.

## BLOQUE 4 — Feedback docente

Prioridades transversales:
Conectar la teoría de red y contratos con los casos borde de implementación real (validación de campos inesperados y trazabilidad mediante logs).

Señales registradas:
NONE

Preguntas orales sugeridas de profundización:

Pregunta: Si un cliente envía un campo no permitido en el body de un PATCH, ¿por qué devolver un 404 es incorrecto según el contrato HTTP y qué código debería usarse en su lugar?
Respuesta esperada: 404 indica que la URL o el recurso no existe; para datos o parámetros de entrada mal estructurados o no permitidos en la petición se debe retornar 400 Bad Request o 422 Unprocessable Entity.

Pregunta: ¿Cómo ayuda un Request ID en el log cuando miles de usuarios hacen peticiones simultáneas a la API?
Respuesta esperada: Permite filtrar y rastrear en los logs la trazabilidad completa y secuencial de una sola petición específica sin mezclar sus eventos con las operaciones de otros usuarios.

Nivel de confianza del examen: ALTO
---

## Mi lectura del reporte (metacognición — esto SÍ lo escribes tú)

* ¿Estoy de acuerdo con el reporte?

  si, me parece justo de acuerdo con mis respuestas

* ¿Qué criterio considero incorrecto?

  criterio correctos pero preguntas habian preguntas que se me dificultaron y con ayuda de la IA las pude entender y responder 

* ¿Qué evidencia adicional aportaría?

  uso de preguntas mas concretas 

* ¿Qué recomendación voy a seguir?

  mas aprendizaje y lectura al contenido (disciplina)
