# symfony3-apache-PHP7-Xdebug-docker
A repository which has everything great in it. Almost.

Clone the repository somewhere warm on your computer, by running this command:

```
youruser: $ git clone https://github.com/Larsouille/symfony3-apache-PHP7-Xdebug-docker.git
```

Then, you have to build the image running:

```
youruser:where/the/dockerfile/is $ docker build -t thenameofyourimage .
```

Don't forget the "." at the end of the command!


Tadam!
If everything went right, you probably ended with a wonderful ready to run docker image!


Also, you would run it with this command:
```
youruser: $ docker run theimageyouwannarun
```

Or list all images you made running:
```
youruser: $ docker images
```

Or list all containers:
```
youruser: $ $ docker ps # Lists only running containers
youruser: $ $ docker ps -a # Lists all containers
```


The file "docker-compose.yml" has to be in the root of the future project.
(But, you'll still have to install docker compose first... here: https://docs.docker.com/compose/install/ )

This done, start using this command:

```
youruser:where/the/dockercomposefile/is $ docker-compose up
```

If you need help, here's the documentation:

https://docs.docker.com/


Thanks to: https://github.com/ajanssens :)
