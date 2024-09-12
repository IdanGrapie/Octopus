# Start with a Node.js base image
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies, including Jest for testing
RUN npm install

# Copy the rest of your application files
COPY . .

# Run tests by default
CMD ["npm", "test"]
