#import "template/template.typ": appendix, report-template

#show: report-template.with(
  title: "Automated Testbench for Communicative Embedded Systems",
  author: "Sylvan Arnold",
  orientation: "Computer Science",
  teacher: "",
  confidential: false,
)

= Introduction
Reference @reference

#figure(
  raw(
    "Console.log('Hello, world!');
",
    lang: "js",
    block: true,
  ),
  caption: "JavaScript example",
)


#pagebreak()
#bibliography(full: true, "bibliography.bib", style: "ieee")
#pagebreak()

#show: appendix

= Proofs
#lorem(100)
