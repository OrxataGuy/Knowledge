# jQuery Selectors

### Select DOM elements that attribute value is EQUAL to an specific string
```
let dom = $("tag[attr='chain']");

dom = $("span[name='dark-type-evolution']"); 

/*  EXPECTED OUTPUT
dom = [ 
  <span class='pokemon eevee' name='dark-type-evolution'>Umbreon</span>
];
*/
```

### Select DOM elements that attribute value is NOT EQUAL an specific string
```
let dom = $("tag[attr!='chain']");

dom = $("span[name!='dark-type-evolution']");

/*  EXPECTED OUTPUT
dom = [ 
  <span class='pokemon eevee' name='electric-type-evolution'>Jolteon</span>
  <span class='pokemon eevee' name='fairy-type-evolution'>Sylveon</span>
  <span class='pokemon eevee' name='fire-type-evolution'>Flareon</span>
  ...
];
*/
```

### Select DOM elements that attribute value STARTS with an specific string
```
let dom = $("tag[attr^='chain']");

dom = $("span[name^='fire']"); 

/*  EXPECTED OUTPUT
dom = [ 
  <span class='pokemon eevee' name='fire-type-evolution'>Flareon</span>
];
*/
```

### Select DOM elements that attribute value ENDS with an specific string
```
let dom = $("tag[attr$='chain']");

dom = $("span[name$='evolution']"); 

/*  EXPECTED OUTPUT
dom = [ 
  <span class='pokemon eevee' name='dark-type-evolution'>Umbreon</span>
  <span class='pokemon eevee' name='electric-type-evolution'>Jolteon</span>
  <span class='pokemon eevee' name='fairy-type-evolution'>Sylveon</span>
  ...
];
*/
```

### Select DOM elements that attribute value ONLY CONTAINS an specific string
```
let dom = $("tag[attr*='chain']");

dom = $("span[class*='eevee']");

/*  EXPECTED OUTPUT
dom = [ ];
*/

dom = $("span[name*='normal-type']");

/*  EXPECTED OUTPUT
dom = [ 
  <span class='pokemon eevee' name='normal-type'>Eevee</span>
];
*/
```

### Select DOM elements that attribute value CONTAINS an specific string
_Including DOM elements that have this attribute with that string and other strings delimitated by spaces_
```
let dom = $("tag[attr~='chain']");

dom = $("span[class~='eevee']"); 

/*  EXPECTED OUTPUT
dom = [ 
  <span class='pokemon eevee' name='normal-type'>Eevee</span>
  <span class='pokemon eevee' name='dark-type-evolution'>Umbreon</span>
  <span class='pokemon eevee' name='electric-type-evolution'>Jolteon</span>
  ...
];
*/
```

