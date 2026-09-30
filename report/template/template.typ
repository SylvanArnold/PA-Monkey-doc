// HES-SO // Master of Science in Engineering — report template.
//
// Brand surfaces (cover, headings, footer) use the institutional sans font;
// running text uses a serif for long-form readability.

#let report-template(
  title: "Title",
  subtitle: "Subtitle",
  author: "Your Name",
  teacher: "teacher name",
  orientation: "Orientation",
  date: datetime.today(),
  confidential: false,
  body,
  state: "To be finalized",
  accent-color: rgb(40, 94, 151),
  lang: "en",
  font: "Arial",
  body-font: "Libertinus Serif",
  mono-font: "DejaVu Sans Mono",
) = {
  // PALETTE
  let ink = rgb(26, 30, 36)
  let muted = rgb(108, 117, 127)
  let rule-color = rgb(206, 213, 221)
  let ia-color = rgb(194, 47, 103)
  let code-bg = rgb(249, 250, 252)
  let margin-x = 2.5cm

  let is-empty(v) = v == none or v == "" or v == []

  // A small uppercase label, used for the cover's metadata blocks.
  let field-label(s) = text(
    font: font,
    size: 8pt,
    weight: "bold",
    fill: muted,
    tracking: 0.1em,
    upper(s),
  )

  // A label / value pair.
  let field(label, value) = [
    #field-label(label)
    #v(0.45em, weak: true)
    #text(font: font, size: 13pt, fill: ink, value)
  ]

  // TRANSLATIONS
  let t = (
    en: (
      toc: "Table of Contents",
      declaration: "Declaration of honor",
      declaration_content: "I hereby affirm that this assignment is my own written work and that I have used no other sources or aids other than those indicated. All passages that have been quoted from publications or paraphrased from these sources are indicated as such. Additionally, any assistance from artificial intelligence tools has been appropriately acknowledged and documented.",
      produced_by: "Author",
      supervision: "Under the supervision of",
      date_pub: "Date of publication",
      author: "Author",
      name: "Name",
      date: "Date",
      orientation: "Profil / Orientation",
      table: "Table",
      code: "Code",
    ),
    fr: (
      toc: "Table des matières",
      declaration: "Déclaration d’honneur",
      declaration_content: "Je certifie par la présente que ce travail est le fruit de mon propre travail écrit et que je n’ai utilisé aucune autre source ou aide que celles indiquées. Tous les passages qui ont été cités à partir de publications ou paraphrasés à partir de ces sources sont indiqués comme tels. De plus, toute aide provenant d’outils d’intelligence artificielle a été correctement mentionnée et documentée.",
      produced_by: "Réalisé par",
      supervision: "Sous la supervision de",
      date_pub: "Date de publication",
      author: "Auteur",
      name: "Nom",
      date: "Date",
      orientation: "Profil / Orientation",
      table: "Tableau",
      code: "Code",
    ),
  )

  let tr(key) = t.at(lang).at(key)

  // TYPOGRAPHY
  set document(title: title, author: author, date: date)
  set text(font: body-font, size: 12pt, fill: ink, lang: lang)
  set par(justify: true, leading: 0.72em, spacing: 1.15em)

  show link: set text(fill: accent-color)

  // Headings: institutional sans, accent colour, generous space above.
  show heading: set text(font: font, fill: accent-color, weight: "bold")

  show heading.where(level: 1): it => block(above: 2em, below: 1em)[
    #set text(font: font, size: 19pt, weight: "bold", fill: accent-color)
    #set par(justify: false, leading: 0.5em)
    #if it.numbering != none {
      text(fill: accent-color.lighten(45%), counter(heading).display(it.numbering))
      h(0.5em)
    }
    #it.body
  ]

  show heading.where(level: 2): set text(size: 14.5pt)
  show heading.where(level: 2): set block(above: 1.7em, below: 0.75em)
  show heading.where(level: 3): set text(size: 12.5pt)
  show heading.where(level: 3): set block(above: 1.5em, below: 0.65em)
  show heading.where(level: 4): set text(size: 11pt, fill: ink)
  show heading.where(level: 4): set block(above: 1.3em, below: 0.55em)

  // CODE
  show raw: set text(font: mono-font, size: 9.5pt)

  show raw.where(block: false): box.with(
    fill: code-bg,
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
    stroke: 0.4pt + rule-color,
  )

  show raw.where(block: true): it => block(
    fill: code-bg,
    stroke: (left: 2.5pt + accent-color.lighten(25%), rest: 0.5pt + rule-color),
    radius: (left: 0pt, right: 3pt),
    inset: (x: 1em, y: 0.9em),
    width: 100%,
    align(left, it),
  )

  // FIGURES AND TABLES
  show figure.where(kind: raw): set figure(supplement: tr("code"))
  show figure.where(kind: table): set figure(supplement: tr("table"))
  show figure: set block(above: 1.8em, below: 1.8em)
  set figure(gap: 0.9em)

  show figure.caption: set text(font: font, size: 9pt, fill: muted)
  show figure.caption: it => [
    #text(weight: "bold", fill: accent-color)[#it.supplement #context it.counter.display(it.numbering)]
    #h(0.4em)
    #it.body
  ]

  set table(
    inset: (x: 0.7em, y: 0.55em),
    stroke: (_, y) => (bottom: if y == 0 { 0.7pt + accent-color } else { 0.4pt + rule-color }),
    fill: (_, y) => if y == 0 { accent-color.lighten(92%) } else { none },
  )
  show table.cell.where(y: 0): set text(font: font, weight: "bold", fill: accent-color)

  // COVER
  set page(
    paper: "a4",
    margin: (x: margin-x, top: 2.6cm, bottom: 2.4cm),
    header: grid(
      columns: (1fr, auto),
      align: (left + top, right + top),
      image("imgs/hes-so.svg", width: 4.2cm),
      image("imgs/corner-hes.svg", width: 1cm),
    ),
    header-ascent: 45%,
    footer: none,
  )

  {
    set par(justify: false)

    v(3em)
    image("imgs/mse-full.svg", width: 58%)
    v(1fr)

    line(length: 3.4cm, stroke: 3pt + accent-color)
    v(1.25em)

    block(width: 100%)[
      #set par(leading: 0.42em)
      #text(font: font, size: 29pt, weight: "extrabold", fill: accent-color, title)
    ]

    v(1.1em)
    text(font: font, size: 14pt, fill: ink, subtitle)
    v(0.45em)
    text(font: font, size: 11.5pt, fill: muted)[#tr("orientation") — #orientation]

    v(1.6fr)

    if confidential {
      align(center, image("imgs/confidential.png", width: 42%))
      v(1.2fr)
    }

    line(length: 100%, stroke: 0.6pt + rule-color)
    v(1.2em)

    if is-empty(teacher) {
      field(tr("produced_by"), author)
    } else {
      grid(
        columns: (1fr, 1fr),
        column-gutter: 1.5em,
        field(tr("produced_by"), author),
        field(tr("supervision"), teacher),
      )
    }

    v(1.6em)
    text(font: font, size: 9.5pt, fill: muted)[
       #tr("date_pub"): #date.display("[day].[month].[year]")
    ]
  }

  pagebreak()

  // RUNNING PAGES
  set page(
    paper: "a4",
    margin: (x: margin-x, top: 2.6cm, bottom: 3.2cm),
    header: grid(
      columns: (1fr, auto),
      align: (left + top, right + top),
      image("imgs/hes-so-master.jpg", width: 3.2cm),
      image("imgs/corner-hes.svg", width: 1cm),
    ),
    header-ascent: 45%,
    footer-descent: 1.1em,
    footer: context {
      set par(justify: false, leading: 0.6em)
      set text(font: font, size: 8pt, fill: muted)

      text(size: 8pt, weight: "bold", fill: ia-color, tracking: 0.08em)[INGÉNIERIE ET ARCHITECTURE]
      v(0.4em, weak: true)
      line(length: 100%, stroke: 0.5pt + rule-color)
      v(0.55em, weak: true)

      grid(
        columns: (auto, 1fr, auto),
        column-gutter: 0.9em,
        align: (left + horizon, left + horizon, right + horizon),
        image("imgs/hes-corner-bottom.svg", width: 0.85cm),
        [
          #text(size: 8.5pt, weight: "bold", fill: ink, title) \
          HES-SO / MSE 
          #sym.dot.c #date.display("[day].[month].[year]")
          #sym.dot.c #author
        ],
        [
          #text(fill: ia-color, state) \
          #text(size: 8.5pt, weight: "bold", fill: ink)[
            #numbering("1 / 1", ..counter(page).get(), ..counter(page).at(<end-document>))
          ]
        ],
      )
    },
  )

  // TABLE OF CONTENTS
  set outline.entry(fill: box(width: 1fr, repeat(text(fill: rule-color)[.], gap: 0.35em)))
  show outline.entry: set text(font: font, fill: ink)
  show outline.entry.where(level: 1): it => {
    v(0.75em)
    set text(size: 12.5pt, weight: "bold")
    it
  }
  show outline.entry.where(level: 2): set text(size: 10pt)
  show outline.entry.where(level: 3): set text(size: 9.5pt, fill: muted)

  outline(target: selector(heading).before(<appendix>), title: tr("toc"), depth: 3)

  // FRONT MATTER
  pagebreak()
  [
    = #tr("declaration")
    #tr("declaration_content")

    #v(2.5em)
    #align(right)[
      #block(width: 46%)[
        #set par(justify: false)
        #line(length: 100%, stroke: 0.5pt + rule-color)
        #v(0.6em)
        #align(left)[
          #grid(
            columns: (auto, auto),
            column-gutter: 1.4em,
            row-gutter: 0.55em,
            field-label(tr("date")), date.display("[day].[month].[year]"),
            field-label(tr("name")), author,
          )
        ]
      ]
    ]
  ]

  pagebreak()
  set heading(numbering: "1.")
  body
  [#h(0.1em) <end-document>]
}

#let appendix(
  lang: "en",
  body,
) = {
  let t = (
    en: (
      appendix: "Appendix",
      appendices: "Appendices",
    ),
    fr: (
      appendix: "Annexe",
      appendices: "Annexes",
    ),
  )

  let tr(key) = t.at(lang).at(key)

  set heading(numbering: "A", supplement: [#tr("appendix")])
  counter(heading).update(0)

  outline(target: heading.where(supplement: [#tr("appendix")]), title: tr("appendices"))
  pagebreak()

  set figure(numbering: (..num) => context {
    counter(heading).display()
  })
  body
}
