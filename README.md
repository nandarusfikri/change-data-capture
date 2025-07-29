# change-data-capture


{
    "connector.class": "io.debezium.connector.jdbc.JdbcSinkConnector",
    "tasks.max": "1",
    "topics": "sfs.public.customers",
    "connection.url": "jdbc:postgresql://postgres:5432/warehouse",
    "connection.username": "postgres",
    "connection.password": "postgres",
    "insert.mode": "upsert",
    "delete.enabled": "false",
    "primary.key.mode": "record_value",
    "primary.key.fields": "id",
    "auto.create.tables": "true",
    "auto.evolve.tables": "true",
    "table.name.format": "customers",
    "schema.evolution": "basic"

}


{
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "tasks.max": "1",
    "plugin.name": "pgoutput",
    "database.hostname": "postgres",
    "database.port": "5432",
    "database.user": "postgres",
    "database.password": "postgres",
    "database.dbname": "inventory",
    "database.server.name": "sfs_server",
    "schema.include.list": "public",
    "table.include.list": "public.customers",
    "slot.name": "debezium_slot",
    "topic.prefix": "sfs",
    "topic.naming.strategy": "io.debezium.schema.SchemaTopicNamingStrategy"
}

http://localhost:8083/connectors/source_postgres/config

Database: sales
🔹 Table: orders

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_name VARCHAR(100),
  product VARCHAR(100),
  quantity INT,
  order_date TIMESTAMP DEFAULT NOW()
);



Database: warehouse
🔹 Table: inventory


CREATE TABLE inventory (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(100),
  stock INT,
  last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);




