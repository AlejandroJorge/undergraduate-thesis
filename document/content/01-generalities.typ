= Generalidades

== Problemática

En la era de la computación multinúcleo, el aprovechamiento del paralelismo se ha convertido en un pilar fundamental para el desarrollo de software de alto rendimiento. El lenguaje de programación Go ha ganado una notable popularidad gracias a su innovador modelo de concurrencia, ideal para aplicaciones de red y servicios escalables. No obstante, la aplicación de este modelo al paralelismo de cómputo intensivo, cuyo dominio tradicional de estándares como OpenMP se encuentran en C++ y Fortran, presenta desafíos significativos que limitan la productividad del desarrollador y la eficiencia del código. Este trabajo emplea la técnica de árbol de problemas para sistematizar y abordar esta discordancia de paradigmas, identificando los problemas causa, el problema central y los problemas efecto.

=== Árbol de problemas

El árbol de problemas es una herramienta analítica que permite elaborar un diagrama de causas y efectos entre los distintos problemas identificados para ofrecer una visión parcial y jerarquizada de la realidad. La construcción de este diagrama se basa en determinar un problema central, para luego ordenar en torno a él sus causas en la parte inferior y sus efectos o consecuencias en la parte superior @Camacho2001.

En la tabla que se presenta a continuación, se muestran los problemas causa, el problema central y los problemas de efecto planteados para el proyecto.

#table(
  columns: (0.6fr, 1fr, 1fr, 1fr),
  inset: 20pt,
  align: center + horizon,
  stroke: 0.5pt,
  [PROBLEMAS EFECTOS], [Aumento de barreras para la optimización y escalabilidad del código.], [Incremento de carga cognitiva y tasa de errores del programador.], [Ausencia de herramientas de alto nivel para el paralelismo de memoria compartida en lenguajes de programación modernos como Go.],
  [PROBLEMA CENTRAL], table.cell(colspan: 3)[Existe fricción semántico-sintáctica al implementar algoritmos paralelos computacionalmente intensivos basados en el paradigma de memoria compartida en lenguajes multiparadigma modernos como Go.],
  [PROBLEMAS EFECTOS], [Aumento de barreras para la optimización y escalabilidad del código.], [Incremento de carga cognitiva y tasa de errores del programador.], [Ausencia de herramientas de alto nivel para el paralelismo de memoria compartida en lenguajes de programación modernos como Go.],
)

=== Descripción

El lenguaje de programación Go se ha consolidado como una herramienta potente para el desarrollo de sistemas concurrentes, especialmente en el dominio de servicios de red. No obstante, su modelo nativo, basado en goroutines y channels, no se traduce directamente a los patrones de paralelismo de cómputo intensivo tradicionalmente abordados por estándares como OpenMP en C++ o Fortran. Esta divergencia de paradigmas genera una fricción semántico-sintáctica para los desarrolladores que buscan implementar algoritmos de High-Performance Computing (HPC) en Go, obligándolos a reestructurar lógicas y a gestionar manualmente complejidades que en otros ecosistemas son abstraídas.

Una de las causas fundamentales de esta fricción es el acoplamiento entre la lógica del algoritmo y los mecanismos de concurrencia al usar las primitivas nativas de Go. La implementación manual del paralelismo mediante goroutines, WaitGroups y channels obliga al programador a entrelazar los detalles de la sincronización y el reparto de trabajo directamente en el cuerpo del algoritmo @Madridejos2015. Este enfoque se aleja del principio de separación de incumbencias, resultando en un código más verboso y difícil de mantener en comparación con los modelos basados en directivas, donde el código paralelo se mantiene estructuralmente muy cercano a su versión secuencial @Kambites2001 @Vikas2014.

Adicionalmente, existen limitaciones expresivas inherentes a las primitivas de concurrencia nativas de los lenguajes de propósito general. Aunque potentes, estas primitivas son de bajo nivel y no ofrecen abstracciones directas para patrones de HPC comunes. Por ejemplo, lenguajes como Java históricamente han carecido de mecanismos de sincronización de alto rendimiento, como las barreras rápidas, que son cruciales para la eficiencia de muchos algoritmos paralelos @Kambites2001. De manera similar, modelos como Fork/Join, aunque conceptualmente análogos a la división de tareas, son difíciles de aplicar a cómputos que no siguen un patrón estricto de "divide y vencerás", especialmente cuando existen dependencias de datos complejas @Yoshida2017.

