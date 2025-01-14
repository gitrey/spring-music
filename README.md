## Spring Music: A Spring Boot Application for Cloud Foundry

This repository contains a sample application demonstrating how to use database services on Cloud Foundry with the Spring Framework and Spring Boot.

## Project Overview

This application allows you to store the same domain objects in a variety of different persistence technologies:

* **Relational Databases:** MySQL, PostgreSQL, SQL Server, H2
* **Document Store:** MongoDB
* **Key-Value Store:** Redis

While this is not a realistic representation of real-world use cases (where you'd typically choose the most appropriate database for your data), it's ideal for testing and experimenting with various services on Cloud Foundry.

The application utilizes:

* **Spring Java Configuration:** For configuring the application and connection objects.
* **Bean Profiles:** To activate specific database configurations based on the service bound to the application.
* **Java CFEnv:** To inspect the Cloud Foundry environment for service bindings.

## Getting Started

1. **Clone the Repository:**
```bash
git clone https://github.com/your-username/spring-music.git
```

2. **Install Dependencies:**
```bash
cd spring-music
./gradlew build
```

3. **Push to Cloud Foundry:**
```bash
cf push
```

4. **Bind Services:**
Bind the application to the desired service:
```bash
cf bind-service spring-music <service-name>
```
Replace `<service-name>` with the name of the service instance you created.

## Exploring the Application

Once deployed, the application will be accessible at the assigned route. You can navigate to different URLs to interact with the application:

* **`/albums`:** View, add, update, and delete albums.
* **`/errors`:** Test error handling mechanisms (e.g., force application exit, throw an exception).
* **`/info/appinfo`:** Retrieve information about the application's active profiles and bound services.
* **`/info/service`:** View details about the bound services.

## Configuration

The application is configured using Spring Boot's `application.yml` file. You can modify the properties for different database types.

## Contributing

We welcome contributions! Please open an issue or submit a pull request for any changes or improvements.

## License

This project is licensed under the Apache 2.0 License.

## Contact

For any questions or feedback, please contact us at [your-email@example.com].

