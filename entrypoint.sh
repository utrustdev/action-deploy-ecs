#!/bin/sh -ue

task_definition=$1
service=$2
environment=$3
aws_role=$4
aws_ids=$5
aws_region=$6

case "${environment}-${cluster}" in
  "development-webservices")
    cluster_name="dev-webservices"
    ;;

  *)
    cluster_name="${environment}-${cluster}"
esac

/aws_config.sh $aws_ids $aws_role $aws_region

./ecs_update.sh $service $environment $cluster_name $task_definition
