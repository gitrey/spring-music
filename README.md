## Spring Music - A Sample Cloud Foundry Application

This repository contains a sample application demonstrating the use of database services on [Cloud Foundry](http://cloudfoundry.org) with the [Spring Framework](http://spring.io) and [Spring Boot](http://projects.spring.io/spring-boot/).

## Description

This application showcases how to integrate different persistence technologies (relational, document, and key-value stores) within a single Spring Boot application. It uses Java configuration and bean profiles to manage configurations for each store and leverages the [Java CFEnv](https://github.com/pivotal-cf/java-cfenv/) library to interact with the Cloud Foundry environment.

## Features

* **Multi-Persistence:** The application demonstrates the storage of the same domain objects (albums) in different persistence technologies:
    * Relational Database (MySQL, PostgreSQL, SQL Server, H2)
    * Document Store (MongoDB)
    * Key-Value Store (Redis)
* **Cloud Foundry Integration:** The application uses Cloud Foundry service bindings to configure database connections and automatically detects the appropriate persistence technology based on bound services.
* **Spring Boot Profiles:** Bean profiles are used to manage configurations for different persistence technologies, ensuring the application runs seamlessly with the chosen service.
* **RESTful API:** The application exposes a RESTful API to manage albums through CRUD operations.
* **Web User Interface:** A simple web interface allows users to view, add, edit, and delete albums.
* **Error Handling:** Includes examples of forcing application errors for testing purposes.
* **Application Information:** Provides endpoints to retrieve application information (profiles, services, and request details).

## Installation

1. **Prerequisites:**
    * Java 17
    * Maven or Gradle
    * Cloud Foundry CLI

2. **Clone the Repository:**

```bash
git clone https://github.com/gitrey/spring-music.git
```

3. **Build the Application:**

```bash
cd spring-music
./gradlew build
```

## Deployment

1. **Create a Cloud Foundry Service:**
    * Choose the desired database service (e.g., MySQL, PostgreSQL, MongoDB, Redis) and create a service instance using the Cloud Foundry CLI.

2. **Push the Application to Cloud Foundry:**
    * Update the `manifest.yml` file with the name of your service instance.
    * Use the Cloud Foundry CLI to push the application:

```bash
cf push
```

3. **Access the Application:**
    * Once the application is deployed, you can access it through the provided route in the Cloud Foundry CLI output.

## Usage

* **Web Interface:** Access the application's web interface to manage albums.
* **RESTful API:** Use curl or Postman to interact with the RESTful API endpoints:
    * **Get all albums:** `curl localhost:8080/albums`
    * **Get an album by ID:** `curl localhost:8080/albums/{id}`
    * **Add an album:** `curl -X PUT -H "Content-Type: application/json" -d '{ "artist": "Artist Name", "title": "Album Title", "releaseYear": "2023", "genre": "Rock" }' localhost:8080/albums`
    * **Update an album:** `curl -X POST -H "Content-Type: application/json" -d '{ "id": "{id}", "artist": "New Artist", "title": "New Album Title", "releaseYear": "2023", "genre": "Rock" }' localhost:8080/albums`
    * **Delete an album by ID:** `curl -X DELETE localhost:8080/albums/{id}`

## Contributing

Contributions are welcome! Please follow these steps:

1. **Fork the Repository.**
2. **Create a New Branch.**
3. **Make Your Changes.**
4. **Test Your Changes Thoroughly.**
5. **Submit a Pull Request.**

## License

This project is licensed under the Apache 2.0 License.

## Contact

If you have any questions or feedback, please feel free to contact the author at [email protected] or open an issue on the repository.

## Additional Information

* **Troubleshooting:**
    * Refer to the Cloud Foundry documentation for troubleshooting common issues.
* **Customization:**
    * Explore the codebase to customize the application's behavior or add new features.
* **Advanced Topics:**
    * Dive deeper into Spring Boot profiles, database configuration, and RESTful API design.
* **Real-World Applications:**
    * Consider using this application as a foundation for developing real-world applications utilizing Cloud Foundry services.

