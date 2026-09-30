#import "template/template.typ": appendix, report-template

#show: report-template.with(
  title: "Automated Testbench for a Connected Embedded System",
  author: "Sylvan Arnold",
  orientation: "Computer Science",
  subtitle: "PA Project",
  teacher: "Dagher Roudy
Métrailler Christopher",
  confidential: false,
)

#include "01-introduction.typ"
#include "02-techniqcal-context.typ"
#include "03-project-objectives.typ"
#include "04-planning.typ"
#include "05-state-of-the-art.typ"
#include "06-pytest-vs-robot-framework.typ"
#include "07-architecture-overwiew.typ"
#include "08-test-strategy.typ"
#include "09-implementation.typ"
#include "10-results.typ"

#pagebreak()
#bibliography(full: true, "bibliography.bib", style: "ieee")
#pagebreak()

#show: appendix
