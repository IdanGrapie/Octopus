# Use MongoDB version 7.0.14 based on Ubuntu (Jammy)
FROM mongo:7.0.14-rc0-jammy

# Copy the MongoDB initialization script into the container
#/docker-entrypoint-initdb.d/ used to store shell or SQL scripts that you 
#want to be executed when a Docker container is started for the first time
COPY docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/

# Expose the default MongoDB port
EXPOSE 27017
