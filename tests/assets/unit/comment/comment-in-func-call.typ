#let f(a, b, c: none) = {
  [#a]
}

#f(1, /* actually, b is ignored*/ 0, c: /* actually, c is ignored */ 0)

#f(1, /* .... */)[/* .... */b]

#align(center, table(
  columns: 4,
  align: (right, left, right, left),
  column-gutter: (1em, 1.5em, 1em),
  [$x^2$], [`x^2`],
  [$sqrt(2)$, $root(n, 3)$], [`sqrt(2)`, `root(n, 3)`],
  [$x_(i, j)$], [`x_(i, j)`],
  [$2 / 3$, $2 \/ 3$], [`2 / 3`, `2 \/ 3` or `2 slash 3`], // Maybe use `slash`?
))
