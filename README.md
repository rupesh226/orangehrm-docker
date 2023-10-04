# OrangeHRM Docker Installation Guide

This repository provides a simple and straightforward method to deploy OrangeHRM via Docker, addressing common challenges related to database dependencies. This solution ensures smooth communication between the OrangeHRM application and its MariaDB database through Docker networking.

## Prerequisites

Ensure you have Docker installed on your machine. If not, you can get it from [Docker's official website](https://www.docker.com/get-started).

## Installation Steps

### 1. Cleanup previous installations

Before you start, make sure you remove any previous containers that might conflict with our setup.

```bash
docker rm -f orangehrm
docker rm -f mariadb
docker network rm orangehrm-tier
```

### 2. Set up Docker networking

To enable seamless communication between OrangeHRM and the MariaDB database, we will create a Docker network:

```bash
docker network create orangehrm-tier
```

### 3. Deploy MariaDB container

First, remove any existing `mariadb` container, then deploy a new MariaDB container:

```bash
docker rm -f mariadb
docker run --name mariadb \
  -e MYSQL_ROOT_PASSWORD=password \
  --net orangehrm-tier \
  -d mariadb:10.4.30
```

### 4. Deploy OrangeHRM application container

Remove any existing `orangehrm` container and deploy the OrangeHRM application:

```bash
docker rm -f orangehrm
docker run -d --name orangehrm -p 80:80 -p 443:443 \
  --net orangehrm-tier \
  orangehrm/orangehrm:5.5
```

### 5. Complete the Setup

Once the containers are up and running, you can access OrangeHRM at:

```
http://localhost/
```

Follow the on-screen instructions to complete the setup. If you need a visual guide, please refer to the attached video for reference.

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/eipouHV9k4E/0.jpg)](https://www.youtube.com/watch?v=eipouHV9k4E)

---

## Troubleshooting

If you encounter any issues during the installation process, please raise an issue in this repository or refer to OrangeHRM's official documentation.

## License

GNU General Public License
