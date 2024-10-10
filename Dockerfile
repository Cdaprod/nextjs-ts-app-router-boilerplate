# Stage 1: Build the Next.js application
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json tsconfig.json ./
COPY public ./public
COPY app ./app
COPY styles ./styles

# Install all dependencies
RUN npm ci

# Build the Next.js app
RUN npm run build

# Stage 2: Serve the Next.js application with a lightweight server
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install production dependencies
COPY package.json package-lock.json ./
RUN npm ci --only=production

# Copy built files from the builder stage
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/app ./app
COPY --from=builder /app/styles ./styles

# Expose the port the app runs on
EXPOSE 3000

# Set environment variables
ENV NODE_ENV=production

# Start the Next.js application
CMD ["npm", "start"]