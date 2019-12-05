#!/bin/sh -ue

ids=$1
role=$2
region=$3

mkdir -p ~/.aws
# cat > ~/.aws.config << EOL
cat > test << EOL
[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}
EOL

function add_profile() {
  name=$(echo $1 | cut -d',' -f 1)
  aws_id=$(echo $1 | cut -d',' -f 2)
  role=$2
  region=$3

  echo $1
  # cat >> ~/.aws/config << EOL
  cat >> test << EOL

[profile $name]
role_arn = arn:aws:iam::$aws_id:role/$role
region = $region
source_profile = default
EOL
}

echo $ids | while read -r line; do
  add_profile $line $role $region
done
