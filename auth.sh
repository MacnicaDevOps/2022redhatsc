#!/bin/bash

echo $key>key.json
gcloud auth activate-service-account --key-file=key.json
gcloud beta container clusters get-credentials $cluster --region $region --project $project
alias oc="kubectl"
