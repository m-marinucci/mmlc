# Use an official Python runtime as a base image
FROM python:3.8-buster

# Set the working directory in the container
WORKDIR /app

# Install system and build dependencies
# (include other dependencies as required)
RUN apt-get update && apt-get install -y \
    poppler-utils \
    tesseract-ocr \
    && rm -rf /var/lib/apt/lists/*

# Install Jupyter
RUN pip install jupyter

# Copy the current directory contents into the container at /app
COPY . /app

# Copy the startup script
COPY start-jupyter.sh /start-jupyter.sh

# Install Python packages from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make the script executable
RUN chmod +x /start-jupyter.sh

# Expose the port Jupyter will run on
EXPOSE 8888

# Run the startup script
CMD ["/start-jupyter.sh"]
