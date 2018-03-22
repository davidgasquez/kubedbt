# Kubedbt

Run, schedule, and manage your [`dbt` (data build tool)](https://www.getdbt.com/) jobs using Kubernetes!

## Requirements

Since this projects uses different tools, you'll need to have access to a Kubernetes cluster and to a [`dbt` suported database](https://docs.getdbt.com/docs/supported-databases).

## Usage

First, replace the sample project called `project-test` with yours. The tool `dbt` also expect a `profile.yaml` file you can [create following the official instructions](https://docs.getdbt.com/docs/configure-your-profile) if you don't have one.

In my case, I created a `.dbt_profiles` in the root folder to store the credentials for this specific project. The `Makefile` is using it in all the local commands. Make sure you change the `PROFILES_PATH` if you sotre the profile in a different path!

The same profile must be added also to Kubernetes as a [Secret](https://kubernetes.io/docs/concepts/configuration/secret/). To do that you can run `kubectl create secret generic dbt-profile --from-file=profile=/path/to/your/.dbt_profiles.yml`.

At this point, if the `dbt run` command is working locally, tweak the schedule and other parameters in `dbt-conjob.yaml` and  deploy to Kubernetes with `make deploy`. This should start running your `dbt` model with your custom _schedule_!

## License

Copyright (c) David Gasquez
Licensed under the MIT license.
