#import "template/template.typ": appendix, report-template

#show: report-template.with(
  title: "Automated Testbench for a Communicative Embedded System",
  author: "Sylvan Arnold",
  orientation: "Computer Science",
  subtitle: "PA Project",
  teacher: "Métrailler Christofer",
  confidential: false,
)

#include "01-introduction.typ"


#pagebreak()
#bibliography(full: true, "bibliography.bib", style: "ieee")
#pagebreak()

#show: appendix