Finalmente, esta situación genera una incertidumbre sobre la viabilidad y el rendimiento de abstracciones de paralelismo de alto nivel en el ecosistema de Go. La falta de una implementación de referencia de un estándar como OpenMP en Go crea un vacío en la literatura y en las herramientas disponibles, dejando a los desarrolladores sin una alternativa probada para el desarrollo de aplicaciones de HPC. Trabajos pioneros como la tesis de Madridejos Zamorano @Madridejos2015 comenzaron a explorar esta área, y la investigación activa en otros lenguajes modernos como Zig @Kacs2024 demuestra que la adaptación de estos paradigmas sigue siendo un campo de estudio relevante y no resuelto, lo que justifica la necesidad de una investigación rigurosa para establecer una solución robusta y eficiente para Go.

=== Problema seleccionado

El problema central que aborda esta investigación es la fricción semántico-sintáctica que enfrentan los desarrolladores al implementar algoritmos de cómputo intensivo basados en el paradigma de memoria compartida en Go. Esta fricción surge porque el modelo de concurrencia nativo de Go, aunque excelente para servicios de red, no ofrece las abstracciones de alto nivel necesarias para el dominio de HPC. Como resultado, los programadores se ven forzados a implementar la paralelización de forma manual, acoplando la lógica del algoritmo con mecanismos de concurrencia de bajo nivel, lo que incrementa la carga cognitiva, aumenta la probabilidad de errores (como condiciones de carrera o deadlocks) y dificulta la optimización y el mantenimiento del código. La ausencia de un estándar declarativo como OpenMP en el ecosistema de Go crea una barrera para la productividad y la adopción del lenguaje en la comunidad de computación de alto rendimiento, un vacío que este proyecto busca resolver mediante la propuesta de la herramienta GompherMP.

== Objetivos

En esta sección, se presentan tanto el objetivo general como los objetivos específicos. El objetivo general se enfoca a resolver el problema seleccionado, mientras que los objetivos específicos guardan relación con los problemas causa mencionados en el árbol de problemas diagramado anteriormente.

=== Objetivo General

Diseñar, desarrollar y evaluar la herramienta GompherMP que implemente un modelo de paralelismo de alto nivel basado en directivas para el lenguaje Go y que está inspirado en un subconjunto del estándar OpenMP, a fin de cerrar la brecha entre la productividad del desarrollador y el rendimiento del código en la implementación de algoritmos de cómputo intensivo.

=== Objetivos Específicos

+ Diseñar y especificar la arquitectura de la herramienta GompherMP, incluyendo la sintaxis de sus directivas y cláusulas, los algoritmos de transformación de código y la interfaz de línea de comandos (CLI).

+ Implementar la librería de runtime de GompherMP, que proveerá las funciones de soporte para la gestión de goroutines, la sincronización y el reparto de trabajo requeridos por el código paralelo generado.

+ Implementar el compilador source-to-source de GompherMP, capaz de analizar el código fuente, interpretar las directivas y transformar el Árbol de Sintaxis Abstracta (AST) para generar código Go nativo concurrente.

+ Evaluar la herramienta GompherMP mediante la ejecución de benchmarks, comparando sus resultados en términos de rendimiento y expresividad del código frente a las implementaciones secuenciales y paralelas manuales en Go.

=== Resultados Esperados

+ Diseñar y especificar la arquitectura de la herramienta GompherMP, incluyendo la sintaxis de sus directivas y cláusulas, los algoritmos de transformación de código y la interfaz de línea de comandos (CLI).
  +	Documento de especificación de directivas y cláusulas.
  +	Diseño de la arquitectura de la herramienta.
  +	Especificación funcional de la Interfaz de Línea de Comandos (CLI).	

