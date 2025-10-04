= Estado del Arte

== Introducción

Para esoablecer un fundamento sólido para esta investigación, es esencial realizar un análisis riguroso de la literatura existente. La metodología seleccionada para este fin es la revisión sistemática, un enfoque de investigación que utiliza métodos explícitos y sistemáticos para identificar, seleccionar y analizar críticamente la evidencia relevante sobre una pregunta de investigación claramente formulada @Higgins2024. A diferencia de las revisiones narrativas, este método busca minimizar el sesgo al emplear un proceso transparente y replicable.

La conducción de este estudio se guía por los principios metodológicos establecidos en el Manual Cochrane para Revisiones Sistemáticas de Intervenciones @Higgins2024. Este manual es considerado el estándar para la ejecución de este tipo de investigaciones, ya que proporciona un marco detallado para cada etapa del proceso, desde la formulación de las preguntas hasta la síntesis e interpretación de los hallazgos. La adhesión a esta guía garantiza el rigor y la solidez de las conclusiones presentadas en este capítulo.

== Objetivos de revisión 

El objetivo de esta revisión sistemática es realizar un análisis exhaustivo y crítico de la literatura existente sobre la implementación de modelos de paralelismo de alto nivel en lenguajes de programación de propósito general modernos. El propósito principal es comprender la brecha que existe entre los paradigmas de concurrencia nativos de estos lenguajes y las necesidades del cómputo de alto rendimiento, y cómo los enfoques declarativos, como el de OpenMP, buscan cerrarla.

Para cumplir con este objetivo, se llevará a cabo una revisión sistemática de la literatura del estado del arte disponible en bases de datos académicas, conferencias relevantes y repositorios. La revisión se centrará en recopilar información sobre los siguientes objetivos de revisión:

- Analizar las limitaciones de los modelos de concurrencia nativos en lenguajes modernos y los principios fundamentales de los paradigmas declarativos (como la separación de incumbencias) que buscan resolverlas.

- Examinar las propuestas de implementación existentes, con un enfoque en las arquitecturas de compilador (source-to-source) y librerías de runtime, y sintetizar los retos (sintácticos, semánticos y de rendimiento) reportados en la literatura. 

- Identificar las metodologías de evaluación (métricas y benchmarks) utilizadas para validar estas implementaciones y consolidar los beneficios reportados en términos de rendimiento, productividad y mantenibilidad del código.

== Preguntas de revisión

+ ¿Cuáles son las limitaciones de los lenguajes de propósito general modernos para problemas de paralelismo de cómputo intensivo?

+ ¿Qué principios y abstracciones fundamentales proveen los paradigmas de paralelismo declarativo para evitar la fricción semántico-sintáctica en lenguajes de propósito general modernos?

+ ¿Qué propuestas existen en la literatura para implementar paralelismo declarativo en lenguajes de propósito general modernos?

+ ¿Qué retos (sintácticos, semánticos, de compilación o de rendimiento) identifica la literatura al intentar implementar paradigmas de paralelismo de alto nivel en lenguajes de propósito general modernos?

+ ¿Qué conjunto de pruebas y métricas tanto de rendimiento como de expresividad se usan en la literatura para evaluar abstracciones de paralelismo de alto nivel en lenguajes de propósito general modernos?

+ ¿Qué beneficios y ventajas potenciales se identifican en la literatura al implementar estas abstracciones de paralelismo de alto nivel en lenguajes de propósito general modernos?

== Estrategia de búsqueda

=== Motores de búsqueda a usar

*Scopus*: Es una base de datos de resúmenes y citas de literatura científica revisada por pares, que abarca revistas, libros y actas de conferencias. Se caracteriza por su cobertura multidisciplinaria y por indexar trabajos de una gran diversidad de editoriales, siendo una herramienta fundamental para el análisis de citas y la investigación científica a gran escala.

*IEEE Xplore*: Es la biblioteca digital del Institute of Electrical and Electronics Engineers (IEEE), una fuente indispensable para el descubrimiento y acceso a literatura técnica en ingeniería eléctrica, ciencias de la computación y electrónica. Ofrece acceso a artículos de revistas, actas de conferencias y estándares técnicos de alta calidad que son fundamentales para la innovación y la investigación en tecnología.

=== Cadenas de búsqueda a usar

Para la construcción de las cadenas de búsqueda se utilizaron los siguientes keywords, agrupados por pilar conceptual, que se derivan de las preguntas de investigación:

- OMP4Py
- JOMP
- OpenMP
- MPI
- Zig
- Rust
- Python
- Java
- Go / Golang
- Modern programming language
- Pragma
- Directive
- Parallelism / Parallel
- HPC (High-Performance Computing)
- Compiler / Compiler extension
- Library
- Framework

