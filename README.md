# Packer Redis AWS AMI

A packer project that builds an AWS AMI with redis-server installed.

## Prerequisites

* Install [Packer](https://www.packer.io/downloads.html).
* Ruby version ~> 2.5.1 for running KitchenCI test.

## Building the box with Packer

Set AWS credentials according to AWS [documentation](https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html).

The packer template is in `template.json` file. In the `variables` section you can set parameters to customize the build. Help on setting, overriding variables in packer can be found [here](https://www.packer.io/docs/templates/user-variables.html#setting-variables).

* `aws_base_ami_id`  - the base AMI to use. It needs to be accessible with the provided AWS credential.

Run `packer validate template.json` - to make basic template validation.

Run `packer build template.json` - to build the AWS AMI with packer.

## Testing with KitchenCI

The project includes a KitchenCI configuration to run basic tests against the box outputted from packer.

To run it you need to install the gems specified in the `Gemfile`. Its recommended to use ruby [`bundler`](https://bundler.io/).

### Installing gems with bundler:

* `gem install bundler`
* `bundle install`

### Setup

Kitchen will need AWS access to manage an EC2 instance life cycle. Credentials need to be set according to the AWS [documentation](https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/setup-config.html) for Ruby SDK. 

Note: that the AWS region must be set as environment variable `export AWS_REGION=my-region` or added as key `driver.region` in `.kitchen.yml`. Using the `~/.aws/config` to set the region will not work.

By default the test will check the latest AMI which name matches `ubuntu-redis-*`. In case a different AMI needs to be tested modify the key `driver.image_search.name` under platform `ubuntu-webcounter` in `.kitchen.yml`

### Running Kitchen tests

* `bundle exec kitchen converge` - will build the test environment.
* `bundle exec kitchen verify` - will run the tests.
* `bundle exec kitchen destroy` - will destroy the test environment.
* `bundle exec kitchen test` - will perform the above steps with a single command.
