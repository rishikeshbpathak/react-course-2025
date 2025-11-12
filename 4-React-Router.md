# 🌀 React Router — Overview & Notes

## 📘 Overview (Concise Notes)
1. React Router se app me multiple pages jaisa experience milta hai bina reload ke.  
2. **BrowserRouter**, **Routes**, **Route** — ye main components hain.  
3. **Nested** & **Dynamic routes** se complex routing possible hoti hai.  
4. **useParams**, **useNavigate** se route data aur navigation handle hota hai.  
5. **Protected routes** se security aur access control manage karte hain.  

---

## 1️⃣ Introduction to Routing in React

React me routing ka matlab hota hai **alag–alag pages (ya components)** ke beech navigate karna bina page reload kiye.  
Normally ek React app ek single page hoti hai (Single Page Application — **SPA**),  
lekin **React Router** use karke hum multiple pages jaisa experience create kar sakte hain.

### 🔹 Example Routes:
/home → Home Component
/about → About Component
/contact → Contact Component

## 2️⃣ Setting up React Router DOM

### 🔧 Installation:
```bash
npm install react-router-dom
🔧 Import:
js
Copy code
import { BrowserRouter, Routes, Route } from "react-router-dom";
🔹 Example Setup:
jsx
Copy code
<BrowserRouter>
  <Routes>
    <Route path="/" element={<Home />} />
    <Route path="/about" element={<About />} />
  </Routes>
</BrowserRouter>
🔹 Dynamic Routing (Dynamic Paths)
jsx
Copy code
<Route path="/user/:id" element={<User />} />
Example URL → /user/1

3️⃣ Nested Routes (Andar wale Routes)
Nested routes ka matlab hota hai ek main route ke andar chhote routes —
jaise ek parent page ke andar child pages.

Example use case:

/dashboard/listofuser

/dashboard/profile

/dashboard/settings

🅰️ Example Code:
jsx
Copy code
import { BrowserRouter, Routes, Route, Outlet, Link } from "react-router-dom";

function Dashboard() {
  return (
    <div>
      <h2>Dashboard Page</h2>
      <nav>
        <Link to="profile">Profile</Link> | <Link to="settings">Settings</Link>
      </nav>

      {/* Outlet yahan child route render karega */}
      <Outlet /> 
    </div>
  );
}

function Profile() {
  return <h3>Profile Page</h3>;
}

function Settings() {
  return <h3>Settings Page</h3>;
}

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<h1>Home Page</h1>} />

        {/* Parent route */}
        <Route path="/dashboard" element={<Dashboard />}>
          {/* Child routes */}
          <Route path="profile" element={<Profile />} />
          <Route path="settings" element={<Settings />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
✅ Output:
bash
Copy code
/ → Home Page
/dashboard → Dashboard Page
/dashboard/profile → Dashboard Page + Profile Page
/dashboard/settings → Dashboard Page + Settings Page
4️⃣ Route Parameters and Navigation
🔹 Route Parameters (useParams)
jsx
Copy code
import { useParams } from "react-router-dom";

function User() {
  const { id } = useParams();
  return <h2>User Page - ID: {id}</h2>;
}
🅰️ URLs Example:

sql
Copy code
/user/1 → User Page - ID: 1  
/user/2 → User Page - ID: 2  
/user/abc → User Page - ID: abc
🔹 Navigation (useNavigate)
jsx
Copy code
import { useNavigate } from "react-router-dom";

const navigate = useNavigate();
navigate("/about");

5️⃣ Protected Routes and Redirects
Protected Routes wo hote hain jahan sirf logged-in user hi ja sakta hai.
Agar user login nahi hai, to usse automatically redirect kar diya jata hai login page pe.

🅰️ Example:
jsx
Copy code
import { Navigate } from "react-router-dom";

<Route 
  path="/dashboard" 
  element={isLoggedIn ? <Dashboard /> : <Navigate to="/login" />} 
/>
✅ Full Dynamic Route Example
jsx
Copy code
import { BrowserRouter, Routes, Route, useParams } from "react-router-dom";

function User() {
  const { id } = useParams();
  return <h2>User Page - ID: {id}</h2>;
}

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<h1>Home Page</h1>} />
        <Route path="/user/:id" element={<User />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
✅ Output:

sql
Copy code
/user/1 → “User Page - ID: 1”
/user/2 → “User Page - ID: 2”
/user/abc → “User Page - ID: abc”