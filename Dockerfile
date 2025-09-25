# Dockerfile for Nexus Gateway (Rust)

# Use a Rust base image
FROM rust:1.79-slim-bookworm AS builder

# Set working directory
WORKDIR /app

# Install system dependencies for PostgreSQL and SSL
RUN apt-get update && apt-get install -y \
    pkg-config \
    libssl-dev \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Copy Cargo.toml and Cargo.lock (if exists) to leverage Docker cache
COPY Cargo.toml Cargo.lock ./ 

# Create a dummy src/main.rs to build dependencies first
RUN mkdir src && echo "fn main() {}\n" > src/main.rs
RUN cargo build --release --bin nexus-core || true

# Copy the rest of the source code
COPY src ./src

# Build the release binary
RUN cargo build --release --bin nexus-core

# --- Final stage ---
FROM debian:bookworm-slim

# Set working directory
WORKDIR /app

# Install runtime dependencies
RUN apt-get update && apt-get install -y \
    libssl3 \
    postgresql-client-14 \
    && rm -rf /var/lib/apt/lists/*

# Copy the built binary from the builder stage
COPY --from=builder /app/target/release/nexus-core .

# Expose the port Nexus Gateway listens on
EXPOSE 3000

# Run the Nexus Gateway
CMD ["./nexus-core"]


