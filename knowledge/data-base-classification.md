## I. **По модели хранения данных (тип данных и их организация)**

|Класс БД|Краткое описание|Примеры|
|---|---|---|
|**Реляционные (SQL)**|Таблицы, строки, столбцы, фиксированная схема|PostgreSQL, MySQL, Oracle, SQL Server|
|**Документно-ориентированные**|JSON/BSON-документы, полуструктурированные данные|MongoDB, CouchDB, ArangoDB (частично)|
|**Ключ-значение (KV-store)**|Простая структура: ключ → значение|Redis, RocksDB, DynamoDB, etcd|
|**Графовые**|Узлы и связи, идеально для связанных данных|Neo4j, ArangoDB, JanusGraph, TigerGraph|
|**Колонко-ориентированные**|Данные хранятся по столбцам (оптимально для аналитики)|ClickHouse, Apache Cassandra, HBase|
|**Time-series (временные ряды)**|Оптимизированы для метрик и событий по времени|InfluxDB, TimescaleDB, Prometheus|
|**Объектно-ориентированные**|Хранят объекты с их методами/поведением|db4o, ObjectDB, Gemstone|
|**Многомодельные**|Поддерживают несколько типов данных (графы, JSON, таблицы и т.д.)|ArangoDB, OrientDB, Couchbase|
|**Троичные / RDF / Онтологические**|Хранят семантические знания: субъект–предикат–объект|Stardog, GraphDB, Blazegraph, Virtuoso|
|**Версионные / фактографические**|Поддерживают версионирование и "исторические" представления|TerminusDB, Datomic|

---

## II. **По типу обработки**

|Тип БД|Назначение|Примеры|
|---|---|---|
|**OLTP (оперативные транзакции)**|Быстрые записи, короткие транзакции|PostgreSQL, MySQL, Oracle|
|**OLAP (аналитика)**|Массовая агрегация, отчёты, сложные запросы|ClickHouse, Apache Druid, Redshift|
|**HTAP (гибрид OLTP/OLAP)**|Комбинируют транзакции и аналитику|TiDB, SingleStore, SAP HANA|

---

## III. **По способу масштабирования**

|Тип|Описание|Примеры|
|---|---|---|
|**Вертикальное (scale-up)**|Увеличение мощности одного сервера|PostgreSQL, Oracle|
|**Горизонтальное (scale-out)**|Распределение данных между узлами|Cassandra, DynamoDB, CockroachDB|

---

## IV. **По модели консистентности и согласованности**

|Тип|Согласованность|Примеры|
|---|---|---|
|**ACID**|Полная транзакционная строгость|PostgreSQL, Oracle|
|**BASE**|Гибкая, eventually consistent|Cassandra, DynamoDB, Couchbase|

---

## V. **По хостингу / архитектуре**

|Архитектура|Примеры|
|---|---|
|**Встроенные (embedded)**|SQLite, DuckDB, LevelDB|
|**Клиент-серверные**|PostgreSQL, MySQL, MongoDB|
|**Распределённые**|Cassandra, CockroachDB, FoundationDB|
|**Облачные (DBaaS)**|Amazon Aurora, Firebase, Google Bigtable|

---

## Примеры систем с пересечением:

|Система|Категория|
|---|---|
|**MongoDB**|Документная, клиент-сервер, BASE|
|**Neo4j**|Графовая, ACID, клиент-сервер|
|**Redis**|Ключ-значение, in-memory, scale-out|
|**ClickHouse**|Колонко-ориентированная, OLAP, масштабируемая|
|**TerminusDB**|RDF-граф + версионность, reasoning|
|**ArangoDB**|Гибрид (граф + документы + KV), многомодельная|
|**TimescaleDB**|Временные ряды, на базе PostgreSQL|
|**Datomic**|Фактографическая, immutable, с версионностью|

---

## Какая БД подходит под что?

|Назначение|Лучшая БД|
|---|---|
|**Финансовые транзакции**|PostgreSQL, Oracle (ACID)|
|**Связные данные, reasoning**|Neo4j, GraphDB, TerminusDB|
|**Массовая аналитика**|ClickHouse, BigQuery|
|**Высокая скорость записи**|InfluxDB, Cassandra|
|**Документы, API-бэкенды**|MongoDB, Couchbase|
|**Гибкая модель + связи**|ArangoDB|
|**Поиск по embedding/LLM**|Weaviate, Qdrant, Pinecone (векторные)|
