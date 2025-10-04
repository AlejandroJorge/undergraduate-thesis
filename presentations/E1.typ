#import "@preview/diatypst:0.7.1": *

#show: slides.with(
  title: "GompherMP",
  subtitle: "Implementación de paralelismo basado en directivas adaptando el estándar OpenMP al lenguaje Go",
  date: "30-09-2025",
  authors: ("Jorge Alejandro Contreras", "Patricia Cántaro Márquez"),
  footer-subtitle: "Paralelismo basado en directivas",
  layout: "large",
  count: "number",
  theme: "full"
)

= Problemática

== Árbol de problemas

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 2em,
  [
    *Problemas Causa*
    #line(length: 100%, stroke: 0.5pt)
    - *Acoplamiento* entre lógica y sincronización de algoritmos.

    - *Limitaciones expresivas* en primitivas de concurrencia nativas.

    - *Incertidumbre* sobre viabilidad de abstracciones de alto nivel.
  ],
  [
    *Problema Central*
    #line(length: 100%, stroke: 0.5pt)
    Existe *fricción semántico-sintáctica* al implementar algoritmos paralelos con memoria compartida en lenguajes de programación modernos como Go.
  ],
  [
    *Problemas Efecto*
    #line(length: 100%, stroke: 0.5pt)
    - Aumento de *barreras* para optimización y escalabilidad.

    - Incremento de *carga cognitiva* y errores del programador.

    - Ausencia de *herramientas de alto nivel* en ecosistemas modernos para memoria compartida.
  ]
)

== Problemas causa

- Al implementar algoritmos paralelos basados en memoria compartida en lenguajes modernos como Go, existe *acoplamiento entre la lógica del algoritmo y los mecanismos de concurrencia*.

- Existen *limitaciones expresivas* inherentes a las *primitivas de concurrencia* nativas a los lenguajes de propósito general como Go.

- Incertidumbre sobre la *viabilidad de abstracciones de paralelismo de alto nivel* para memoria compartida en lenguajes multiparadigma modernos como Go.

== Problema central

Existe *fricción semántico-sintáctica* al implementar algoritmos paralelos computacionalmente intensivos basados en el paradigma de memoria compartida en lenguajes modernos como Go.

== Problemas efecto

- Aumento de *barreras* para la optimización y escalabilidad del código.

- Incremento de *carga cognitiva y tasa de errores* del programador.

- Ausencia de *herramientas de alto nivel* para el *paralelismo de memoria compartida* en el ecosistema de lenguajes modernos como Go.

= Objetivos

== Objetivo General

Diseñar, desarrollar y evaluar la herramienta *GompherMP* que implemente un modelo de *paralelismo de alto nivel basado en directivas* para el lenguaje Go, inspirado en un subconjunto del estándar OpenMP, a fin de *cerrar la brecha* entre la productividad del desarrollador y el rendimiento del código en la implementación de algoritmos de cómputo intensivo.

== Objetivos Específicos

+ *Diseñar y especificar la arquitectura de la herramienta GompherMP*, incluyendo la sintaxis de sus directivas y cláusulas, los algoritmos de transformación de código y la interfaz de línea de comandos (CLI).

+ *Implementar la librería de runtime de GompherMP*, que proveerá las funciones de soporte para la gestión de goroutines, la sincronización y el reparto de trabajo requeridos por el código paralelo generado.

+ *Implementar el compilador source-to-source de GompherMP*, capaz de analizar el código fuente, interpretar las directivas y transformar el Árbol de Sintaxis Abstracta (AST) para generar código Go nativo concurrente.

+ *Evaluar la herramienta GompherMP mediante la ejecución de benchmarks*, comparando sus resultados en términos de rendimiento y expresividad del código frente a las implementaciones secuenciales y paralelas manuales en Go.

== Resultados Esperados

#grid(
  columns: (1fr, 1fr),
  row-gutter: 1.5em,
  [
    *1. Diseño y Especificación*
    #line(length: 85%)

    - *R1:* Especificación de directivas y cláusulas.
    - *R2:* Diseño de arquitectura.
    - *R3:* Especificación de la CLI.
  ],
  [
    *2. Implementación del Runtime*
    #line(length: 85%)
    
    - *R1:* Módulo de gestión de goroutines y scheduling.
    - *R2:* Módulo de sincronización.
    - *R3:* Módulo de paralelismo de tareas.
  ],
  [
    *3. Implementación del Compilador*
    #line(length: 85%)
    
    - *R1:* Parser de directivas.
    - *R2:* Motor de transformación del AST.
    - *R3:* Herramienta CLI.
  ],
  [
    *4. Evaluación y Benchmarking*
    #line(length: 85%)
    
    - *R1:* Suite de benchmarks.
    - *R2:* Informe de rendimiento.
    - *R3:* Análisis de expresividad.
  ]
)

