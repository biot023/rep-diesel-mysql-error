FROM ubuntu:24.04

SHELL ["/bin/bash", "-c"]

# Install dependencies, including MySQL client and Rust prerequisites
RUN apt-get update -y && apt-get install -y \
  build-essential \
  wget \
  curl \
  git \
  libssl-dev \
  mysql-client \
  neovim \
  openssl \
  pkg-config \
  tree \
  libmysqlclient-dev

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o install-rust.sh
RUN bash ./install-rust.sh -y

# `CONN_STR` env var only for Docker image
ENV CONN_STR="mysql://root:supersecret@mysql-container:3306/test_db"

# Add Rust binaries to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# Set up environment variables
ENV RUST_LOG="debug"

# Create and set working directory for the app
ENV APP_DIR="/home/app"
RUN mkdir -p ${APP_DIR}
WORKDIR ${APP_DIR}

# Copy application files
ADD . ${APP_DIR}

# Verify cargo is available and build the application
RUN cargo build

# Run the application
CMD ["/root/.cargo/bin/cargo", "run"]
