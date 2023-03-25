#!/bin/bash

aws cloudformation package --template-file cloudformation.yaml --s3-bucket mipaquete-cfn-templates --output-template-file packaged.yaml
aws cloudformation deploy --template-file packaged.yaml --stack-name mpr-prod --tags project=mpr --capabilities CAPABILITY_NAMED_IAM --parameter-overrides \
    ProjectName=mpr \
    EnvType=prod \
    minSize=2 \
    maxSize=4 \
aws cloudformation update-termination-protection --stack-name mpr-prod --enable-termination-protection