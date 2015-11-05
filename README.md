[![Codacy Badge](https://api.codacy.com/project/badge/grade/c5e085acfda54886be03676d92e91b7f)](https://www.codacy.com/app/Stratajet/ops_genie)


# OpsGenie

This gem is a work in progress and currently only allow the creation of alerts. 
The purpose is to provide a structure for further implementation of OpsGenie web api ( https://www.opsgenie.com/docs/web-api )

run `rails g ops_genie:install` to generate the intializer and set up the api key

# Usage :

`OpsGenie::Alert.create({message: "your message", description: "a description", another_parameter: "a value"})`
see https://www.opsgenie.com/docs/web-api/alert-api#createAlertRequest for the list of parameters. Use the ruby standard snake case for the keys, it'll be camelized
