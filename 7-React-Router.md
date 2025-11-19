# 🚀 State Management

State management woh process hai jisme hum app ke andar use hone wala data manage karte hain — kaise data store hoga, kaise update hoga, aur kaise components ke beech share hoga.

## 🔻 1. Prop Drilling Problem

Prop drilling woh problem hai jab ek parent component ko apna data multiple child components ke through neeche pass karna padta hai — even agar beech ke components ko us data ki zaroorat na ho.

Example:
App → A → B → C → D  
Agar D ko data chahiye, toh App ko data har level par props ke through pass karna padta hai.

Problems:
- Code messy ho jata hai
- Unnecessary props pass karne padte hain
- Maintain karna mushkil ho jata hai

## 🔹 2. Context API

Context API React ka built-in solution hai jo prop drilling ko avoid karta hai.

Kaise kaam karta hai?
- Aap ek Context create karte ho
- Usme value/data store karte ho
- Koi bhi component useContext() se directly data access kar leta hai
- Props pass karne ki zaroorat nahi padti

Benefits:
- Prop drilling khatam
- Code clean rehta hai
- Small/medium apps ke liye perfect solution

## 🔸 3. Redux Introduction

Redux ek popular state management library hai jo large scale apps me use hoti hai.

Redux kyun use karte hain?
- Pure app ka data ek centralized Store me rehta hai
- State predictable hoti hai
- Debugging easy hoti hai
- Complex apps me data flow manage karna aasaan hota hai

## 🔧 4. Redux Setup

Install:
```bash
npm install redux react-redux
```

Basic steps:
1. Ek Store create karna
2. Reducer define karna
3. App ko Provider ke andar wrap karna
4. Components me useSelector & useDispatch use karna

## 🧰 5. Redux Toolkit (RTK) Overview

Redux Toolkit Redux ka modern aur simplified version hai. Ye boilerplate code ko kam karta hai aur development faster banata hai.

Features:
- createSlice() → Actions + Reducers ek saath
- configureStore() → Simple store setup
- createAsyncThunk() → Easy async/API handling
- Clean aur short code

## ⚙️ 6. Actions, Reducers, Store Configuration

### Actions
Actions simple objects hote hain jo batate hain ki state me kya change karna hai.

Example:
```js
{ type: "increment" }
```

### Reducers
Reducers wo functions hote hain jo old state + action lekar new state return karte hain.

Example:
```js
function counterReducer(state = 0, action) {
    if (action.type === "increment") {
        return state + 1;
    }
    return state;
}
```

### Store
Store wo jagah hai jahan poori app ka data centralized form me store hota hai.

Redux Toolkit me:
```js
import { configureStore } from "@reduxjs/toolkit";
import counterSlice from "./counterSlice";

const store = configureStore({
    reducer: counterSlice.reducer
});
```

## Summary (Hinglish Style)
----------------------------------------------------------------------
| Topic          | Hinglish Explanation                              |
|----------------|---------------------------------------------------|
| Prop Drilling  | Jab data ko har level me props se pass karna pade |
| Context API    | Jab bina props data share karna ho                |
| Redux          | Large apps ka data manager                        |
| Redux Toolkit  | Redux ko easy aur fast bana deta hai              |
| Actions        | State me kya karna hai                            |
| Reducers       | State kaise change hogi                           |
| Store          | App ka data center                                |
