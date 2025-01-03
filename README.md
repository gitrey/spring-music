## Spring Music: A Cloud Foundry Sample Application

This repository contains a sample Spring Boot application demonstrating database service usage on Cloud Foundry.

## Description

Spring Music demonstrates how to connect to different database services (relational, document, and key-value stores) on Cloud Foundry using the Spring Framework and Spring Boot. It allows you to store the same domain objects in various persistence technologies like:

* **Relational Database (MySQL, PostgreSQL, SQL Server, H2)**
* **Document Database (MongoDB)**
* **Key-Value Store (Redis)**

**Note:** This application is not meant to represent a realistic use case for these technologies as you would typically choose the most suitable one based on your data requirements. However, it serves as a valuable tool for testing and experimenting with different Cloud Foundry services.

## Features

* **Multi-Persistence:**  Connects to various database services using Spring profiles and service bindings.
* **Cloud Foundry Environment Awareness:** Uses the Java CFEnv library to detect and leverage Cloud Foundry environment variables.
* **Web Interface:**  A simple AngularJS-based web application for interacting with the stored data.
* **Error Handling:** Provides endpoints for simulating errors (like crashing the application or throwing exceptions) to test Cloud Foundry health monitoring and restarting capabilities.
* **Jupyter Notebook Integration:**  Includes a Jupyter Notebook demonstrating how to interact with the application and data from a separate environment.

## Installation

1. **Prerequisites:**
    * Java Development Kit (JDK) 17 or later
    * Cloud Foundry CLI
    * Git
    * Maven or Gradle (build tool)

2. **Clone the Repository:**
   ```bash
   git clone https://github.com/gitrey/spring-music.git
   cd spring-music
   ```

3. **Build the Application:**
   ```bash
   ./gradlew build
   ```
   (or use `mvn clean package` if you prefer Maven)

4. **Deploy to Cloud Foundry:**
   ```bash
   cf push
   ```
   This will deploy the application and automatically bind any configured database services.

## Usage

Once deployed, you can access the Spring Music application using the URL provided by Cloud Foundry.

The web interface allows you to:

* **View all Albums:**  See a list of albums and their details.
* **Add Albums:**  Create new album entries.
* **Edit Albums:**  Modify existing album information.
* **Delete Albums:**  Remove albums from the database.
* **Test Error Handling:**  Trigger various error scenarios to test Cloud Foundry's error handling and restarting capabilities.

## Contributing

Contributions to Spring Music are welcome! Please follow these guidelines:

1. **Fork** the repository.
2. **Create a new branch** for your feature or bug fix.
3. **Make your changes** and write tests to ensure your code works as expected.
4. **Commit your changes** with a clear and concise commit message.
5. **Push your branch** to your forked repository.
6. **Submit a pull request** to the main repository.

## License

Spring Music is licensed under the Apache 2.0 License.

## Contact

For any questions, suggestions, or support requests, please reach out through:

* **GitHub:** [link to GitHub repository]
* **Issues:** [link to GitHub issues]

We appreciate your interest in Spring Music and look forward to your contributions!