A partir de los keywords definidos, se construyó una cadena de búsqueda unificada y adaptada a la sintaxis de cada motor de búsqueda seleccionado. En la tabla que se presenta a continuación, se muestran las cadenas finales utilizadas en cada plataforma.

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: center + horizon,
  stroke: 0.5pt,
  [Motor de búsqueda], [Cadena de búsqueda], [Cantidad de documentos],

  [Scopus],
  [_TITLE-ABS-KEY ( ( "OMP4Py" OR "JOMP" OR ( "Zig" AND "OpenMP" ) OR ( "Rust" AND "OpenMP" ) ) OR ( ( "Python" OR "Java" OR "Zig" OR "Rust" OR "Go" OR "Golang" OR "modern programming language" ) AND ( "pragma" OR "directive" OR "declarative" ) AND ( "parallelism" OR "parallel" OR "hpc" ) AND ( "pure implementation" OR "library" OR "compiler" OR "compiler extension" OR "framework" OR "prototype" OR "language support" OR "OpenMP" OR "MPI" ) AND NOT ( "GPU" OR "CUDA" OR "IO" OR "I/O" ) ) )_],
  [112],

  [IEEE Xplore],
  [_(("OMP4Py" OR "JOMP" OR ("Zig" AND "OpenMP") OR ("Rust" AND "OpenMP")) OR (("Python" OR "Java" OR "Zig" OR "Rust" OR "Go" OR "Golang" OR "modern programming language") AND ("pragma" OR "directive" OR "declarative") AND ("parallelism" OR "parallel" OR "hpc") AND ("pure implementation" OR "library" OR "compiler" OR "compiler extension" OR "framework" OR "prototype" OR "language support" OR "OpenMP" OR "MPI") AND NOT ("GPU" OR "CUDA" OR "IO" OR "I/O")))_],
  [27]
)

=== Criterios de inclusión y exclusión

==== Criterios de inclusión

- *Especificidad Temática*: Se incluirán estudios que propongan, implementen o analicen sistemas de paralelismo declarativo o basado en directivas, con un enfoque principal en modelos tipo OpenMP. Se considerarán trabajos aplicados a lenguajes de propósito general modernos (ej. Go, Rust, Zig, etc.) así como trabajos fundacionales en lenguajes de sistemas como C, C++ y Java, que son cruciales para entender la evolución del paradigma.

- *Enfoque de la Investigación*: Se priorizará investigaciones que detallan la arquitectura de compiladores (especialmente source-to-source), librerías de runtime, metodologías de implementación, o herramientas para el análisis de rendimiento de dichos paradigmas.

- *Ventana Temporal*: No se aplicará una ventana temporal estricta para permitir la inclusión de trabajos pioneros y seminales que establecieron las bases del área. Sin embargo, se dará prioridad a trabajos publicados en la última década que aborden los desafíos en lenguajes más modernos.

- *Literatura gris selecta*: Se incluirán trabajos de investigación no indexados de forma excepcional como "Diseño e implementación de funcionalidades OpenMP, basadas en modelos de concurrencia desarrollados en lenguaje Go" de Enrique Madridejos Zamorano, dada su relevancia como uno de los primeros trabajos documentados que abordan la implementación de un paradigma tipo OpenMP directamente en el ecosistema de Go.

- *Idioma*: Se incluirán estudios escritos en inglés y español, dado que son los idiomas predominantes en la literatura científica de esta área.

==== Criterios de exclusión

- *Enfoque Temático No Relacionado*: Se excluirán los estudios cuyo enfoque principal sea de un área diferente al de las ciencias de la computación o sistemas computacionales.

- *Enfoque centrado en GPUs y CUDA*: Se excluirán los artículos enfocados en el paralelismo masivo de datos de GPUs y CUDA por tratarse de un paradigma significativamente diferente al investigado.

- *Accesibilidad*: Se excluirán los trabajos cuyo texto completo no sea accesible a través de las bases de datos académicas o por medios públicos.

En la siguiente tabla, se puede observar la cantidad de documentos encontrados tras aplicar los criterios de inclusión y exclusión en cada motor de búsqueda independientemente.

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: center + horizon,
  stroke: 0.5pt,
  [Motor de búsqueda], [Cadena de búsqueda], [Cantidad de documentos],

  [Scopus],
  [_TITLE-ABS-KEY ( ( "OMP4Py" OR "JOMP" OR ( "Zig" AND "OpenMP" ) OR ( "Rust" AND "OpenMP" ) ) OR ( ( "Python" OR "Java" OR "Zig" OR "Rust" OR "Go" OR "Golang" OR "modern programming language" ) AND ( "pragma" OR "directive" OR "declarative" ) AND ( "parallelism" OR "parallel" OR "hpc" ) AND ( "pure implementation" OR "library" OR "compiler" OR "compiler extension" OR "framework" OR "prototype" OR "language support" OR "OpenMP" OR "MPI" ) AND NOT ( "GPU" OR "CUDA" OR "IO" OR "I/O" ) ) )_],
  [20],

  [IEEE Xplore],
  [_(("OMP4Py" OR "JOMP" OR ("Zig" AND "OpenMP") OR ("Rust" AND "OpenMP")) OR (("Python" OR "Java" OR "Zig" OR "Rust" OR "Go" OR "Golang" OR "modern programming language") AND ("pragma" OR "directive" OR "declarative") AND ("parallelism" OR "parallel" OR "hpc") AND ("pure implementation" OR "library" OR "compiler" OR "compiler extension" OR "framework" OR "prototype" OR "language support" OR "OpenMP" OR "MPI") AND NOT ("GPU" OR "CUDA" OR "IO" OR "I/O")))_],
  [7]
)

