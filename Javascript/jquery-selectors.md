# jQuery Selectors

### Select DOM elements that attribute value is EQUAL to an specific string
```
let dom = $("tag[attr='chain']");

dom = $("span[name='dark-type-evolution']"); 

/*
dom = { 
  ► 0: <span class='pokemon eevee' name='dark-type-evolution'>Umbreon</span>
    length: 1
};
*/
```

### Select DOM elements that attribute value is NOT EQUAL an specific string
```
let dom = $("tag[attr!='chain']");

dom = $("span[name!='dark-type-evolution']");

/*  
dom = { 
  ► 0: <span class='pokemon eevee' name='normal-type'>Eevee</span>
  ► 1: <span class='pokemon eevee' name='electric-type-evolution'>Jolteon</span>
  ► 2: <span class='pokemon eevee' name='fairy-type-evolution'>Sylveon</span>
  ...
};
*/
```

### Select DOM elements that attribute value STARTS with an specific string
```
let dom = $("tag[attr^='chain']");

dom = $("span[name^='fire']"); 

/* 
dom = { 
  ► 0: <span class='pokemon eevee' name='fire-type-evolution'>Flareon</span>
    length: 1
};
*/
```

### Select DOM elements that attribute value ENDS with an specific string
```
let dom = $("tag[attr$='chain']");

dom = $("span[name$='evolution']"); 

/*  
dom = { 
  ► 0: <span class='pokemon eevee' name='dark-type-evolution'>Umbreon</span>
  ► 1: <span class='pokemon eevee' name='electric-type-evolution'>Jolteon</span>
  ► 2: <span class='pokemon eevee' name='fairy-type-evolution'>Sylveon</span>
  ...
};
*/
```

### Select DOM elements that attribute value ONLY CONTAINS an specific string
```
let dom = $("tag[attr*='chain']");

dom = $("span[class*='eevee']");

/*  
dom = {
    length: 0
};
*/

dom = $("span[name*='normal-type']");

/*  
dom = {
  ► 0: <span class='pokemon eevee' name='normal-type'>Eevee</span>
    length: 1
};
*/
```

### Select DOM elements that attribute value CONTAINS an specific string
_Including DOM elements that have this attribute with that string and other strings delimitated by spaces_
```
let dom = $("tag[attr~='chain']");

dom = $("span[class~='eevee']"); 

/*  
dom = { 
  ► 0: <span class='pokemon eevee' name='normal-type'>Eevee</span>
  ► 1: <span class='pokemon eevee' name='dark-type-evolution'>Umbreon</span>
  ► 2: <span class='pokemon eevee' name='electric-type-evolution'>Jolteon</span>
  ...
};
*/
```

