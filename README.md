# Kubedbt

[![Build Status](https://travis-ci.org/davidgasquez/kubedbt.svg?branch=master)](https://travis-ci.org/davidgasquez/kubedbt)
![license](https://img.shields.io/github/license/mashape/apistatus.svg)

Run, schedule, and manage your [`dbt` (data build tool)](https://www.getdbt.com/) jobs using Kubernetes!

## Requirements

Since this projects uses different tools, you'll need to have access to a Kubernetes cluster and to a [`dbt` suported database](https://docs.getdbt.com/docs/supported-databases).

## Usage

First, replace the sample project called `project-test` with yours. The tool `dbt` also expect a `profile.yaml`. This file will be generated from the environmental variables you can specify in the default [profile](dbt/profile/profiles.yml). You can alternatively [create one following the official instructions](https://docs.getdbt.com/docs/configure-your-profile).

At this point, if the `dbt run` command is working locally, tweak the schedule and other parameters in `dbt-conjob.yaml` and  deploy to Kubernetes with `make deploy`. This should start running your `dbt` model with your custom _schedule_!

## License

Copyright (c) David Gasquez
Licensed under the MIT license.
