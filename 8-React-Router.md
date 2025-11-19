## Working with APIs

React me APIs ke saath kaam karna aaj-kal har project ka important part hota hai. API basically server se data lane ya server ko data bhejne ka tareeka hota hai.

### REST API Integration using Axios / Fetch

React me API call karne ke do popular ways hote hain:

1. Fetch API

Fetch ek built-in browser function hota hai. Aap isse directly API hit kar sakte ho.

Example:

```js
fetch("https://api.example.com/users")
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(err => console.error(err));
```

2. Axios

Axios ek 3rd-party library hai, jise use karna easier hota hai kyunki error handling aur JSON conversion automatic hota hai.

Install:

```bash
npm install axios
```

Example:

```js
import axios from "axios";

axios.get("https://api.example.com/users")
    .then(res => console.log(res.data))
    .catch(err => console.error(err));
```

Difference:

- Axios cleaner aur easy hota hai.
- Fetch built-in hota hai, extra install nahi karna padta.

### Handling Loading and Error States

API call hone me time lagta hai, isliye hume user ko batana hota hai ki data load ho raha hai ya koi error aayi hai.

Generally 3 states handle karni hoti hain:

- Loading state → jab data aane ka wait ho
- Success state → jab data successfully mil jaye
- Error state → jab API fail ho jaye

Example (Hinglish thinking):

- Jab API call start ho, loading = true
- Jab data aa jaye, loading = false aur data set
- Agar error aaye, error message show karo

Simple React example pattern:

```js
const [data, setData] = useState(null);
const [loading, setLoading] = useState(false);
const [error, setError] = useState(null);

const fetchData = async () => {
    setLoading(true);
    setError(null);
    try {
        const res = await axios.get("/users");
        setData(res.data);
    } catch (err) {
        setError(err.message || "Something went wrong");
    } finally {
        setLoading(false);
    }
};
```

### CRUD Operations in React

CRUD ka matlab hota hai:

| Operation | Meaning |
|---|---|
| C | Create — Data create karna |
| R | Read — Data read/fetch karna |
| U | Update — Data update karna |
| D | Delete — Data delete karna |

React me CRUD operations normally API ke through hote hain:

- Create → POST request
- Read → GET request
- Update → PUT/PATCH request
- Delete → DELETE request

Examples:

```js
axios.post("/users", newUser);
axios.get("/users");
axios.put("/users/1", updatedUser); // ya axios.patch
axios.delete("/users/1");
```

### Using Async/Await in API Calls

Async/await se API code cleaner aur easy-to-read ban jata hai.

Example:

```js
const getUsers = async () => {
    try {
        const res = await axios.get("/users");
        console.log(res.data);
    } catch (error) {
        console.log("Error:", error);
    }
};
```

Benefits of async/await:

- Code clean dikhta hai
- Try/catch se error handling easy hoti hai
- Promise chaining avoid hoti hai

## Summary (Hinglish Style)

| Topic | Explanation |
|---|---|
| API Integration | Axios ya Fetch se server se data lana |
| Loading/Error | User ko data load aur error dikhaana |
| CRUD in React | Create / Read / Update / Delete API calls |
| Async/Await | API code clean aur readable banata hai |


## Example: Get All Users & Show in Table
Example: Get All Users & Show in Table

```js
 import React, { useEffect, useState } from "react";
import axios from "axios";

const UsersTable = () => {
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  const fetchUsers = async () => {
    try {
      const res = await axios.get("https://jsonplaceholder.typicode.com/users");
      setUsers(res.data);
    } catch {
      setError("Error loading users");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchUsers();
  }, []);

  if (loading) return <p>Loading...</p>;
  if (error) return <p>{error}</p>;

  return (
    <table border="1" cellPadding="8">
      <thead>
        <tr>
          <th>ID</th><th>Name</th><th>Email</th>
        </tr>
      </thead>

      <tbody>
        {users.map(u => (
          <tr key={u.id}>
            <td>{u.id}</td>
            <td>{u.name}</td>
            <td>{u.email}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default UsersTable;
```

--

Component load hote hi fetchUsers() API call karta hai

Data users me save hota hai

Agar API slow hai → “Loading…”

Agar error aayi → “Error loading users”

Users ko .map() se table rows me show kiya