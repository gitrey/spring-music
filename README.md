## Spring Music: A Sample Application for Database Services on Cloud Foundry

This README provides a comprehensive overview of the Spring Music application, a sample application demonstrating the use of database services on Cloud Foundry with the Spring Framework and Spring Boot.

## Table of Contents

1. **Introduction**
2. **Features**
3. **Prerequisites**
4. **Setup**
5. **Usage**
6. **Configuration**
7. **Running the Application**
8. **Cloud Foundry Deployment**
9. **Testing**
10. **License**
11. **Contributing**

## Introduction

Spring Music is a sample application designed to showcase various database services on Cloud Foundry, including:

* **Relational Databases:** MySQL, PostgreSQL, SQL Server, H2
* **NoSQL Databases:** MongoDB
* **Key-Value Stores:** Redis

This application stores the same domain objects in different persistence technologies, highlighting their usage and demonstrating how to configure Spring Boot applications for different service types on Cloud Foundry.

## Features

* **Multi-persistence:** Supports storing data in relational databases, document databases, and key-value stores.
* **Spring Boot Profiles:** Utilizes profiles for easy configuration based on the chosen database service.
* **Java CFEnv:** Leverages the Java CFEnv library to inspect the Cloud Foundry environment and bind services.
* **RESTful API:** Provides a RESTful API for interacting with stored music albums.
* **Web Interface:** Includes a basic web interface built using AngularJS for interacting with the API.
* **Error Handling:** Provides error handling mechanisms and examples to demonstrate error scenarios.

## Prerequisites

* **Java Development Kit (JDK) 17:** [https://www.oracle.com/java/technologies/javase-downloads.html](https://www.oracle.com/java/technologies/javase-downloads.html)
* **Gradle:** [https://gradle.org/install/](https://gradle.org/install/)
* **Cloud Foundry CLI:** [https://docs.cloudfoundry.org/devguide/cli/](https://docs.cloudfoundry.org/devguide/cli/)
* **Cloud Foundry Account:** [https://docs.cloudfoundry.org/](https://docs.cloudfoundry.org/)

## Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/gitrey/spring-music.git
   cd spring-music
   ```

2. **Install dependencies:**

   ```bash
   ./gradlew build
   ```

## Usage

The Spring Music application provides a RESTful API and a web interface for interacting with stored album data.

### RESTful API

* **Endpoint:** `/albums`
    * **GET:** Retrieve all albums.
    * **POST:** Create a new album.
    * **PUT:** Update an existing album.
    * **DELETE:** Delete an album.
* **Endpoint:** `/albums/{id}`
    * **GET:** Retrieve a specific album by ID.
    * **DELETE:** Delete a specific album by ID.

### Web Interface

The web interface provides functionalities for:

* Viewing all albums.
* Creating new albums.
* Editing existing albums.
* Deleting albums.
* Viewing application information (profiles, services).
* Triggering error scenarios (application termination, heap filling, exceptions).

## Configuration

The application uses Spring Boot profiles to switch between different database services. You can configure the application based on your chosen service by modifying the `application.yml` file.

## Running the Application

1. **Set the `JAVA_HOME` environment variable:**

   ```bash
   export JAVA_HOME="/path/to/your/jdk"
   ```

2. **Run the application locally:**

   ```bash
   ./gradlew bootRun
   ```

3. **Access the web interface:**

   Open your web browser and navigate to [http://localhost:8080](http://localhost:8080).

## Cloud Foundry Deployment

1. **Set the `CF_TARGET` environment variable:**

   ```bash
   export CF_TARGET="your_cloud_foundry_api_endpoint"
   ```

2. **Login to your Cloud Foundry account:**

   ```bash
   cf login -u your_username -p your_password -o your_organization -s your_space
   ```

3. **Push the application:**

   ```bash
   cf push
   ```

## Testing

You can run the application tests using:

```bash
./gradlew test
```

## License

Spring Music is licensed under the Apache 2.0 License.

## Contributing

Contributions are welcome! Please refer to our [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines.

