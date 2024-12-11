## Spring Music: Cloud Foundry Database Sample Application

**[![Build Status](https://github.com/cloudfoundry-samples/spring-music/workflows/CI/badge.svg)](https://github.com/cloudfoundry-samples/spring-music/actions)**
**[![GitHub release](https://img.shields.io/github/release/cloudfoundry-samples/spring-music.svg)](https://github.com/cloudfoundry-samples/spring-music/releases)**
**[![License](https://img.shields.io/github/license/cloudfoundry-samples/spring-music.svg)](https://github.com/cloudfoundry-samples/spring-music/blob/main/LICENSE)**

### Description

Spring Music is a sample application showcasing the integration of various database services (relational, document, and key-value stores) with the Spring Framework on Cloud Foundry.  This application demonstrates how to leverage service bindings to connect to different databases, making it a valuable resource for learning and experimenting with Cloud Foundry's capabilities.

### Features

* **Multiple Persistence Technologies:**  The application is configured to use one of the following persistence technologies:
    * **Relational Databases:** MySQL, PostgreSQL, Oracle, SQL Server
    * **Document Database:** MongoDB
    * **Key-Value Store:** Redis 
* **Spring Boot Profiles:** The application utilizes Spring Boot profiles for flexible configuration based on the chosen database technology.
* **Cloud Foundry Service Bindings:** Spring Music demonstrates how to use Cloud Foundry service bindings to automatically connect to bound database services.
* **Java CFEnv Library:** The application utilizes the Java CFEnv library to inspect the Cloud Foundry environment and extract service connection details.
* **Web Application:**  The application includes a simple web interface for managing albums, allowing for interactive testing.

### Installation

1. **Prerequisites:**
    * Java 17 or later (for the latest version)
    * Cloud Foundry CLI ([http://docs.cloudfoundry.org/cf-cli/](http://docs.cloudfoundry.org/cf-cli/))
2. **Clone the repository:**
    ```bash
    git clone https://github.com/cloudfoundry-samples/spring-music.git
    ```
3. **Build the application:**
    ```bash
    cd spring-music
    ./gradlew clean assemble
    ```

### Usage

#### Running Locally

1. **Select a database profile:**
    * `mysql`, `postgres`, `mongodb`, `redis`, or `oracle`
    * If no profile is provided, the application will use an in-memory relational database.
2. **Start the application:**
    ```bash
    java -jar -Dspring.profiles.active=<profile> build/libs/spring-music-1.0.jar
    ```
    * If you are using a profile other than `in-memory`, ensure the corresponding database server is running.
3. **Access the web application:**
    * Open a web browser and navigate to `http://localhost:8080/`.

#### Running on Cloud Foundry

1. **Target and log in to your Cloud Foundry instance:**
    ```bash
    cf target <your-cloud-foundry-instance>
    cf login
    ```
2. **Push the application:**
    ```bash
    cf push
    ```
3. **Create and bind database services (if needed):**
    * Refer to the [Cloud Foundry documentation](http://docs.cloudfoundry.org/buildpacks/java/spring-service-bindings.html) for instructions on binding database services. 
    * The provided `manifest.yml` file will automatically create the application without an external database (in the `in-memory` profile).
    * Use `cf create-service <service> <service-plan> <service-name>` and `cf bind-service <app-name> <service-name>` to create and bind services.
    * After binding a service, restart the application (`cf restart <app-name>`) to apply the changes.

### Contributing

We welcome contributions to Spring Music! Here's how you can get involved:

1. **Fork the repository.**
2. **Create a branch for your feature or bug fix.**
3. **Make your changes and commit them with clear and concise messages.**
4. **Push your branch to your fork.**
5. **Submit a pull request to the main repository.**

### License

Spring Music is licensed under the Apache 2.0 License.

### Contact

For any questions or feedback, please feel free to:

* Open an issue on the GitHub repository.
* Join the Cloud Foundry community forum.


**We encourage you to experiment with different database services and explore the features of Spring Music.**
