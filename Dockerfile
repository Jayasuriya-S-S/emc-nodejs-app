# Use official Node.js image 
FROM node:18

# Set working directory
WORKDIR /app

# Copy only package files first (better for caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the source code
COPY . .

# Fix file permissions (avoid security warning)
RUN chmod -R 755 /app

# Expose app port
EXPOSE 3000

# Start the app
CMD ["node", "index.js"]
