FROM node:14-alpine

# Set working directory
WORKDIR /app

# Install necessary packages
RUN apk add --no-cache git bash

# Clone the tar1090 repository from GitHub
RUN git clone https://github.com/wiedehopf/tar1090.git

# Change directory to tar1090 and install its dependencies
WORKDIR /app/tar1090
RUN npm install

# Expose tar1090's default port (for ingress)
EXPOSE 8080

# Copy the add-on startup script from the repository root into the container
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Set entrypoint to our run script
CMD ["/run.sh"]
