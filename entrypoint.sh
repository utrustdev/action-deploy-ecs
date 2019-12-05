#!/bin/sh -ue

task_definition=$1
service=$2
cluster=$3
environment=$4
aws_role=$5
aws_ids=$6
aws_region=$7

case "${environment}-${cluster}" in
  "development-webservices")
    cluster_name="dev-webservices"
    ;;

  *)
    cluster_name="${environment}-${cluster}"
esac

./aws_config.sh $aws_ids $aws_role $aws_region

./ecs_update.sh $service $environment $cluster_name $task_definition