+ Implementar la librería de runtime de GompherMP, que proveerá las funciones de soporte para la gestión de goroutines, la sincronización y el reparto de trabajo requeridos por el código paralelo generado.
  + Módulo de gestión de goroutines y reparto de trabajo implementado y probado.
  + Módulo de mecanismos de sincronización implementado y probado.
  + Módulo de soporte para paralelismo de tareas (tasking) implementado y probado.

+ Implementar el compilador source-to-source de GompherMP, capaz de analizar el código fuente, interpretar las directivas y transformar el Árbol de Sintaxis Abstracta (AST) para generar código Go nativo concurrente.
  + Analizador sintáctico (Parser) de directivas GompherMP.
  + Motor de transformación del AST implementado.
  + Herramienta GompherMP (CLI) funcional.	

+ Evaluar la herramienta GompherMP mediante la ejecución de benchmarks, comparando sus resultados en términos de rendimiento y expresividad del código frente a las implementaciones secuenciales y paralelas manuales en Go.
  + Suite de benchmarks implementada.
  + Informe de evaluación de rendimiento y escalabilidad.	
  + Reporte de análisis comparativo sobre expresividad y productividad.	

=== Mapeo de objetivos, resultados y medios de verificación

En esta sección, se pretende mostrar cómo cada objetivo específico se traduce en resultados esperados juntos con sus medios de verificación e indicadores objetivamente verificables. Esto permitirá que se realice una evaluación adecuada y precisa en el transcurso del proyecto. 

#table(
  columns: (1.2fr, 1fr, 2fr),
  stroke: 1pt,
  align: (left + top),

  table.cell(colspan: 3)[
    *Objetivo 1:* Diseñar y especificar la arquitectura de la herramienta *GompherMP*, incluyendo la sintaxis de sus directivas y cláusulas, los algoritmos de transformación de código y la interfaz de línea de comandos (CLI).
  ],
  
  [*Resultado*],
  [*Medio de verificación*],
  [*Indicador objetivamente verificable (IOV)*],

  [R1. Documento de especificación de directivas y cláusulas.],
  [
    - Informe técnico de especificación de *GompherMP*.
  ],
  [
    - El informe define la sintaxis, semántica y presenta al menos un ejemplo de uso para cada directiva y cláusula del alcance del proyecto (parallel, for, task, depend, critical, etc.).
    - Se obtiene la aprobación escrita de un experto en programación concurrente.
  ],

  [R2. Diseño de la arquitectura de la herramienta.],
  [
    - Documento de diseño de arquitectura.
  ],
  [
    - El documento contiene diagramas que ilustran la interacción entre el compilador `source-to-source` y la librería de `runtime`.
    - Existe una descripción del flujo general del proceso de transformación del AST.
    - Se obtiene la aprobación escrita de la arquitectura.
  ],

  [R3. Especificación funcional de la Interfaz de Línea de Comandos (CLI).],
  [
    - Manual de usuario de la CLI.
  ],
  [
    - El manual especifica todos los comandos, argumentos y opciones disponibles. 
    - Incluye ejemplos claros de uso para la transpilación de código.
  ]

)

#table(
  columns: (1.2fr, 1fr, 2fr),
  stroke: 1pt,
  align: (left + top),

  table.cell(colspan: 3)[
    *Objetivo 2*: Implementar la librería de runtime de GompherMP, que proveerá las funciones de soporte para la gestión de goroutines, la sincronización y el reparto de trabajo requeridos por el código paralelo generado.
  ],
  
  [*Resultado*],
  [*Medio de verificación*],
  [*Indicador objetivamente verificable (IOV)*],

  [R1. Módulo de gestión de goroutines y reparto de trabajo implementado y probado.],
  [
    - Código fuente en repositorio en línea. 
    - Informe de pruebas unitarias.
  ],
  [
    - Repositorio accesible con código fuente documentado.
    - El código implementa la gestión del pool de goroutines y el reparto de iteraciones para la directiva for. 
    - El informe evidencia una cobertura de pruebas superior al 80% para el módulo.
  ],

  [R2. Módulo de mecanismos de sincronización implementado y probado.],
  [
    - Código fuente en repositorio en línea. 
    - Informe de pruebas unitarias.
  ],
  [
    - El código fuente implementa la funcionalidad para las directivas critical y single.
    - El informe evidencia una cobertura de pruebas superior al 80% para el módulo.
  ],

  [R3. Módulo de soporte para paralelismo de tareas (tasking) implementado y probado.],
  [
    - Código fuente en repositorio en línea. 
    - Informe de pruebas de integración.
  ],
  [
    - El código implementa la creación de tareas y la gestión de su grafo de dependencias (in, out, inout). 
    - Las pruebas validan la correcta ejecución de tareas según las dependencias definidas.
    - El informe evidencia una cobertura de pruebas superior al 80% para el módulo.
  ]
)

