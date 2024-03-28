#let 六面体 = {
  import draw: *
  let neg(u) = if u == 0 { 1 } else { -1 }
  for (p, c) in (
    ((0, 0, 0), black), ((1, 1, 0), red),
    ((1, 0, 1), blue), ((0, 1, 1), green),
  ) {
    line(vector.add(p, (0, 0, neg(p.at(2)))), p, stroke: c)
    line(vector.add(p, (0, neg(p.at(1)), 0)), p, stroke: c)
    line(vector.add(p, (neg(p.at(0)), 0, 0)), p, stroke: c)
  }
}


#let 六面体 = {
  for (pppppppppppppppppppppppppppppppppppppppppp, cccccccccccccccccccccccccccccccc, b) in (
    (111111, 111111111, 1),
  ) {
    "111111111111111111111111111111111"
  }
}


#{
  for (i, n) in arr.enumerate() {
    11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
  }
}