=== Documentos encontrados

Después de aplicar los criterios de inclusión y exclusión, y omitir los documentos duplicados en ambos motores de búsqueda, se seleccionaron 20 documentos cuyas referencias en APA se encuentran a continuación.

#let references = (
  
"Piñeiro, C., & Pichel, J. C. (2026). OMP4Py: A pure Python implementation of OpenMP. Future Generation Computer Systems, 175, Article 108035. https://doi.org/10.1016/j.future.2025.108035",

"Perugini, A., & Kosmidis, L. (2025). Evaluation of the parallel features of Rust for space systems. Open Access Series in Informatics (OASIcs), 127, 5:1-5:20. https://doi.org/10.4230/OASIcs.PARMA-DITAM.2025.5",

"Fan, W., He, T., Lai, L., Li, X., Li, Y., Li, Z., Qian, Z., Tian, C., Wang, L., Xu, J., Yao, Y., Yin, Q., Yu, W., Zhou, J., Zhu, D., & Zhu, R. (2021). GraphScope: A unified engine for big graph processing. Proceedings of the VLDB Endowment, 14(12), 2879–2892. https://doi.org/10.14778/3476311.3476369",

"Fan, X., Mehrabi, M., Sinnen, O., et al. (2017). Supporting enhanced exception handling with OpenMP in object-oriented languages. International Journal of Parallel Programming, 45, 1366–1389. https://doi.org/10.1007/s10766-016-0474-x",

"Yoshida, A., Kamiyama, A., & Oka, H. (2017). A task-driven parallel code generation scheme for coarse grain parallelization on Android platform. Journal of Information Processing, 25, 426–437. https://doi.org/10.2197/ipsjjip.25.426",

"Utting, M., Weng, M.-H., & Cleary, J. G. (2014). The JStar language philosophy. Parallel Computing, 40(2), 35–50. https://doi.org/10.1016/j.parco.2013.11.004",

"Vikas, Giacaman, N., & Sinnen, O. (2014). Multiprocessing with GUI-awareness using OpenMP-like directives in Java. Parallel Computing, 40(2), 69–89. https://doi.org/10.1016/j.parco.2013.11.005",

"Yoshida, A., Ochi, Y., & Yamanouchi, N. (2014). Parallel Java code generation for layer-unified coarse grain task parallel processing. IPSJ Online Transactions, 7, 168–178. https://doi.org/10.2197/ipsjtrans.7.168",

"Xiaowen, L. (2014). Research on multi-core PC parallel computation based on OpenMP. International Journal of Multimedia and Ubiquitous Engineering, 9(7), 131–140. https://doi.org/10.14257/ijmue.2014.9.7.12",

"Senghor, A., & Konate, K. (2012). A Java hybrid compiler for shared memory parallel programming. En 2012 13th International Conference on Parallel and Distributed Computing, Applications and Technologies (pp. 131-136). IEEE. https://doi.org/10.1109/PDCAT.2012.21",

"Kacs, D., Lee, J., Zarins, J., & Brown, N. (2024). Pragma driven shared memory parallelism in Zig by supporting OpenMP loop directives. En SC24-W: Workshops of the International Conference for High Performance Computing, Networking, Storage and Analysis (pp. 930-938). IEEE. https://doi.org/10.1109/SCW63240.2024.00132",

"Alexandrov, A., Krastev, G., & Markl, V. (2019). Representations and optimizations for embedded parallel dataflow languages. ACM Transactions on Database Systems, 44(1), Article 4. https://doi.org/10.1145/3281629",

"Fernandez, R. C., Garefalakis, P., & Pietzuch, P. (2016). Java2SDG: Stateful big data processing for the masses. En 2016 IEEE 32nd International Conference on Data Engineering (ICDE) (pp. 1390-1393). IEEE. https://doi.org/10.1109/ICDE.2016.7498352",

"Senghor, A., & Konate, K. (2012). Transforming an incorrectly synchronized parallel program into correctly synchronized and well optimized program. En 2012 2nd IEEE International Conference on Parallel, Distributed and Grid Computing (pp. 633-638). IEEE. https://doi.org/10.1109/PDGC.2012.6449894",

"Powers, F. E., Jr., & Alaghband, G. (2007). The Hydra parallel programming system. Concurrency and Computation: Practice and Experience, 20, 1–27. https://doi.org/10.1002/cpe.1205",

"Guitart, J., Torres, J., Ayguadé, E., & Bull, J. M. (2001). Performance analysis tools for parallel Java applications on shared-memory systems. En International Conference on Parallel Processing, 2001 (pp. 357-364). IEEE. https://doi.org/10.1109/ICPP.2001.952081",