= Estado del arte

== Preguntas de Revisión

+ ¿Cuáles son las *limitaciones* de los lenguajes de propósito general modernos para problemas de paralelismo de cómputo intensivo?

+ ¿Qué *principios y abstracciones fundamentales* proveen los paradigmas de *paralelismo declarativo* para evitar la fricción semántico-sintáctica en lenguajes de propósito general modernos?

+ ¿Qué *propuestas* existen en la literatura para *implementar paralelismo declarativo* en lenguajes de propósito general modernos?

+ ¿Qué *retos (sintácticos, semánticos, de compilación o de rendimiento)* identifica la literatura al intentar implementar paradigmas de paralelismo de alto nivel en lenguajes de propósito general modernos?

+ ¿Qué *conjunto de pruebas y métricas* tanto de *rendimiento* como de *expresividad* se usan en la literatura para evaluar abstracciones de paralelismo de alto nivel en lenguajes de propósito general modernos?

+ ¿Qué *beneficios y ventajas* potenciales se identifican en la literatura al implementar estas abstracciones de paralelismo de alto nivel en lenguajes de propósito general modernos?

== Cadena de búsqueda

#table(
  columns: (1fr, 4fr, 1.5fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Motor*], [*Cadena*], [*Resultados*]
  ),
  [Scopus],
  [_TITLE-ABS-KEY ( ( "OMP4Py" OR "JOMP" OR ( "Zig" AND "OpenMP" ) OR ( "Rust" AND "OpenMP" ) ) OR ( ("Python" OR "Java" OR "Zig" OR "Rust" OR "Go" OR "Golang" OR "modern programming language" ) AND ( "pragma" OR "directive" OR "declarative" ) AND ( "parallelism" OR "parallel" OR "hpc" ) AND ( "pure implementation" OR "library" OR "compiler" OR "compiler extension" OR "framework" OR "prototype" OR "language support" OR "OpenMP" OR "MPI" ) AND NOT ( "GPU" OR "CUDA" OR "IO" OR "I/O" ) ) )_],
  [112]
)

#table(
  columns: (1fr, 4fr, 1.5fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Motor*], [*Cadena*], [*Resultados*]
  ),
  [IEEE Xplore],
  [_(("OMP4Py" OR "JOMP" OR ("Zig" AND "OpenMP") OR ("Rust" AND "OpenMP")) OR (("Python" OR "Java" OR "Zig" OR "Rust" OR "Go" OR "Golang" OR "modern programming language") AND ("pragma" OR "directive" OR "declarative") AND ("parallelism" OR "parallel" OR "hpc") AND ("pure implementation" OR "library" OR "compiler" OR "compiler extension" OR "framework" OR "prototype" OR "language support" OR "OpenMP" OR "MPI") AND NOT ("GPU" OR "CUDA" OR "IO" OR "I/O")))_],
  [27]
)

Tras aplicar criterios de exclusión y descartar repetidos: *20 resultados* de ambos motores de búsqueda.

== Resultados

=== Limitaciones de lenguajes modernos para la concurrencia

- Carga de complejidad significativa sobre el programador @Xiaowen2014 @Powers2007

- Implementación manual propenso a errores @Vikas2014

- Enfoque en concurrencia más que en paralelismo @Madridejos2015

- Overhead de crear y destruir hilos constantemente @Kambites2001

- Delegación de optimizaciones en el programador @Alexandrov2019

#pagebreak()

=== Principios y abstracciones que provee el paralelismo declarativo

- Paralelismo como capa ortogonal que permite que el programa mantenga su estructura original @Ramirez2003

- Se declara la intención de paralelizar y el sistema gestiona los detalles @Fan2021 @Yoshida2017

- Paralelismo basado en comentarios o pragmas @Vikas2014 @Kambites2001

- Se aprovecha la sintaxis nativa como decoradores, context managers o iteradores @Pineiro2026 @Fernandez2016 @Perugini2025

- Unidades de trabajo atómicas o dependencias entre tareas @Powers2007 @Yoshida2017

#pagebreak()

=== Propuestas de implementación de paralelismo declarativo

