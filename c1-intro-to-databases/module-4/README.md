# Module 4: Database Design

## **What is a Database Schema?**

A **database schema** is the **logical structure**
that defines how data is organized and stored in a database.
It includes:

- **Tables**
- **Columns and data types**
- **Constraints (e.g., primary keys, foreign keys, unique constraints)**
- **Indexes**
- **Views**
- **Stored procedures, functions, and triggers**

The schema acts as a blueprint that determines how data is related and managed.

---

## **Schema Implementation in MySQL, PostgreSQL, and Microsoft SQL Server (MSSQL)**

### MySQL Schema

In **MySQL**, a schema is **essentially the same as a database**.
When you create a new schema, you are actually creating a new database.

There is no separation between schemas and databases in MySQL;
they are used interchangeably.

### Implementation in MySQL

To create a schema (database):

```sql
CREATE DATABASE my_schema;
```

To use a schema (database):

```sql
USE my_schema;
```

MySQL organizes schemas as **separate directories** on the file system,
where each schema (database) has its own set of tables.

### Key Points in MySQL

- No **namespaces** for objects within a schema;
  table names must be unique within a database.

- **Cross-schema queries** are supported using fully qualified table names:

  ```sql
  SELECT * FROM another_schema.table_name;
  ```

- MySQL does **not** support multiple schemas under a single database like PostgreSQL or MSSQL.

---

### PostgreSQL Schema

Unlike MySQL, **PostgreSQL separates the concept of a schema from a database**.
A **PostgreSQL database** can contain **multiple schemas**,
which serve as **namespaces**
to group database objects (tables, views, functions, etc.).

A schema allows multiple users to **logically separate their objects**
within the same database.

#### Implementation in PostgreSQL

- To create a schema:

```sql
CREATE SCHEMA my_schema;
```

To create a table within a schema:

```sql
CREATE TABLE my_schema.my_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
```

To set a default schema for a session:

```sql
SET search_path TO my_schema;
```

#### Key Points in PostgreSQL

- **Schemas act as namespaces**,
  meaning two schemas can have tables with the same name.
- Supports **cross-schema queries** by prefixing the schema name:

  ```sql
  SELECT * FROM my_schema.my_table;
  ```

- The default schema is **`public`**,
  but users can create their own schemas for better organization.
- Provides better **multi-tenancy support** by allowing multiple users
  to have separate schemas within the same database.

---

### Microsoft SQL Server (MSSQL) Schema

**MSSQL uses schemas as namespaces within a database**, similar to PostgreSQL.
A **schema is a logical container** that groups objects
such as tables, views, and stored procedures.

Unlike PostgreSQL, MSSQL uses **owners** to define who controls a schema.

#### **Implementation in MSSQL**

To create a schema:

```sql
CREATE SCHEMA my_schema;
```

To create a table within a schema:

```sql
CREATE TABLE my_schema.my_table (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL
);
```

To assign a schema to an existing table:

```sql
ALTER SCHEMA my_schema TRANSFER dbo.old_table;
```

#### Key Points in MSSQL

- **Schemas provide security control**: Permissions can be set
  at the schema level rather than at the table level.
- **Schemas allow organization within a database**, reducing clutter.
- **Cross-schema queries** are possible:

  ```sql
  SELECT * FROM my_schema.my_table;
  ```

- The default schema is **`dbo`**,
  but custom schemas can be created to organize data better.

---

## Comparison Table

| Feature                   | MySQL                                  | PostgreSQL                            | MSSQL                                 |
| ------------------------- | -------------------------------------- | ------------------------------------- | ------------------------------------- |
| **Schema Concept**        | Schema = Database                      | Multiple schemas per database         | Multiple schemas per database         |
| **Namespace Support**     | No (schema = database)                 | Yes (schemas act as namespaces)       | Yes (schemas act as namespaces)       |
| **Default Schema**        | No default (each database is separate) | `public`                              | `dbo`                                 |
| **Cross-Schema Queries**  | Only across databases                  | Yes, via schema.table notation        | Yes, via schema.table notation        |
| **Multi-Tenancy Support** | Limited (requires separate databases)  | Strong (multiple schemas in one DB)   | Strong (multiple schemas in one DB)   |
| **Security**              | Database-level privileges              | Schema-level privileges               | Schema-level privileges               |
| **Stored in Filesystem**  | Each schema is a separate directory    | All schemas exist within one database | All schemas exist within one database |

---

## Summary

1. **MySQL**: Treats schemas as databases; lacks namespace separation.
2. **PostgreSQL**: Supports multiple schemas within a database,
   providing better organization and multi-tenancy.
3. **MSSQL**: Uses schemas as logical containers for objects,
   offering security and organization.

For applications that need **better namespace organization or multi-tenancy**,
**PostgreSQL and MSSQL** are better choices.
If simplicity and lightweight design are priorities, **MySQL** works well.
