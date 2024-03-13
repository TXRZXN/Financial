# Use an official Flutter image as a base image
FROM cirrusci/flutter:3.0.5

# Set the working directory
WORKDIR /app

# Copy the contents of the local directory to the working directory
COPY . .

# Run flutter pub get to fetch dependencies
RUN flutter pub get

# Run your Flutter application
CMD ["flutter", "run"]
