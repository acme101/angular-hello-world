# angular-hello-world [![Build Status](https://travis-ci.org/acme101/angular-hello-world.svg?branch=develop)](https://travis-ci.org/acme101/angular-hello-world)


This project was created from [angular-boilerplate](https://github.com/acme101/angular-boilerplate)
version 0.2.0.


# Getting started

Follow: https://github.com/acme101/dev-setup/blob/master/README.md


## Generate `node_modules`

Usually, we need `node_modules` to check out the used source code of dependencies.

Use this:

```
$ cd ~/acme-dev
$ vagrant ssh
$ ahw # alias to cd fastly to the workspace/angular-hello-world project
$ docker run --rm -v $(pwd):/opt/app -w /opt/app node:6-alpine yarn
```

After that, the `node_modules` directory from the host should be updated.

Note that this `node_modules` package is safe to checkout, delete, modify because is not used by
the running dev Docker container.

## Code scaffolding

Open a new terminal window and `ssh` into the `acme-dev` VM:

```
$ cd ~/acme-dev
$ vagrant ssh
$ ws
$ cd angular-hello-world
$ docker-compose run --rm dev <ng command>
```

<ng command> could be `ng generate component component-name` to generate a new component. You can
also use `ng generate directive/pipe/service/class/module`.

Remember to sync back the generated files to the host machine with `$ vagrant rsync-back`:
http://dev.teracy.org/docs/basic_usage.html#file-sync


## Run code linting

Run `$ docker-compose run --rm dev yarn run lint` to execute the code lint checking.


## Run unit tests

Run `$ docker-compose run --rm dev yarn run test` to execute the unit tests via [Karma](https://karma-runner.github.io).

This will keep the tests running and watching the file changes.

To run unit tests without file watching, run `$ docker-compose run --rm dev ng test --browsers Chrome_no_sandbox -w false`


## Run end-to-end tests

Run `$ docker-compose run --rm dev yarn run e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).


## Run the bash command on the running Dev Docker image

Run `$ docker-compose exec dev /bin/bash`


## Build the Prod Docker image

On the 4th terminal `ssh-ed` terminal window:

```
$ docker-compose exec dev ng build --prod
$ docker-compose -f docker-compose.prod.yml build
```

to build the project and the prod Docker image. The build artifacts will be stored in the `dist/`
directory.


## Run the Prod Docker image

```
$ docker-compose -f docker-compose.prod.yml up
```

And open http://ahw.acme.dev or https://ahw.acme.dev to see the app in production mode served by Nginx.


## Review others' work and PRs (pull requests)


To review work and PRs submitted by others, for example, with `hoatle/angular-hello-world:develop`
Docker image, run the following command:

```
$ docker-compose -f docker-compose.review.yml stop && docker-compose -f docker-compose.review.yml rm -f
$ export DOCKER_IMAGE_REVIEW=hoatle/angular-hello-world:develop && \
  docker-compose -f docker-compose.review.yml pull && \
  docker-compose -f docker-compose.review.yml up
```

And open review.ahw.acme.dev to review different prod Docker images on local dev.

Press Ctrl + c to stop reviewing.

## Contribute to angular-hello-world project

- Fork the repo

- Enable this repo on travis-ci.org with the following settings key - value.
  In the *Name* and *Value* fields, please add the info below correlatively: 
  + Fill in "DOCKER_IMAGE" into the *Name* field, and project Docker image for *Value*, for example, "hoatle/angular-boilerplate" value (will be pushed to https://hub.docker.com/r/hoatle/angular-boilerplate/)
  + Fill in "DOCKER_USERNAME" into the *Name* field and your Docker username into the *Value* field
  + Fill in "DOCKER_PASSWORD" into the *Name* field and your Docker password into the *Value* field

- Test, Fix bug, Improve, Add new features on the project issues with pull requests.

## Further help

To get more help on the `angular-cli` use `ng help` or go check out the
[Angular-CLI README](https://github.com/angular/angular-cli/blob/master/README.md).

## License

MIT, see the LICENSE file.
