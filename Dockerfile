# Use an official Ubuntu as a parent image
FROM ubuntu

# Install necessary packages
RUN apt-get update && \
    apt-get install -y git maven openjdk-11-jdk

# Set the working directory in the container
WORKDIR /usr/src/app

# Clone the Git repository into the container
RUN git clone https://github.com/vamsisiddireddy/mlhospital.git && cd ./mlhospital/Motivityhospital/ml-hospital-api/

# Build the application using Maven
RUN mvn clean install

# Expose port 8080
EXPOSE 8080

# Specify the command to run on container startup
CMD ["java", "-jar", "target/Max-Doctor-PatientApp-0.0.1-SNAPSHOT.jar"]
