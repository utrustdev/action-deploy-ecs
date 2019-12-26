FROM naps62/awscli:2019-12-26

COPY entrypoint.sh aws_config.sh ecs_update.sh /

ENTRYPOINT ["/entrypoint.sh"]
