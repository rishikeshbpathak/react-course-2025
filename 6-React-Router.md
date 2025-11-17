# React Hooks (Hinglish Explanation)

React Hooks are special React functions jo functional components ko state, lifecycle, aur performance features use karne ka power dete hain — bina class components ke.

---

## Why Hooks?

- Functional components ko powerful banane ke liye  
- State manage karne ke liye  
- Lifecycle events handle karne ke liye  
- Reusable logic banane ke liye  
- Performance optimize karne ke liye

---

# 1. useState — State manage karne ke liye

Meaning:  
useState kisi value ko remember (yaad) rakhne ke liye use hota hai.

Example:
```jsx
import { useState } from "react";

function Counter() {
    const [count, setCount] = useState(0);

    return (
        <>
            <p>Count: {count}</p>
            <button onClick={() => setCount(count + 1)}>Increment</button>
        </>
    );
}
```

Hinglish:  
count value store karega. setCount us value ko change karega. Jab value change hogi → component re-render hoga.

---

# 2. useEffect — Side effects ke liye

Meaning:  
Component mount, update, ya unmount par side effects chalane ke liye use hota hai.

Example:
```jsx
import { useEffect } from "react";

useEffect(() => {
    console.log("Component mounted");
    return () => {
        console.log("Component unmounted");
    };
}, []);
```

Hinglish:  
Ye code sirf ek baar chalega (on mount) agar dependency array empty ho. Dependencies change hongi to effect dubara chalega. Cleanup bhi kar sakte ho.

---

# 3. useRef — DOM access & non-render values

Meaning:  
useRef ek value ko hold karta hai jo change hone par component re-render nahi hota.

Example:
```jsx
import { useRef } from "react";

function TextInput() {
    const inputRef = useRef(null);

    const focusInput = () => {
        inputRef.current?.focus();
    };

    return (
        <>
            <input ref={inputRef} />
            <button onClick={focusInput}>Focus</button>
        </>
    );
}
```

Hinglish:  
inputRef se hum input element ko directly access kar sakte hain. Ref ki value update hogi, but UI re-render nahi hoga.

---

# 4. useContext — Global data share karne ke liye

Meaning:  
useContext React context ka data directly access karta hai — bina props pass kiye.

Example:
```jsx
import { useContext } from "react";
import { ThemeContext } from "./ThemeContext";

function ThemedComponent() {
    const theme = useContext(ThemeContext);
    return <div style={{ background: theme.background }}>Hello</div>;
}
```

Hinglish:  
Props drilling nahi karna padega. Data direct mil jayega.

---

# 5. useReducer — Complex state logic

Meaning:  
useReducer useState ka advanced version hai — jab state complex ho.

Example:
```jsx
import { useReducer } from "react";

function reducer(state, action) {
    switch (action.type) {
        case "increment":
            return { count: state.count + 1 };
        case "decrement":
            return { count: state.count - 1 };
        default:
            return state;
    }
}

function Counter() {
    const [state, dispatch] = useReducer(reducer, { count: 0 });

    return (
        <>
            <p>Count: {state.count}</p>
            <button onClick={() => dispatch({ type: "increment" })}>+</button>
            <button onClick={() => dispatch({ type: "decrement" })}>-</button>
        </>
    );
}
```

Hinglish:  
dispatch → action bhejega. reducer → state update karega. Use when multiple states ho, complex logic ho, ya predictable changes chahiye.

---

# 6. useMemo — Heavy calculations optimize

Meaning:  
useMemo kisi calculation ka result memoize karta hai taaki calculation bar-bar na ho.

Example:
```jsx
import { useMemo } from "react";

function Expensive({ value }) {
    const result = useMemo(() => heavyFunction(value), [value]);
    return <div>{result}</div>;
}
```

Hinglish:  
heavyFunction dobara run nahi hoga jab tak dependency change nahi hoti.

---

# 7. useCallback — Function recreation rokne ke liye

Meaning:  
useCallback function ko memoize karta hai taaki har render par new function na bane.

Example:
```jsx
import { useCallback } from "react";

function Parent() {
    const handleClick = useCallback(() => {
        console.log("Clicked");
    }, []);

    return <Child onClick={handleClick} />;
}
```

Hinglish:  
handleClick same function return karega across renders jab dependencies same ho.

---

# 8. memo() — Component re-render control

Meaning:  
memo higher-order component hai jo component ko tabhi re-render karega jab props change hon.

Example:
```jsx
import { memo } from "react";

function MyComponent({ value }) {
    return <div>{value}</div>;
}

export default memo(MyComponent);
```

Hinglish:  
Props same → component re-render nahi hoga. Performance boost milega.

---

Final 

| Hook      | Purpose                                       |
|-----------|-----------------------------------------------|
| useState  | State store & update                           |
| useEffect | Side effects (API calls, timers, subscriptions)|
| useRef    | DOM access & non-render value                  |
| useContext| Global data access                             |
| useReducer| Complex state logic                            |
| useMemo   | Heavy calculations optimize                    |
| useCallback| Function recreation control                    |
| memo      | Component re-render control                    |