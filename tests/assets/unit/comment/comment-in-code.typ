#let  /* 1 */  f( /* 2 */ x)   /* 3 */  =  /* 4 */  {
    /* 5 */   context     /* 6 */ {
let   /* 1 */   a  /* 2 */  =  /* 3 */  1
let  /* 1 */  ( /* 2 */ a /* 3 */ , /* 4 */  b   /* 5 */ ) /* 6 */  =   /* 7 */  (2, 3)
  ( /* 2 */ a /* 3 */ , /* 4 */  b   /* 5 */ ) /* 6 */  =   /* 7 */  (2, 3)
    /* 7 */    return  /* 8 */   none
  }
}

#{
  -  1  - + 7 +( +   7*- 3-6)
}
#{
  -1  /* 2 */ - /* 1 */+/* 0 */ 7 /* 1 */ +/* 2 */(  /* 3 */+ /* 4 */   7 /* 5 */* /* 6 */  -3/* 7 */  -  6/* 8 */)
}
#{
  not  a  and(  b  or  c  )
}
#{
  not  true  and(  false  or  true  )
}
#{
/* 0 */  not /* 1 */  true /* 2 */ and/* 3 */( /* 4 */  false   /* 5 */or  /* 6 */true/* 7 */)
}