#table(
  columns: (1.2fr, 1fr, 2fr),
  stroke: 1pt,
  align: (left + top),

  table.cell(colspan: 3)[
    *Objetivo 3*: Implementar el compilador source-to-source de GompherMP, capaz de analizar el código fuente, interpretar las directivas y transformar el Árbol de Sintaxis Abstracta (AST) para generar código Go nativo concurrente.
  ],
  
  [*Resultado*],
  [*Medio de verificación*],
  [*Indicador objetivamente verificable (IOV)*],

  [R1. Analizador sintáctico (Parser) de directivas GompherMP.],
  [
    - Código fuente del compilador en repositorio en línea.
    - Informe de pruebas de integración.
  ],
  [
    - El módulo de código es capaz de identificar y extraer correctamente todas las directivas y cláusulas definidas en la especificación (O1.R1) a partir de los comentarios \/\/gompher.
    - El informe evidencia una cobertura de pruebas superior al 80% para el módulo.
  ],

  [R2. Motor de transformación del AST implementado.],
  [
    - Código fuente del compilador en repositorio en línea.
    - Informe de pruebas de integración.	
  ],
  [
    - El código modifica el AST de un programa de entrada, inyectando las llamadas a la librería de runtime correspondientes a las directivas encontradas.
    - El informe evidencia una cobertura de pruebas superior al 80% para el módulo.
  ],

  [R3. Herramienta GompherMP (CLI) funcional.],
  [
    - Ejecutable de la herramienta CLI. 
    - Guía de instalación y uso.
  ],
  [
    - La herramienta transpila correctamente archivos .go con directivas GompherMP, generando como salida un archivo .go con código concurrente nativo, el cual debe ser compilable con el compilador estándar de Go.
    - Debe ser aprobado por experto en programación concurrente.
  ]
)

#table(
  columns: (1.2fr, 1fr, 2fr),
  stroke: 1pt,
  align: (left + top),

  table.cell(colspan: 3)[
    *Objetivo 4*: Evaluar la herramienta GompherMP mediante la ejecución de benchmarks, comparando sus resultados en términos de rendimiento y expresividad del código frente a las implementaciones secuenciales y paralelas manuales en Go.
  ],
  
  [*Resultado*],
  [*Medio de verificación*],
  [*Indicador objetivamente verificable (IOV)*],

  [R1. Suite de benchmarks implementada.],
  [
    - Código fuente de los algoritmos de benchmark en repositorio en línea.
  ],
  [
    - El repositorio contiene al menos 3 algoritmos de cómputo intensivo. 
    - Cada algoritmo está implementado en 3 versiones: secuencial, paralela manual y paralela con GompherMP.
  ],

  [R2. Informe de evaluación de rendimiento y escalabilidad.],
  [
    - Informe de evaluación de rendimiento.	
  ],
  [
    - El informe presenta los resultados de tiempo de ejecución, speedup y eficiencia para cada versión de los benchmarks. 
    - El informe incluye gráficos comparativos que visualizan los resultados.
    - Se presentan conclusiones respecto a la efectividad de la herramienta en el informe.
    - El informe debe ser aprobado por un experto en programación concurrente.
  ],

  [R3. Reporte de análisis comparativo sobre expresividad y productividad.],
  [
    - Reporte de análisis comparativo.	
  ],
  [
    - El reporte incluye un análisis cuantitativo (ej. líneas de código) y cualitativo de la complejidad y legibilidad del código entre la versión paralela manual y la versión con GompherMP.
    - Se presentan conclusiones sobre el impacto de GompherMP en la productividad del desarrollador.
  ]
)
