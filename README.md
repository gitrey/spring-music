## Spring Music: A Cloud Foundry Sample Application

This repository contains a sample application demonstrating the use of various database services on Cloud Foundry with the Spring Framework and Spring Boot.

## Description

The Spring Music application showcases how to integrate different persistence technologies (relational, document, and key-value stores) into a single Spring Boot application. It allows you to store and manage music album data using services like MySQL, PostgreSQL, MongoDB, and Redis, all within the same project. 

While this is not a realistic representation of a real-world use case, it provides a valuable platform for:

* **Testing**: Experiment with different Cloud Foundry services.
* **Learning**: Understand how to configure Spring Boot applications to connect to various data sources.
* **Exploration**: Gain insights into the strengths and weaknesses of different persistence technologies.

## Features

* **Multiple Data Sources**: The application supports various persistence technologies, including:
    * Relational databases (MySQL, PostgreSQL)
    * NoSQL databases (MongoDB)
    * Key-value stores (Redis)
* **Spring Profiles**: It utilizes Spring profiles to dynamically configure the application based on the selected database service.
* **Cloud Foundry Integration**:  Leverages the Java CFEnv library to detect and utilize Cloud Foundry service bindings.
* **Spring Java Configuration**: Employs Spring Java configuration and bean profiles for seamless configuration.
* **Example Domain Objects**: Provides a basic `Album` domain model to demonstrate data storage.
* **Simple Web Interface**: Includes a basic web interface for managing album data.

## Installation

1. **Prerequisites**:
    * Java 17 or higher
    * [Cloud Foundry CLI](https://docs.cloudfoundry.org/devguide/installcli.html) 
    * [Git](https://git-scm.com/downloads)
    * [Docker](https://www.docker.com/products/docker-desktop)

2. **Clone the repository**:
    ```bash
    git clone https://github.com/gitrey/spring-music.git
    cd spring-music
    ```

3. **Build the application**:
    ```bash
    ./gradlew build
    ```

## Deployment

1. **Create a Cloud Foundry space**: 
    ```bash
    cf create-space my-space
    ```
2. **Target the newly created space**:
    ```bash
    cf target -s my-space
    ```
3. **Push the application to Cloud Foundry**: 
    ```bash
    cf push
    ```

**Note**: You'll need to create and bind the appropriate service instance to the application. Refer to the Cloud Foundry documentation for details on binding services to your application.

## Usage

Once deployed, you can access the Spring Music application through the provided web interface. 

* **Web Interface**: The web interface (accessible at your application's URL) provides functionality for:
    * Viewing a list of albums
    * Adding new albums
    * Editing existing albums
    * Deleting albums
* **API Endpoint**: 
    *  The application includes a REST API endpoint at `/albums` for programmatically interacting with the data.

## Contributing

Contributions are welcome! Please refer to the [CONTRIBUTING.md](CONTRIBUTING.md) file for details on contributing to this project.

## License

This project is licensed under the Apache License 2.0. See [LICENSE](LICENSE) for more details.


## Resources

* **Spring Framework**: [https://spring.io](https://spring.io)
* **Spring Boot**: [https://projects.spring.io/spring-boot/](https://projects.spring.io/spring-boot/)
* **Cloud Foundry**: [https://cloudfoundry.org](https://cloudfoundry.org)
* **Java CFEnv**: [https://github.com/pivotal-cf/java-cfenv](https://github.com/pivotal-cf/java-cfenv)
* **Cloud Foundry Documentation**: [https://docs.cloudfoundry.org/](https://docs.cloudfoundry.org/)

## Contact

If you have any questions or feedback, please feel free to contact us:

* **Issues**: Open an issue on the GitHub repository.
* **Discussions**: Join the discussions on the GitHub repository.

