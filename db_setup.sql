CREATE TABLE IF NOT EXISTS Orders(
    Order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    Order_date TEXT,
    Order_time TEXT
);


CREATE TABLE IF NOT EXISTS OrderDetails(
    Order_detail_id INTEGER PRIMARY KEY AUTOINCREMENT,
    Order_id INTEGER,
    pizza_id TEXT,
    quantity INTEGER
);


CREATE TABLE IF NOT EXISTS Pizzas(
    pizza_id TEXT PRIMARY KEY,
    pizza_type_id TEXT,
    size TEXT,
    price REAL
);


CREATE TABLE IF NOT EXISTS PizzaTypes(
    pizza_type_id TEXT PRIMARY KEY,
    pizza_name TEXT,
    category TEXT,
    ingredients TEXT
)