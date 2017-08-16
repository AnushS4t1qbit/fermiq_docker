# fermiq_docker
Docker Setup for FermiLib+ProjectQ=FermiQ.

This Docker image will help users to easily install [FermiLib](https://github.com/ProjectQ-Framework/FermiLib.git) and [ProjectQ](https://github.com/ProjectQ-Framework/ProjectQ). Check out Docker's [website](https://www.docker.com/what-container) that describes what a container image is and why it can be so useful. 

## What is included?
- Conda Python 3 (but you can also use Python 2 with one minor change in Dockerfile. See Dockerfile for instructions.)
- [ProjectQ](https://github.com/ProjectQ-Framework/ProjectQ) (git repo) 
- [FermiLib](https://github.com/ProjectQ-Framework/FermiLib.git) (git repo)

## Usage

To use this image, you first need to install [Docker](https://www.docker.com/).

After installing Docker, navigate to the `fermiq_docker` directory and build the Docker image:

```
docker build -t "1qbit/fermiq_docker" .
```

Finally, to run the image (assuming you're still inside your working directory), execute with `FermiQ` as the path to your working directory:

```
docker run -it -v $(pwd):/FermiQ -w /FermiQ 1qbit/fermiq_docker
```

When you're done using the Docker image, you can use `docker stop YOUR_CONTAINER_ID` or `docker kill YOUR_CONTAINER_ID` to stop your container (you can get your container ID by using the command `docker ps`).
