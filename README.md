# Neo4j Demo

This project provides a simple Neo4j setup using Docker Compose and a Python script for data ingestion.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Python 3.x](https://www.python.org/downloads/)

## Getting Started

### 1. Spin up Neo4j

Use Docker Compose to start the Neo4j container:

```bash
docker-compose up -d
```

### 2. Visualization Web UI

Neo4j comes with a built-in visualization tool called **Neo4j Browser**.

- **URL:** [http://localhost:7474](http://localhost:7474)
- **Username:** `neo4j`
- **Password:** `password123` (as defined in `docker-compose.yml`)

### 3. Insert Data

You can insert sample data using the provided Python script.

Activate the virtual environment and run the script:
```bash
source .venv/bin/activate
python ingest.py
```

Or run it directly using the venv's python:
```bash
./.venv/bin/python ingest.py
```

### 4. Query and Visualize

Go to the [Neo4j Browser](http://localhost:7474), and run the following Cypher query to see the graph:

```cypher
MATCH (n) RETURN n
```

Click on the nodes and relationships in the visualization to see their properties.

## Files

- `docker-compose.yml`: Configuration for the Neo4j container.
- `ingest.py`: A Python script demonstrating how to use the Neo4j driver to create nodes and relationships.
