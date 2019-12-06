#!/bin/sh -ue

task_definition=$1
service=$2
cluster=$3
environment=$4
aws_role=$5
aws_region=$6
aws_ids=$7

case "${environment}-${cluster}" in
  "development-webservices")
    cluster_name="dev-webservices"
    ;;

  *)
    cluster_name="${environment}-${cluster}"
esac

echo "running aws_config"
/aws_config.sh $aws_ids $aws_role $aws_region

echo "ecs_update"
/ecs_update.sh $service $environment $cluster_name $task_definition