"Kambites, M. E., Obdržálek, J., & Bull, J. M. (2001). An OpenMP-like interface for parallel programming in Java. Concurrency and Computation: Practice and Experience, 13, 793–814. https://doi.org/10.1002/cpe.579",

"Brunschen, C., & Brorsson, M. (2000). OdinMP/CCp—a portable implementation of OpenMP for C. Concurrency: Practice and Experience, 12(12), 1193–1203. https://doi.org/10.1002/1096-9128(200010)12:12<1193::AID-CPE527>3.0.CO;2-U",

"Ramirez, R., & Santosa, A. (2003). A methodology for concurrent and distributed Java applications. En Proceedings International Parallel and Distributed Processing Symposium. IEEE. https://doi.org/10.1109/IPDPS.2003.1213264",

"Madridejos Zamorano, E. (2015). Diseño e implementación de funcionalidades OpenMP, basadas en modelos de concurrencia desarrollados en lenguaje Go [Tesis de pregrado, Universidad Politécnica de Madrid]. Archivo Digital UPM. https://oa.upm.es/38324/"

)

#table(
  columns: (1fr, 6fr),
  inset: 10pt,
  align: top + left,
  stroke: 1pt,
  [Nro. de Artículo], [Referencia],
  ..for (idx,val) in references.enumerate(start: 1) {
    ([#idx],val)
  }
)

=== Formulario de extracción de datos

#table(
  columns: (1fr, 2fr, auto),
  inset: 10pt,
  align: center + horizon,
  stroke: 1pt,
  [Campo],[Descripción],[Pregunta],

  [N° de Artículo],[Identificador del artículo.],[General],

  [Título del artículo],[Título del artículo publicado.],[General],

  [Autor(es)],[Autor(es) o responsable(s) del artículo.],[General],

  [Año de publicación],[Año de publicación del artículo.],[General],

  [Idioma], [Idioma en el que se publicó el artículo], [General],

  [Base de datos], [Base de datos donde se encuentra o indexa el artículo], [General],

  [Abstracto], [Resumen del artículo.], [General],

  [Enlace de Consulta], [URL del artículo.], [General],

  [Limitaciones del Modelo Nativo],
  [Descripción de las debilidades o insuficiencias del modelo de concurrencia nativo de un lenguaje de propósito general moderno para el paralelismo de cómputo.],
  [P1],

  [Principios del Paradigma Declarativo],
  [Explicación de los mecanismos y abstracciones (ej. separación de incumbencias, gestión de datos) que el estudio describe para evitar la fricción semántico-sintáctica.],
  [P2],

  [Propuesta de Implementación],
  [Detalles sobre la arquitectura o procedimiento que el estudio propone para implementar un sistema de paralelismo declarativo.],
  [P3],

  [Lenguaje(s) Objetivo],
  [Lenguaje(s) de propósito general moderno a los que se aplica la propuesta.],
  [P3],

  [Retos Identificados],
  [Dificultades (sintácticas, semánticas, de compilación, de rendimiento) que el estudio identifica al implementar el nuevo paradigma.],
  [P4],

  [Metodología de Evaluación],
  [Descripción de los conjuntos de pruebas (benchmarks) y métricas (de rendimiento y/o expresividad) que el estudio utiliza para su evaluación.],
  [P5],

  [Beneficios Identificados],
  [Ventajas o mejoras (en productividad, mantenibilidad, escalabilidad, etc.) que el estudio reporta o sugiere al adoptar el nuevo paradigma en su implementación.],
  [P6],

  [Repositorios de implementación],
  [Colocar enlace del repositorio donde se encuentra el código de implementación si existe.],
  [General],

  [Comentarios],
  [Notas y comentarios en relación al artículo.],
  [General],

)

Este formulario se aplicó a cada uno de los artículos seleccionados para la revisión sistemática. El conjunto de datos completo y detallado, producto de esta fase de extracción, se encuentra disponible para su consulta en el Anexo D.

== Resultados de revisión

=== ¿Cuáles son las limitaciones de los lenguajes de propósito general modernos para problemas de paralelismo de cómputo intensivo?

La literatura identifica varias limitaciones clave en los lenguajes de propósito general modernos para el paralelismo de cómputo intensivo, las cuales se pueden agrupar en la complejidad de los modelos nativos, las carencias a nivel de lenguaje y ecosistema, y la incompatibilidad entre paradigmas de programación.

Una limitación recurrente es que las bibliotecas de concurrencia nativas, como los hilos de Java o pThreads, imponen una carga de complejidad significativa sobre el programador @Xiaowen2014 @Powers2007. La implementación manual del paralelismo es un proceso difícil y propenso a errores que a menudo requiere reestructuraciones considerables del código @Vikas2014. Modelos como Fork/Join en Java, aunque potentes, son difíciles de aplicar a cómputos científicos convencionales que no siguen un patrón de "divide y vencerás", especialmente al considerar las dependencias de datos @Yoshida2017. Incluso en un lenguaje diseñado para la concurrencia como Go, la implementación manual del paralelismo sigue siendo compleja, pues su modelo de goroutines no equivale directamente a un modelo de ejecución paralela @Madridejos2015.

