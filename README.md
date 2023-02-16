# Github Action - Deploy to ECS

Applies a given task definition to a running service

## Usage

```yaml
jobs:
  deploy:
    steps:
      - name: Configure AWS credentials
        id: aws_credentials
        uses: aws-actions/configure-aws-credentials@v1-node16
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: aws-region-1

      - name: Deploy to ECS
        uses: utrustdev/actions-deploy-ecs@master
        with:
          task-definition: ${{ steps.task_def.outputs.file }}
          service: <service>
          cluster: <cluster>
          aws_role: arn:aws:iam::111111111111:role/my-github-actions-role-test
          aws_region: ${{ secrets.AWS_REGION }}
```
