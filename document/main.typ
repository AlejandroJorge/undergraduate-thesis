#import "template.typ": setup

#show: doc => setup(doc)

#include "content/00-front-matter.typ"
#include "content/01-generalities.typ"
#include "content/02-state-of-the-art.typ"
#bibliography("bibliography.bib", full: true, title: "Referencias", style: "american-psychological-association")
