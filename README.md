# drone-ecr-auth-v2
Based on omerxx/drone-ecr-auth, but using awscliv2
This is meant to be built on a x84 system

Pull Image
`docker pull jeffdyke/ecr-auth-v2`

Build your own
cd ecr-auth-v2
`REGION=co-area-n ./build.sh build`

Attach
`./build.sh attach`

While attached you should be able to run
`aws ecr get-login-password | docker login --username AWS --password-stdin 123456789.dkr.ecr.us-east-1.amazonaws.com`

If you don't see login succeeded, ensure the credentials are loaded in the image
`aws configure list`

TODO: Add Credential Helper