- Adaptaciones de OpenMP a otros lenguajes @Brunschen2000 @Kambites2001 @Madridejos2015 @Kacs2024 @Pineiro2026

- Recompilación en momento de ejecución de código serial a código paralelo @Powers2007

- Lenguajes lógicos con relaciones temporales entre eventos del programa @Ramirez2003

#pagebreak()

=== Retos al implementar paralelismo declarativo

- Falta de acceso directo a instrucciones de hardware @Kambites2001 @Kacs2024

- Error handling integrado de algunos lenguajes (excepciones) @Fan2017

- Restricciones intrínsecas de los mismos lenguajes como el GIL @Pineiro2026

- Modificación del Abstract Syntax Tree @Kacs2024 @Madridejos2015

- Integración con IO u otros sistemas @Vikas2014

#pagebreak()

=== Qué pruebas y métricas se han usado

- Algoritmos numéricos y de computación científica @Kacs2024 @Yoshida2017 @Vikas2014 @Pineiro2026 @Perugini2025 @Xiaowen2014 @Utting2014 @Madridejos2015

- Aplicaciones de procesamiento de datos cercanos al mundo real @Fan2021 @Alexandrov2019 @Pineiro2026 @Fernandez2016 @Vikas2014

- Métricas de rendimiento cuantitativas: speedup @Pineiro2026 @Perugini2025 @Kacs2024 @Yoshida2017 @Utting2014

- Métricas cualitativas de expresividad @Perugini2025 @Utting2014 @Madridejos2015 @Fan2017 @Vikas2014

#pagebreak()

=== Beneficios y ventajas potenciales del paralelismo declarativo

- Aumento en la productividad del desarrollador @Xiaowen2014 @Senghor2012a

- Mejora en legibilidad y mantenibilidad @Vikas2014

- Ciclos de desarrollo más rápidos @Vikas2014

- Rendimiento altamente competitivo @Perugini2025 @Kacs2024 @Madridejos2015

- Mejora en fiabilidad y correctitud (deadlocks, starvation) @Powers2007 @Fan2017

= Metodología

== Diseñar y especificar la arquitectura

- *R1*: Documento de especificación de directivas y cláusulas.
  - No aplica

- *R2*: Diseño de la arquitectura de la herramienta.
  - Excalidraw (*Herramienta*)

- *R3*: Especificación funcional de la Interfaz de Línea de Comandos (CLI).
  - No aplica

== Implementar la librería de runtime

- *R1*: Módulo de gestión de goroutines y reparto de trabajo implementado y probado.
  - Go, neovim, vscode, Github (*Herramientas*)
  - Metodología kanban, pruebas unitarias (*Métodos*)

- *R2*: Módulo de mecanismos de sincronización implementado y probado.
  - Go, neovim, vscode, Github (*Herramientas*)
  - Metodología kanban, pruebas unitarias (*Métodos*)

- *R3*: Módulo de soporte para paralelismo de tareas (tasking) implementado y probado.
  - Go, neovim, vscode, Github (*Herramientas*)
  - Metodología kanban, pruebas unitarias (*Métodos*)

== Implementar el compilador source-to-source

- *R1*: Analizador sintáctico (Parser) de directivas GompherMP.
  - Go, neovim, vscode, Github (*Herramientas*)
  - Metodología kanban, pruebas unitarias, análisis sintáctico (*Métodos*)

- *R2*: Motor de transformación del AST implementado.
  - Go, neovim, vscode, Github (*Herramientas*)
  - Metodología kanban, pruebas unitarias, abstract syntax trees (*Métodos*)

- *R3*: Herramienta GompherMP (CLI) funcional.
  - Go, neovim, vscode, Github (*Herramientas*)
  - Metodología kanban, pruebas unitarias (*Métodos*)

== Evaluar la herramienta

- *R1*: Suite de benchmarks implementada.
  - Go, C, OpenMP (*Herramientas*)
  - Benchmarking de algoritmos de computación intensiva (*Métodos*)
  - Performance profiling (*Procedimiento*)

- *R2*: Informe de evaluación de rendimiento y escalabilidad.
  - Python, Matplotlib (*Herramientas*)

- *R3*: Reporte de análisis comparativo sobre expresividad y productividad.
  - Python, Scipy (*Herramientas*)
  - Análisis comparativo con pruebas estadísticas, análisis cualitativo (*Métodos*)
  - ANOVA, t-test (*Procedimientos*)

= Bibliografía

== Bibliografía

#bibliography("E1.bib", style: "institute-of-electrical-and-electronics-engineers", full: true)
