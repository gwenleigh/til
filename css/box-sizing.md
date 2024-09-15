# `box-sizing`

- `box-sizing: border-box;:`
   - Standard Property: This is the standard CSS property for specifying how the total width and height of an element are calculated. When you use `box-sizing: border-box;`, the width and height properties include the element's padding and border in the total width and height calculation. This means that if you set an element's width to 100px, that width will include any padding and border, rather than adding them on top of it.

```
{
    /* box sizing */
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
}
```