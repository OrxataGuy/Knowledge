# jQuery Selectors

### Select DOM elements that attribute value is EQUAL to an specific string
```
let dom = $("tag[attr='chain']");
```

### Select DOM elements that attribute value is NOT EQUAL an specific string
```
let dom = $("tag[attr!='chain']");
```

### Select DOM elements that attribute value STARTS with an specific string
```
let dom = $("tag[attr^='chain']");
```

### Select DOM elements that attribute value ENDS with an specific string
```
let dom = $("tag[attr$='chain']");
```

### Select DOM elements that attribute value ONLY CONTAINS an specific string
```
let dom = $("tag[attr*='chain']");
```

### Select DOM elements that attribute value CONTAINS an specific string
_Including DOM elements that have this attribute with that string and other strings delimitated by spaces_
```
let dom = $("tag[attr~='chain']");
```

