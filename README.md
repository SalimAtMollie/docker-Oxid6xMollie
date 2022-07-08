<h1 align="center">
  <img alt="mollie Oxid logo" src="./Oxid6xMollie.png" width="224px"/><br/>
  Docker container with Oxid (including Mollie plugin)
</h1>
<p align="center">Create a new test-ready Oxid webshop with <b>database</b> (MySql), <b>frontend</b> (PHP)<br/>and <b>email testing</b> (MailHog) by running a few CLI commands.

## 🐳 Docker-way to ⚡️ Quick start

First, [download](https://docs.docker.com/engine/install/) and install the **Docker Engine**. Version `4.9.1` is recommended.

Installation is done by downloading this repo with the **[`git clone`](https://git-scm.com/docs/git-clone)** command in terminal:

```bash
git clone https://github.com/SalimAtMollie/docker-Oxid6xMollie MollieOxid
```

Let's enter that new downloaded project via the **cd** command:

```bash
cd MollieOxid
```

Next, we will run the command which will use the **[`docker-compose`](https://docs.docker.com/compose/)** file to set up the containers needed for the website. If you're ready, we can **start the installation** with:

```bash
docker-compose up --build
```

That's all you need to do to start! 🎉

> 🔔 Please note: Once the **installation is complete**, you will have to **add the live/test keys** in the Mollie plugin settings and **activate it**.

## ⚙️ .env Options

This shows the options you may change in the .env file.


| Option | Description                                              | Type   | Default |
|--------|----------------------------------------------------------|--------|---------|
| `DOMAIN`   | Domain url of the website. | `string` | `oxid6.localhost` |
| `OXID_VERSION`   | Version number of [the oxid metapackage](https://packagist.org/packages/oxid-esales/oxideshop-metapackage-ce). | `string` | `dev-b-6.4-ce` |
| `OXID_DEMODATA`   | Adds demodata to the MySql database. | `bool` | `true` |
| `APACHE_PORT`   | Port for the apache container. | `int` | `80` |
| `MAILHOG_PORT`   | Port for the mailHog container. | `int` | `8025` |
| `PHPMYADMIN_PORT`   | Port for the PHP My Admin container. | `int` | `8080` |
| `MYSQL_DATABASE`   | Name for MySql databse. | `string` | `oxid6` |
| `MYSQL_USER`   | Username for MySql databse. | `string` | `oxid6` |
| `MYSQL_PASSWORD`   | Password for MySql databse. | `string` | `UX6rg8AsaiR2` |
| `MYSQL_ROOT_PASSWORD`   | Root password for MySql databse. | `string` | `DaZs82An!Hd3q#3uqdqB` |
