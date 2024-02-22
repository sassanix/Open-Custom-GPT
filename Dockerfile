# Use the official Node.js 18 image
FROM node:18-slim

# Set environment variables
ENV TZ=UTC \
    DEBIAN_FRONTEND=noninteractive

# Create and set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of your application's code
COPY . .

# Build your Next.js application
RUN npm run build

# Your Next.js application will run on port 3000 by default
EXPOSE 3000

# Start the Next.js application
CMD ["npm", "start"]
