#set page(
  paper: "a4",
  margin: (x: 1.2cm, y: 1.2cm),
)

#set text(
  font: ("Linux Libertine", "Liberation Serif", "serif"),
  size: 10.5pt,
  lang: "de"
)

// Design-Elemente
#let primary-color = rgb("#1A5276")
#let accent-color = rgb("#D4E6F1")

// Header
#align(center)[
  #block(
    fill: primary-color,
    inset: 12pt,
    radius: 5pt,
    width: 100%
  )[
    #text(fill: white, size: 22pt, weight: "bold")[Graphdatenbanken] \
    #text(fill: white, size: 11pt)[Datenverarbeitung im Zeitalter der Vernetzung]
  ]
]

#v(8pt)

== Was ist eine Graphdatenbank?
Eine Graphdatenbank ist ein Typ von NoSQL-Datenbank, die auf der *Graphentheorie* basiert. Im Gegensatz zu klassischen relationalen Datenbanken stehen hier nicht die Tabellen, sondern die *Beziehungen zwischen den Daten* im Mittelpunkt. Daten werden als Knoten und Kanten gespeichert, wobei die Beziehungen bereits beim Speichern physisch im System hinterlegt sind ("Index-free Adjacency").

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    === Kernkomponenten
    - *Nodes (Knoten):* Repräsentieren Entitäten (z. B. Personen, Orte, Produkte). Ähnlich wie ein Datensatz in einer Tabelle.
    - *Edges (Kanten):* Repräsentieren die Beziehungen zwischen Knoten (z. B. "kennt", "gekauft", "lebt in"). Sie haben immer eine Richtung.
    - *Properties (Eigenschaften):* Zusätzliche Informationen (Key-Value Pairs), die sowohl an Knoten als auch an Kanten hängen können.
  ],
  [
    === Das Labeled Property Graph Modell
    #rect(
      fill: accent-color,
      stroke: primary-color,
      radius: 4pt,
      inset: 10pt,
      width: 100%
    )[
      #set align(center)
      *(Person)* --[LIEBT]--> *(Eis)* \
      $arrow.b$ \
      Knoten + Label + Attribute
    ]
  ]
)

#v(8pt)

== Graph vs. Relational (SQL)
In relationalen Datenbanken werden Beziehungen über Fremdschlüssel und teure `JOIN`-Operationen zur Laufzeit berechnet. Graphdatenbanken hingegen "verfolgen" einfach die vorhandenen Zeiger (Pointer).

#show table.cell.where(y: 0): set text(fill: white)
#table(
  columns: (1fr, 1fr, 1fr),
  inset: 8pt,
  fill: (x, y) => if y == 0 { primary-color } else { none },
  table.header(
    [*Feature*], [*Relational (RDBMS)*], [*Graphdatenbank*],
  ),
  [Struktur], [Tabellen (festes Schema)], [Netzwerke (flexibel)],
  [Beziehungen], [JOINs (langsam bei Tiefe)], [Traversierung (konstant schnell)],
  [Fokus], [Datenintegrität], [Datenvernetzung],
  [Skalierung], [Vertikal (meistens)], [Horizontal (Sharding komplex)]
)

#v(8pt)

== Warum Graphdatenbanken nutzen?
1. *Performance:* Abfragen über viele Ebenen (z. B. "Freunde von Freunden") sind um Größenordnungen schneller.
2. *Flexibilität:* Das Schema ist dynamisch. Neue Knotentypen oder Beziehungen können ohne Downtime hinzugefügt werden.
3. *Agilität:* Die Struktur der Datenbank entspricht oft direkt der Struktur der realen Welt oder des Business-Logik-Modells.

== Typische Anwendungsfälle
- *Social Networks:* Analyse von Nutzerinteraktionen und Empfehlungen.
- *Betrugserkennung:* Identifikation von verdächtigen Mustern in Transaktionsketten (Fraud Detection).
- *Knowledge Graphs:* Vernetzung von internem Unternehmenswissen (z. B. bei Google oder NASA).
- *Empfehlungsdienste:* "Kunden, die X gekauft haben, kauften auch Y".

#v(8pt)
#line(length: 100%, stroke: 0.5pt + gray)
#align(center)[
  #text(size: 9pt, style: "italic")[
    Bekannte Systeme: Neo4j, Amazon Neptune, Memgraph, ArangoDB.
  ]
]