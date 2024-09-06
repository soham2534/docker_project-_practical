# Use an official Node.js image as the base
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the project dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React application for production
RUN npm run build

# Install serve to serve the production build
RUN npm install -g serve

# Expose the port the app will run on
EXPOSE 3000

# Command to run the app using serve
CMD ["serve", "-s", "build", "-l", "3000"]