Más allá de la complejidad, los lenguajes presentan carencias fundamentales. La limitación más crítica en Python es el Global Interpreter Lock (GIL), que impide la ejecución simultánea de hilos en código intensivo en CPU, neutralizando el beneficio del multihilo @Pineiro2026. Java, por su parte, presenta un alto costo en la creación y destrucción de hilos y carece de forma nativa de mecanismos de sincronización de alto rendimiento como las barreras rápidas @Kambites2001. En otros casos, el lenguaje simplemente carece por completo de soporte para paradigmas clave en HPC, como es el caso de Zig con el paralelismo dirigido por pragmas, lo que constituye una barrera para su adopción en esa comunidad @Kacs2024.

Finalmente, existen conflictos fundamentales entre los modelos de los lenguajes y los requisitos del paralelismo. Un ejemplo claro es el manejo de excepciones, cuyo diseño para un flujo de control único choca directamente con el modelo de ejecución paralela, llevando a que la especificación OpenMP prohíba construcciones intuitivas como un `try-catch` alrededor de una región paralela @Fan2017. De manera similar, las plataformas de big data como Spark o Flink imponen un modelo de programación funcional que es un obstáculo para la gran comunidad de desarrolladores de lenguajes imperativos @Fernandez2016. Este enfoque funcional también puede tratar las funciones de usuario como "cajas negras", lo que impide que el sistema aplique optimizaciones automáticas y delega esta responsabilidad en el programador @Alexandrov2019.

=== ¿Qué principios y abstracciones fundamentales proveen los paradigmas de paralelismo declarativo para evitar la fricción semántico-sintáctica en lenguajes de propósito general modernos?

Para evitar la fricción semántico-sintáctica en lenguajes modernos, los paradigmas de paralelismo declarativo se basan en tres principios fundamentales: una estricta separación de incumbencias, una integración idiomática que aprovecha las características del lenguaje anfitrión, y el uso de abstracciones de alto nivel que delegan la complejidad de la ejecución al sistema.

El principio más fundamental y recurrente es la separación de incumbencias (separation of concerns). Este enfoque permite que el desarrollador se concentre en la lógica secuencial del algoritmo (el "qué") sin entrelazarla con los detalles de la ejecución paralela (el "cómo"). El paralelismo se especifica como una capa ortogonal, permitiendo que el programa principal mantenga su estructura original @Ramirez2003 @Utting2014. El programador declara la intención de paralelizar, mientras que el sistema gestiona de forma transparente la creación de hilos, la sincronización y la planificación, separando así la especificación lógica de la ejecución física @Fan2021 @Yoshida2017.

Para evitar la fricción sintáctica, estos paradigmas se integran en el lenguaje de forma natural y poco intrusiva. Las estrategias clave incluyen:

- Uso de directivas en comentarios o pragmas: Un enfoque clásico, popularizado por OpenMP, es implementar las directivas como comentarios (ej. \/\/omp) o pragmas que son ignorados por los compiladores estándar @Vikas2014 @Kambites2001. Esto asegura que el código siga siendo una extensión no fundamental del lenguaje y mantenga su compilación y ejecución secuencial, facilitando la portabilidad y el desarrollo incremental @Brunschen2000.

- Aprovechamiento de la sintaxis nativa: Los enfoques más modernos utilizan características idiomáticas del propio lenguaje para una integración más fluida. Esto incluye el uso de decoradores y gestores de contexto en Python @Pineiro2026, anotaciones en Java @Fernandez2016, o la simple sustitución de iteradores estándar por sus equivalentes paralelos en Rust @Perugini2025.

Para evitar la fricción semántica, el paradigma reemplaza la gestión manual y de bajo nivel de hilos por abstracciones de alto nivel. En lugar de manejar hilos directamente, el programador trabaja con conceptos como:

- Iteradores paralelos que se encargan de la partición de datos @Perugini2025.
- Cláusulas declarativas que definen el alcance de los datos (private, reduction) y las estrategias de planificación (schedule) @Xiaowen2014.
- Unidades de trabajo atómicas o dependencias de datos entre tareas @Powers2007 @Yoshida2017.

Mediante estas abstracciones, la responsabilidad de la implementación compleja, como la división de la carga de trabajo, la planificación de hilos y la sincronización, se delega completamente a la biblioteca o al runtime, simplificando drásticamente el modelo mental del programador @Perugini2025.

=== ¿Qué propuestas existen en la literatura para implementar paralelismo declarativo en lenguajes de propósito general modernos?

