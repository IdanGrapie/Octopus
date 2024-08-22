# Use Node.js official image
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install the Node.js dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port 3000 for the NodeJS app
EXPOSE 3000

# Start the application
CMD ["node", "app.js"]
