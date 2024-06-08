# Stack trace
I was having trouble understanding the error messages on Dev Tool console. Being practically illiterate, I learnt hwo to identify the key information out of the error message. 

- Order: the order follows "most recent first". 
    - The error occurred first while running line 89 of `TILButtons.js`.
    - However moving from bottom to top, the most recent erorr would be at 45th character on line 53 of `TILButtonManager.js` in the example error message below. 
- The sequence starts from where the error actually occurred (top) and traces back through the calls that led to that point (bottom).
- The rest of the lines: as part of the stack trace, they provide a detailed report of the call stack at the point where the error occurred. This helps in tracing the sequence of function calls that led to the error.

    ```
    TILButtons.js:89  There has been a problem with your fetch operation: ReferenceError: textContent is not defined
        at fetchTextInArticle (TILButtonManager.js:53:45)       (<----- top)
        at createTILChildButtons (TILButtonManager.js:62:29)
        at createTILButtonSet (TILButtonManager.js:108:28)
        at TILButtons.js:84:29                                  (<----- bottom, the original call)
    ```