La literatura documenta un espectro diverso de arquitecturas para implementar paralelismo declarativo en lenguajes modernos, aunque la estrategia predominante ha sido la de los traductores de código fuente a fuente (source-to-source). Este enfoque consiste en un preprocesador o un compilador que transforma el código anotado con directivas en código concurrente nativo del lenguaje anfitrión, el cual a su vez invoca una librería de runtime para la gestión de hilos y la sincronización. Propuestas fundacionales como OdinMP/CCp para C (Brunschen & Brorsson, 2000) y JOMP para Java @Kambites2001 establecieron este patrón canónico. OdinMP/CCp traduce las directivas OpenMP a código C que utiliza pthreads, extrayendo las regiones paralelas a una función centralizada. De manera análoga, JOMP convierte las directivas en código Java que instancia clases internas para encapsular las regiones paralelas, delegando la ejecución a su librería de runtime. Este modelo ha demostrado ser adaptable y persistente, evolucionando para aplicarse a lenguajes más recientes.

Un ejemplo notable de esta adaptación es la tesis de Madridejos Zamorano @Madridejos2015, que presenta uno de los primeros prototipos para Go. Su sistema utiliza un preprocesador externo llamado "goprep" para analizar el código fuente y transformar las directivas, especificadas como comentarios (\/\/pragma gomp), en código concurrente que emplea las primitivas idiomáticas de Go: goroutines para la ejecución y channels para la sincronización y comunicación @Madridejos2015. De forma similar, la implementación para Zig de Kacs et al. @Kacs2024 se basa en un preprocesador integrado en el proceso de compilación. Este reescribe el código mediante la técnica de "function outlining" para extraer las regiones paralelas y las convierte en llamadas directas al runtime de OpenMP de LLVM, demostrando una integración más profunda con las cadenas de herramientas existentes. En el ecosistema de Python, OMP4Py @Pineiro2026 moderniza este enfoque utilizando características idiomáticas del lenguaje, como decoradores y la manipulación directa del Árbol de Sintaxis Abstracta (AST), para lograr la transformación de manera más elegante y menos intrusiva.

Más allá de los preprocesadores, la literatura explora arquitecturas alternativas que buscan una integración más profunda o dinámica. Hydra @Powers2007 representa una desviación significativa de este modelo al proponer un sistema para Java basado en anotaciones y una recompilación en tiempo de ejecución (runtime). En lugar de una traducción estática, Hydra analiza el bytecode anotado en el momento de la carga y lo recompila para generar código paralelo adaptado específicamente a la arquitectura de hardware subyacente. Un enfoque aún más abstracto es el propuesto por Ramirez & Santosa @Ramirez2003, quienes describen una metodología donde la coordinación no se basa en directivas, sino en un "almacén de restricciones" externo y un lenguaje lógico que define las relaciones temporales entre eventos del programa, logrando una separación casi total entre la lógica funcional y la de concurrencia.

=== ¿Qué retos (sintácticos, semánticos, de compilación o de rendimiento) identifica la literatura al intentar implementar paradigmas de paralelismo de alto nivel en lenguajes de propósito general modernos?

La literatura identifica un conjunto consistente y multifacético de retos al intentar implementar paradigmas de paralelismo de alto nivel en lenguajes modernos, que van desde dificultades técnicas en la compilación hasta profundas incompatibilidades semánticas con las características del lenguaje anfitrión. A nivel semántico y de lenguaje, uno de los desafíos más fundamentales es la adaptación de un estándar como OpenMP, con raíces en C y Fortran, a lenguajes de más alto nivel que no exponen primitivas de bajo nivel. Por ejemplo, lenguajes como Java carecen de acceso directo a instrucciones de hardware, lo que impide una implementación eficiente de directivas como atomic o flush con la semántica de rendimiento que se espera de ellas @Kambites2001. Este problema persiste en lenguajes modernos; en Zig, las operaciones atómicas nativas no soportan la multiplicación, lo que obliga a los desarrolladores a implementar manualmente la cláusula reduction para este operador @Kacs2024. Quizás el reto semántico más complejo es el manejo de excepciones, cuyo modelo de flujo de control único es inherentemente incompatible con la ejecución paralela de múltiples hilos @Kambites2001. La necesidad de proponer nuevos conceptos para gestionar la propagación y sincronización de excepciones en un entorno paralelo es tan significativa que ha sido objeto de investigaciones dedicadas @Fan2017. Además, algunos lenguajes presentan barreras intrínsecas, siendo el caso más notable el Global Interpreter Lock (GIL) en Python, que impide la ejecución simultánea de hilos en código intensivo en CPU y neutraliza en gran medida el beneficio del paralelismo multihilo @Pineiro2026.

Desde la perspectiva de la compilación y las herramientas, el principal obstáculo técnico es a menudo la imposibilidad de modificar directamente el Árbol de Sintaxis Abstracta (AST) de un compilador, como se documentó en el caso de Zig, lo que obliga a recurrir a un enfoque de preprocesador @Kacs2024. Este enfoque alternativo, sin embargo, introduce su propio reto: la falta de contexto semántico. Al operar antes que el compilador principal, el preprocesador no tiene acceso a información de tipos completa, lo que dificulta la reescritura de código y la gestión de variables, como se evidenció en la propuesta para Go, donde el sistema tenía problemas para reconocer variables declaradas con inferencia de tipo @Madridejos2015 @Kacs2024.

