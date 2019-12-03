#!/bin/sh -ue

task_definition=$1
branch=$2
service=$3
aws_ids=$4
aws_role=$5
aws_region=$6

/aws_config.sh $aws_ids

case ${branch/refs\/head\//} in
  master)
    env="development"
    cluster="dev-webservices"
    ;;

  mp/last-build-result)
    env="development"
    cluster="dev-webservices"
    ;;

  staging)
    env="staging"
    cluster="staging-webservices"
    ;;

  sandbox)
    env="sandbox"
    cluster="sandbox-webservices"
    ;;

  production)
    env="production"
    cluster="production-webservices"
    ;;
esac

./ecs_update.sh $service $env $cluster $task_definition
