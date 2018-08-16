# Kubedbt

[![Build Status](https://travis-ci.org/davidgasquez/kubedbt.svg?branch=master)](https://travis-ci.org/davidgasquez/kubedbt)

Run, schedule, and manage your [`dbt` (data build tool)](https://www.getdbt.com/) jobs using Kubernetes!

## Requirements

Since this projects uses different tools, you'll need to have access to a Kubernetes cluster and to a [`dbt` suported database](https://docs.getdbt.com/docs/supported-databases).

## Usage

First, replace the sample project called `project-test` with yours or use this one as a test.
The tool `dbt` also expect a `profiles.yaml` file with the connection details.
The best option is to let `dbt` generate it from the environmental variables you can specify in the default [profile](project-test/profile/profiles.yml).

If that doesn't work for you, you can also [create a profile following the official instructions](https://docs.getdbt.com/docs/configure-your-profile) and mount it using Docker volumes ([example](https://github.com/davidgasquez/dbt-docker#getting-started)).

At this point, if the `dbt run` command is working locally, tweak the schedule and other parameters in `dbt-conjob.yaml`, create the proper secrets in Kubernetes and deploy with `make deploy`. This should start running your `dbt` model with your custom _schedule_!

## License

Copyright (c) David Gasquez
Licensed under the MIT license.