En el ámbito del rendimiento, los desafíos van más allá de la simple paralelización del trabajo. La literatura reporta que la eficiencia es muy sensible al algoritmo de reparto de trabajo (scheduling), demostrando que no existe una única estrategia que sea óptima para todos los tipos de problemas @Madridejos2015. Otros retos de rendimiento incluyen el alto costo de arranque (startup overhead) que pueden introducir los sistemas con análisis o compilación en tiempo de ejecución, como se observó en el sistema Hydra @Powers2007. Asimismo, el rendimiento puede ser afectado de manera impredecible por las políticas de planificación de hilos del sistema operativo subyacente @Brunschen2000. Finalmente, surgen retos de integración al intentar que el modelo de paralelismo coexista con otros sistemas de hilos, como el modelo de despacho de eventos de las interfaces gráficas (GUI), que requiere un manejo especial para evitar interbloqueos y garantizar la capacidad de respuesta de la aplicación @Vikas2014.

=== ¿Qué conjunto de pruebas y métricas tanto de rendimiento como de expresividad se usan en la literatura para evaluar abstracciones de paralelismo de alto nivel en lenguajes de propósito general modernos?

Para evaluar abstracciones de paralelismo de alto nivel, la literatura utiliza una combinación de conjuntos de pruebas estandarizadas, algoritmos clásicos y aplicaciones del mundo real, junto con un conjunto consistente de métricas cuantitativas de rendimiento y cualitativas de expresividad.

La selección de benchmarks se divide principalmente en tres categorías:

- Algoritmos Numéricos y de Computación Científica: Esta es la categoría más común. Se emplean suites de benchmarks estandarizadas como NAS Parallel Benchmarks (NPB) @Kacs2024 y Java Grande Forum Benchmark Suite @Yoshida2017 @Vikas2014. Además, es frecuente el uso de algoritmos individuales emblemáticos como la Transformada Rápida de Fourier (FFT) @Pineiro2026 @Perugini2025 @Xiaowen2014, la multiplicación de matrices @Perugini2025 @Utting2014 @Madridejos2015, la descomposición LU @Pineiro2026 y otros cálculos como Montecarlo, Raytracer y la estimación de Pi @Yoshida2017 @Pineiro2026.

- Aplicaciones de Procesamiento de Datos y del Mundo Real: Para evaluar la aplicabilidad en dominios no puramente científicos, se utilizan benchmarks industriales como LDBC y aplicaciones de producción reales para tareas como monitoreo de ciberseguridad y detección de fraude @Fan2021. También se incluyen algoritmos de análisis de datos como k-means clustering @Alexandrov2019, Wordcount @Pineiro2026, regresión logística y filtrado colaborativo @Fernandez2016, así como aplicaciones a medida con interfaces gráficas (GUI) como generadores de fractales y web crawlers para casos de uso especializados @Vikas2014.

- Micro-benchmarks: Un tercer enfoque utiliza pruebas pequeñas y específicas para aislar y medir aspectos concretos del sistema, como la sobrecarga (overhead) pura de las directivas, el costo de la sincronización o el impacto de las herramientas de análisis @Fan2017 @Guitart2001 @Kambites2001.

Las métricas se pueden clasificar en cuantitativas para el rendimiento y cualitativas para las características del lenguaje.

- Métricas de Rendimiento Cuantitativas: Las métricas más fundamentales y utilizadas de forma casi universal son el tiempo de ejecución y el speedup (la aceleración obtenida respecto a una versión secuencial). Prácticamente todos los estudios mencionados los utilizan como su principal indicador de rendimiento (p. ej., @Pineiro2026 @Perugini2025 @Kacs2024 @Yoshida2017. A partir de estas, se derivan otras métricas como la eficiencia paralela @Pineiro2026 @Perugini2025 y la escalabilidad @Utting2014). En trabajos que se centran en el costo de la propia abstracción, la métrica clave es la sobrecarga (overhead), medida en tiempo absoluto o como un porcentaje del total @Fan2017 @Guitart2001.

- Métricas Cualitativas de Expresividad y Productividad: La expresividad del lenguaje o la abstracción, la facilidad para expresar ideas complejas de forma clara y concisa se evalúa de forma cualitativa en varios estudios @Perugini2025 @Utting2014 @Madridejos2015. De manera similar, la productividad del programador y la programabilidad se discuten cualitativamente @Perugini2025 @Fan2017. En algunos casos, esta evaluación se apoya en datos cuantitativos como la comparación de líneas de código (LoC) necesarias para implementar una solución @Vikas2014.

=== ¿Qué beneficios y ventajas potenciales se identifican en la literatura al implementar estas abstracciones de paralelismo de alto nivel en lenguajes de propósito general modernos?

La literatura identifica un conjunto consistente de beneficios al implementar abstracciones de paralelismo de alto nivel, los cuales se centran en mejorar la productividad del desarrollador, alcanzar un alto rendimiento, aumentar la robustez del software y garantizar la portabilidad del código.

