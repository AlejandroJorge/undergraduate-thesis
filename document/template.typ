#let setup(doc) = {
  set document(
    author: ("Jorge Alejandro Contreras", "Patricia Cantaro Marquez"),
    title: "Implementación de paralelismo basado en directivas adaptando el estándar OpenMP al lenguaje Go"
  )

  set page(
    paper: "a4", 
    margin: (top: 1.2in, bottom: 1.2in, x: 1in)
  )

  set text(
    font: "Libertinus Serif", 
    size: 12pt,
    lang: "es"
  )

  set heading(numbering: "1.1.1")

  set figure(numbering: "1")
  show figure.caption: set text(size: 10pt)

  show heading: it => {
    if it.level == 1 {
      pagebreak()
    }
    it
  }

  doc
}
