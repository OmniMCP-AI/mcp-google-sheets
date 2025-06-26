# Use an official Python runtime as a parent image
FROM python:3.7-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
ADD . /usr/src/app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir uv

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV SERVICE_ACCOUNT_PATH /usr/src/app/service-account-key.json
ENV DRIVE_FOLDER_ID YOUR_DRIVE_FOLDER_ID

# Run uvx when the container launches
CMD ["uvx", "mcp-google-sheets@latest"]
