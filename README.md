# Github Action - Deploy to ECS

Applies a given task definition to a running service, performing the aws authorizatoin via aws-actions.
It will also compute the ECS cluster and account based on the environment specified as input.

## Usage

```yaml
jobs:
  deploy:
    steps:
      - name: Deploy to ECS
        uses: utrustdev/action-deploy-ecs
        with:
          task-definition: ${{ steps.task_def.outputs.file }}
          service: <service>
          environment: <environment>
          aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws_role: <role-to-assume-in-the-deployment-account>
          aws_region: eu-central-1
          wait-for-service-stability: false # default to false
          force-new-deployment: true # will default to false
          role-duration-seconds: 1800 # default to 3600
```
