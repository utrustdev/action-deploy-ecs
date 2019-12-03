#!/bin/sh -ue

service=$1
environment=$2
cluster=$3
task_definition=$4

echo $service $environment $task_definition

exit 0

JQ="jq --raw-output --exit-status"

#
# Push task definition to ECS
#
revision=$(aws ecs register-task-definition \
  --cli-input-json file://$PWD/$task_definition \
  --profile $environment | \
  $JQ '.taskDefinition.taskDefinitionArn')

if [ $revision == "null" ]; then
  echo "failed to register task definition" >&2
  exit 1
fi

echo "revision: $revision"

#
# Update ECS service to use new task definition revision
#
result=$(aws ecs update-service \
  --cluster $cluster \
  --service $service \
  --task-definition $revision \
  --profile $environment | \
  $JQ '.service.taskDefinition')

if [[ $result != $revision ]]; then
  echo "error updating service" >&2
  exit 1
else
  echo "successfully deployed $revision to $service on $cluster"
fi
