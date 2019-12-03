# Github Action - Deploy to ECS

Applies a given task definition to a running service

## Usage

```
jobs:
  deploy:
    steps:
      - name: Deploy to ECS
        uses: utrustdev/actions-deploy-ecs@master
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        with:
          task-definition: ${{ steps.task_def.outputs.file }}
          service: <service>
          environment: ${{ github.event.deployment.environment }}
          aws_role: ci
          aws_region: ${{ secrets.AWS_REGION }}
          aws_ids: |
            qa,123123123
            sandbox,321321312
            production,098098098
```