El beneficio más destacado es un aumento drástico en la productividad del desarrollador. Al ofrecer interfaces declarativas de alto nivel (como directivas tipo pragma), estas abstracciones liberan al programador de la gestión manual de hilos, la sincronización y el balanceo de carga @Xiaowen2014 @Senghor2012a. Esto permite que el código paralelo se mantenga muy cercano a su versión secuencial, lo que mejora la legibilidad y la mantenibilidad @Vikas2014. El resultado es un ciclo de desarrollo más rápido, con una reducción significativa en las líneas de código necesarias para lograr la concurrencia @Vikas2014 y la automatización de la generación de código paralelo complejo @Yoshida2017 @Yoshida2014.

A pesar de su alto nivel de abstracción, estas implementaciones demuestran consistentemente un rendimiento altamente competitivo. En múltiples estudios, el rendimiento es comparable e incluso superior al de implementaciones de referencia en lenguajes como C y Fortran, o a la paralelización manual con hilos nativos @Perugini2025 @Kacs2024 @Madridejos2015. Estas ganancias se atribuyen a optimizaciones automáticas, un mejor balanceo de carga dinámica y la capacidad de los compiladores modernos para realizar una vectorización automática más eficaz @Yoshida2017 @Perugini2025. Los sistemas unificados también logran un rendimiento superior al eliminar la sobrecarga de integrar múltiples herramientas especializadas @Fan2021.

Estas abstracciones mejoran significativamente la fiabilidad y la correctitud del software paralelo. Al gestionar la concurrencia de forma automática, previenen por diseño clases enteras de errores comunes, como los interbloqueos (deadlocks) y las condiciones de carrera @Powers2007 @Fan2017. Lenguajes como Rust llevan esto un paso más allá al ofrecer seguridad de memoria garantizada en tiempo de compilación, lo cual es crucial para sistemas críticos @Perugini2025. Además, se introducen mecanismos mejorados de manejo de excepciones que aseguran una terminación controlada de las regiones paralelas, aumentando la robustez general @Fan2017.

Un beneficio clave es la portabilidad del código y la independencia de la arquitectura. El código escrito con estas abstracciones puede a menudo ejecutarse sin modificaciones en diversas plataformas, desde dispositivos móviles Android hasta servidores multinúcleo @Yoshida2017 @Xiaowen2014. También se destaca la compatibilidad con el ecosistema de un lenguaje, permitiendo, por ejemplo, paralelizar código Python que utiliza bibliotecas de terceros @Pineiro2026 o interoperar de forma fluida con otros marcos de ciencia de datos como TensorFlow y Spark @Fan2021 @Alexandrov2019.

== Conclusiones

La revisión de la literatura demuestra de manera concluyente que los lenguajes de propósito general modernos, a pesar de su potencia y flexibilidad, presentan limitaciones fundamentales para abordar eficazmente los problemas de paralelismo de cómputo intensivo. La gestión manual de la concurrencia a través de hilos nativos impone una carga cognitiva significativa y es propensa a errores, mientras que barreras a nivel de lenguaje, como el Global Interpreter Lock (GIL) en Python, y la incompatibilidad de paradigmas, como el choque entre el manejo de excepciones y la ejecución paralela, crean una fricción semántico-sintáctica que obstaculiza el desarrollo de software de alto rendimiento.

Para superar estas barreras, la investigación converge en que los paradigmas de paralelismo declarativo ofrecen una solución robusta y eficaz. El principio clave que sustenta estos enfoques es una estricta separación de incumbencias, que permite a los desarrolladores enfocarse en la lógica del algoritmo (el "qué") mientras delegan la complejidad de la ejecución paralela (el "cómo") al sistema. Mediante el uso de abstracciones de alto nivel, como iteradores paralelos y directivas tipo pragma, se logra una integración idiomática y poco intrusiva en el lenguaje anfitrión, preservando la legibilidad y la mantenibilidad del código secuencial original.

La implementación de estas abstracciones se ha explorado principalmente a través de preprocesadores de código fuente (source-to-source), que transforman el código anotado antes de la compilación. Si bien este enfoque ha demostrado ser funcional, la literatura también identifica retos importantes, como la falta de contexto semántico durante la reescritura del código y la necesidad de adaptar las directivas a las limitaciones primitivas de cada lenguaje. Asimismo, se ha observado que el rendimiento puede ser muy sensible a los algoritmos de reparto de trabajo (scheduling), lo que subraya la importancia de la optimización a nivel del sistema de ejecución (runtime).

En conclusión, la adopción de abstracciones de paralelismo de alto nivel en lenguajes de propósito general modernos representa un avance significativo hacia la democratización del cómputo paralelo. Los beneficios son claros y consistentes: un drástico aumento en la productividad del desarrollador, la obtención de un rendimiento competitivo que a menudo iguala o supera a las implementaciones manuales, y una mejora sustancial en la fiabilidad y portabilidad del software. No obstante, los desafíos técnicos en la compilación y la optimización del rendimiento destacan la necesidad de seguir investigando. Los trabajos futuros deberían orientarse hacia una integración más profunda con las cadenas de herramientas de los compiladores y el desarrollo de runtimes más inteligentes y adaptativos para materializar plenamente el potencial de estos paradigmas.
