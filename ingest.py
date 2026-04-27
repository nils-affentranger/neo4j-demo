from neo4j import GraphDatabase

class Neo4jDemo:
    def __init__(self, uri, user, password):
        self.driver = GraphDatabase.driver(uri, auth=(user, password))

    def close(self):
        self.driver.close()

    def create_sample_data(self):
        with self.driver.session() as session:
            session.execute_write(self._create_nodes)

    @staticmethod
    def _create_nodes(tx):
        # Create Nodes
        tx.run("CREATE (p1:Person {name: 'Alice', age: 30})")
        tx.run("CREATE (p2:Person {name: 'Bob', age: 35})")
        tx.run("CREATE (c:Company {name: 'Neo4j Inc'})")
        
        # Create Relationships
        tx.run("""
            MATCH (a:Person {name: 'Alice'}), (b:Person {name: 'Bob'})
            CREATE (a)-[:KNOWS]->(b)
        """)
        tx.run("""
            MATCH (a:Person {name: 'Alice'}), (c:Company {name: 'Neo4j Inc'})
            CREATE (a)-[:WORKS_AT]->(c)
        """)
        print("Sample data created successfully!")

if __name__ == "__main__":
    # Wait for Neo4j to be ready in a real scenario
    # Default connection details
    URI = "bolt://localhost:7687"
    USER = "neo4j"
    PASSWORD = "password123"

    demo = Neo4jDemo(URI, USER, PASSWORD)
    try:
        demo.create_sample_data()
    finally:
        demo.close()
