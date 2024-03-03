import os
from pymongo import MongoClient

# Fetch MongoDB connection string from GitHub Secrets
MONGODB_CONNECTION_STRING = os.getenv("MONGODB_CONNECTION_STRING")

# Check if the connection string is available
if not MONGODB_CONNECTION_STRING:
    raise ValueError("MongoDB connection string not found in environment variables.")

# Connect to MongoDB
client = MongoClient(MONGODB_CONNECTION_STRING)
db = client.test_database
