# Hashtopolis Docker Agent
Hashtopolis Docker Agent is a Hashtopolis agent running in a Docker container that allows you to easily add and remove agents from your Hashtopolis system. This agent can be used for distributed task execution on multiple computers.

## Building the Image
To build the Docker image, run the following command:
```bash
docker build -t romaxa55/hashtopolis .
docker build -t romaxa55/hashtopolis:latest --build-arg BASE_IMAGE=dizcza/docker-hashcat .
docker build -t romaxa55/hashtopolis:pocl --build-arg BASE_IMAGE=dizcza/docker-hashcat:pocl .
docker build -t romaxa55/hashtopolis:cuda --build-arg BASE_IMAGE=dizcza/docker-hashcat:cuda .

```

## Running the Container
To run the Docker container, use the following command:

```bash
docker run --rm -d \
-e SERVER_URL="http://www.example:8080" \
-e TOKEN="token" \
romaxa55/hashtopolis
```

## Agent Configuration

To configure the Hashtopolis agent, you need to set the following environment variables:

* `SERVER_URL`: the URL of your Hashtopolis server.
* `TOKEN`: the access token for your Hashtopolis server.
```bazaar
export TOKEN="sdad"
export SERVER_URL="http://www.example:8080"
```

These environment variables can be set using the -e flag when running the Docker container.

## Building the Hashtopolis Agent
The Hashtopolis agent is downloaded and built automatically when the Docker container is started. The agent can be found in the `/app` directory inside the container.

## Customization

You can customize the Docker image by modifying the `Dockerfile`. For example, you can install additional dependencies or add new configuration files.

## Contributing
If you find a bug or have a feature request, please open an issue on the GitHub repository. Pull requests are welcome.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

