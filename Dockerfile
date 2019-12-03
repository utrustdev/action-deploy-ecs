FROM naps62/awscli:2019-11-27

COPY entrypoint.sh aws_config.sh /

ENTRYPOINT ["/entrypoint.sh"]
